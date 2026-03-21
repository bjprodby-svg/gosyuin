#!/bin/bash

# ============================================================
# GosyuinMap × Google Places API (New) 検証スクリプト
# ============================================================
# 事前準備:
# 1. Google Cloud Console → APIs & Services → Enable "Places API (New)"
# 2. Credentials → Create API Key
# 3. 環境変数 PLACES_API_KEY をセット、または下の変数を直接書き換え
# ============================================================

API_KEY="${PLACES_API_KEY:-YOUR_API_KEY_HERE}"

if [ "${API_KEY}" = "YOUR_API_KEY_HERE" ]; then
  echo "エラー: API Key が未設定です。"
  echo "  export PLACES_API_KEY=\"your-key\" で設定するか、スクリプト内を直接編集してください。"
  exit 1
fi

# 色付き出力
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo "============================================"
echo " GosyuinMap - Places API (New) 検証"
echo "============================================"
echo ""

# ––––––––––––––––––––––––––––
# TEST 1: Text Search で「御朱印 神社」を検索
# → place_of_worship で日本の神社が拾えるか確認
# ––––––––––––––––––––––––––––

echo -e "${CYAN}[TEST 1] Text Search: 「御朱印 神社 東京」${NC}"
echo "–––––––––––––––––––––––"

curl -s -X POST \
  "https://places.googleapis.com/v1/places:searchText" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: ${API_KEY}" \
  -H "X-Goog-FieldMask: places.id,places.displayName,places.formattedAddress,places.types,places.primaryType,places.rating,places.userRatingCount" \
  -d '{
    "textQuery": "御朱印 神社 東京",
    "languageCode": "ja",
    "maxResultCount": 5
  }' | python3 -m json.tool 2>/dev/null || echo "(python3 not found - raw JSON output above)"

echo ""
echo ""

# ––––––––––––––––––––––––––––
# TEST 2: Text Search で「御朱印 お寺 京都」を検索
# → 寺院もカバーされるか確認
# ––––––––––––––––––––––––––––

echo -e "${CYAN}[TEST 2] Text Search: 「御朱印 お寺 京都」${NC}"
echo "–––––––––––––––––––––––"

curl -s -X POST \
  "https://places.googleapis.com/v1/places:searchText" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: ${API_KEY}" \
  -H "X-Goog-FieldMask: places.id,places.displayName,places.formattedAddress,places.types,places.primaryType,places.rating" \
  -d '{
    "textQuery": "御朱印 お寺 京都",
    "languageCode": "ja",
    "maxResultCount": 5
  }' | python3 -m json.tool 2>/dev/null

echo ""
echo ""

# ––––––––––––––––––––––––––––
# TEST 3: Nearby Search で place_of_worship type フィルター
# → 浅草周辺(35.7148, 139.7967)で type 指定の精度確認
# ––––––––––––––––––––––––––––

echo -e "${CYAN}[TEST 3] Nearby Search: 浅草周辺 place_of_worship${NC}"
echo "–––––––––––––––––––––––"

curl -s -X POST \
  "https://places.googleapis.com/v1/places:searchNearby" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: ${API_KEY}" \
  -H "X-Goog-FieldMask: places.id,places.displayName,places.formattedAddress,places.types,places.primaryType" \
  -d '{
    "includedTypes": ["place_of_worship"],
    "locationRestriction": {
      "circle": {
        "center": { "latitude": 35.7148, "longitude": 139.7967 },
        "radius": 2000.0
      }
    },
    "languageCode": "ja",
    "maxResultCount": 10
  }' | python3 -m json.tool 2>/dev/null

echo ""
echo ""

# ––––––––––––––––––––––––––––
# TEST 4: Place Details + AI Summary (明治神宮)
# → まず明治神宮の place_id を取得してから Details を叩く
# ––––––––––––––––––––––––––––

echo -e "${CYAN}[TEST 4] AI Summary 検証 (明治神宮)${NC}"
echo "–––––––––––––––––––––––"
echo -e "${YELLOW}Step 4a: place_id 取得…${NC}"

MEIJI_RESPONSE=$(curl -s -X POST \
  "https://places.googleapis.com/v1/places:searchText" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: ${API_KEY}" \
  -H "X-Goog-FieldMask: places.id,places.displayName" \
  -d '{
    "textQuery": "明治神宮 渋谷区",
    "languageCode": "ja",
    "maxResultCount": 1
  }')

echo "${MEIJI_RESPONSE}" | python3 -m json.tool 2>/dev/null

# place_id を抽出
PLACE_ID=$(echo "${MEIJI_RESPONSE}" | python3 -c "
import json, sys
data = json.load(sys.stdin)
places = data.get('places', [])
if places:
    print(places[0]['id'])
" 2>/dev/null)

if [ -z "${PLACE_ID}" ]; then
  echo -e "${YELLOW}⚠ place_id の自動抽出に失敗。上の結果から places[0].id をコピーして手動で実行:${NC}"
  echo ""
  echo "  curl -s -X GET \\"
  echo "    \"https://places.googleapis.com/v1/places/PLACE_ID_HERE?languageCode=ja\" \\"
  echo "    -H \"X-Goog-Api-Key: ${API_KEY}\" \\"
  echo "    -H \"X-Goog-FieldMask: id,displayName,generativeSummary,editorialSummary,reviews\" \\"
  echo "    | python3 -m json.tool"
else
  echo ""
  echo -e "${YELLOW}Step 4b: Place Details + AI Summary (place_id: ${PLACE_ID})${NC}"
  echo ""

  curl -s -X GET \
    "https://places.googleapis.com/v1/${PLACE_ID}?languageCode=ja" \
    -H "X-Goog-Api-Key: ${API_KEY}" \
    -H "X-Goog-FieldMask: id,displayName,formattedAddress,generativeSummary,editorialSummary,reviews,rating,userRatingCount,currentOpeningHours,photos" \
    | python3 -m json.tool 2>/dev/null
fi

echo ""
echo ""

# ––––––––––––––––––––––––––––
# TEST 5: Area Summary (伏見稲荷周辺)
# ––––––––––––––––––––––––––––

echo -e "${CYAN}[TEST 5] Area Summary 検証 (伏見稲荷周辺)${NC}"
echo "–––––––––––––––––––––––"

FUSHIMI_RESPONSE=$(curl -s -X POST \
  "https://places.googleapis.com/v1/places:searchText" \
  -H "Content-Type: application/json" \
  -H "X-Goog-Api-Key: ${API_KEY}" \
  -H "X-Goog-FieldMask: places.id,places.displayName" \
  -d '{
    "textQuery": "伏見稲荷大社",
    "languageCode": "ja",
    "maxResultCount": 1
  }')

FUSHIMI_ID=$(echo "${FUSHIMI_RESPONSE}" | python3 -c "
import json, sys
data = json.load(sys.stdin)
places = data.get('places', [])
if places:
    print(places[0]['id'])
" 2>/dev/null)

if [ -n "${FUSHIMI_ID}" ]; then
  curl -s -X GET \
    "https://places.googleapis.com/v1/${FUSHIMI_ID}?languageCode=ja" \
    -H "X-Goog-Api-Key: ${API_KEY}" \
    -H "X-Goog-FieldMask: id,displayName,generativeSummary,areaSummary" \
    | python3 -m json.tool 2>/dev/null
else
  echo "⚠ place_id 取得失敗。API Key を確認してください。"
fi

echo ""
echo ""

# ––––––––––––––––––––––––––––
# 結果サマリー
# ––––––––––––––––––––––––––––

echo "============================================"
echo -e "${GREEN} 確認ポイント${NC}"
echo "============================================"
echo ""
echo " 1. TEST 1-2: 「御朱印」で神社・寺院が返ってくるか"
echo "    → types に place_of_worship が含まれるか"
echo "    → primaryType が何になっているか"
echo ""
echo " 2. TEST 3: Nearby Search の type フィルターで"
echo "    神社と寺院の両方が返ってくるか"
echo "    → 教会等のノイズがどの程度混ざるか"
echo ""
echo " 3. TEST 4-5: generativeSummary / areaSummary が"
echo "    日本語で返ってくるか"
echo "    → null の場合は対応言語の問題の可能性"
echo ""
echo " 4. Field Mask の組み合わせで SKU がどう変わるか"
echo "    → generativeSummary を含むと Pro SKU になる"
echo "    → 含めなければ Essentials で済む場面が多い"
echo ""
echo "============================================"
