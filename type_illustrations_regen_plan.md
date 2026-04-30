# Learn タブ Type Illustrations 再生成プラン

最終更新: 2026-04-30
基準: ユーザー確認済み Style C（水彩タッチ・ベージュ背景）— `learn_illustrations_regen_plan.md` と同一スタイル
対象記事: Learn → "Shrine & Temple Types"（`typesContent`）

---

## 背景

旧 `type_*.png`（Wave 2D 系）は写実的な伝統建築ペイント調で、`learn_*` 系の
フラット水彩アニメ調と並べると明らかにトーンが浮いていた。本プランは旧 8 枚を
削除した上で、`learn_*` 系と完全に同じ画風で再生成するためのプロンプト集。

旧アセット (`Assets.xcassets/TypeIllustrations/type_*.imageset`) は削除済み。
`LearnDetailView.swift` の `typeCard` は `UIImage(named:)` チェック付きに変更
済みなので、同名で再追加すれば自動的に表示が復活する。

---

## Canonical スタイル（ユーザー確認済みリファレンス）

**正本リファレンス画像**: `learn_bell_rope.imageset/illustration.png`
（緑シャツジャケットの青年が鈴緒を握る構図。ユーザーが 2026-04-30 に「これが
求めているトーンとテイスト」と明示した画像）

副リファレンス（同一画風の他バリエーション）:
- `learn_torii_bow.imageset/illustration.png`
- `learn_coin_offering.imageset/illustration.png`

### スタイル DNA（言語化）

#### 1. 描画技法

- **Soft watercolor flat anime illustration**: フラットな色面 + ごく薄い水彩テクスチャ
- **輪郭線は使わない**（黒い線で囲わない）。形は色面と明度差だけで定義
- **陰影は単方向の柔らかい薄影**のみ。ハードシャドウ・写真的ハイライト・スペキュラ NG
- **質感は内部的にごくわずかな水彩のにじみ**。ペイント風の厚塗り・写実的テクスチャ NG
- **塗り込みは控えめ**。色面はほぼフラット、内部に 1〜2 段階の薄い影が乗る程度

#### 2. キャラクター（人物を入れる場合）

- **20 代前半の日本人男性**
- **黒髪ショート**、頭頂部にやや動きのある自然なシルエット
- **横顔または 3/4 ビュー**（正面顔は使わない）
- **穏やかな表情**、わずかに微笑む程度。歯は見せない
- **服装（緑バージョン）**: セージ／オリーブグリーンの襟付きシャツジャケット
  （シャケット／オーバーシャツ形）、胸ポケット付き、内側にクリーム T シャツ
- **服装（赤バージョン）**: バーガンディ寄りの赤クルーネックセーター
  （※ `learn_*` は緑と赤が混在しているが、本プランでは type に人物を入れない方針）
- **パンツ**: ベージュ／カーキの細身ストレート、裾はロールアップ
- **靴**: ブラウンのスニーカー、白ひも、薄いソール
- **体型**: 自然なプロポーション、頭身は 7 頭身前後

#### 3. 背景

- **クリーム／オフホワイト単色**: `#F2EBDF` 〜 `#F0E9DC` 付近
- **完全な単色フラット**。グラデーション NG、テクスチャ NG、影の落ち込み NG
- **環境物なし**: 床・壁・地面の影は描かない。被写体は背景に「浮く」ように配置
- **透明背景 NG**: 必ずクリーム単色で塗りつぶす

#### 4. カラーパレット（参考値）

| 要素 | 近似カラー |
|------|-----------|
| 背景クリーム | `#F2EBDF` / `#EFE9DC` |
| 髪（黒褐色） | `#2A2520` |
| 肌（暖かいピーチ） | `#F0CFB4` 〜陰影 `#E5B89C` |
| 朱色（鳥居・社殿） | `#C84B3D` 〜 `#B23E32` |
| 木材（淡） | `#C9A37A` |
| 瓦（青灰） | `#5F6B6E` |
| ブラス／真鍮 | `#C9A155` |
| 縄／注連縄 | `#D8C58F` 〜 `#BFA56A` |
| 緑（松・葉） | `#7B8C5A` 〜 `#5C6E40` |

→ 全体に **彩度低め・暖色寄り**。原色 NG、蛍光色 NG。

#### 5. 構図

- **正方形 1:1**、解像度 1254 × 1254 px
- **被写体を画面中央**にゆとりを持って配置（マージン 10〜15%）
- **垂直要素を活かす**（鳥居・社殿・五重塔は縦長で映える）
- **複数モチーフを並べる場合は 2〜3 個まで**。ごちゃつき NG

#### 6. ムード

- 静謐・敬虔・温かい
- エディトリアル／ライフスタイルイラストレーション風
- 「Notion / Headspace の和風アレンジ」「現代日本のエディトリアル
  イラスト（木内達朗系）」を想起させる質感

### 旧 Wave 2D 系との違い（NG 集）

| 旧 type_*（NG） | 新 type_*（OK） |
|----------------|----------------|
| 写実的な瓦・木目の細密描写 | フラット色面 + 薄影で形をとる |
| 写真的ライティング、強い影 | 単方向の柔らかい薄影のみ |
| ペイント風の厚塗りテクスチャ | 水彩のごく薄いにじみ |
| 高彩度の朱、深い陰影 | 落ち着いた朱、暖色寄りの淡い陰影 |
| 被写体ぎっしりの遠景 | 中央 1 モチーフ + ゆとり |

---

## 再生成リスト（8 枚）

すべて以下のパスに `illustration.png` として配置:
`GosyuinMap/Assets.xcassets/TypeIllustrations/<asset_name>.imageset/illustration.png`

`Contents.json` は既存 `learn_*.imageset/Contents.json` をコピーすれば OK
（`"filename" : "illustration.png"` のみ参照する形式）。

---

**プロンプト共通プレフィックス（毎回先頭に貼る）**:

> Soft watercolor flat anime illustration, identical style to the reference image (learn_bell_rope.png): solid cream off-white background (#F2EBDF), no harsh outlines, soft edges defined by color planes, very subtle internal watercolor texture, gentle single-direction shading, low saturation, warm muted palette. No black outline strokes. No realistic painted textures, no photographic lighting, no specular highlights. No text, no signage, no people. Square 1:1 composition, 1254×1254 px. Subject centered with comfortable margin. Editorial illustration mood — calm, reverent, contemplative.

---

### 1. type_jinja（神社）

**シーン**: 朱塗りの中型 torii 鳥居 1 基が画面中央に立ち、奥にシンプルな木造拝殿
（haiden）のシルエット。脇に小さな松が 1〜2 本。

> [common prefix above] A medium-sized vermillion-red torii gate stands centered, slightly receding into the scene. Behind it, a simple unpainted wooden shrine hall (haiden) with a gabled tile roof, rendered as a soft silhouette. One or two small pine trees flank the composition at the lower corners. The torii's vermillion is muted (≈ #C84B3D), not bright primary red. Cream solid background.

---

### 2. type_tera（寺）

**シーン**: 木造の山門（sanmon）が画面中央に大きく立ち、奥に瓦屋根の本堂（hondo）の
シルエット。線香の煙がうっすらと立ち上る。鳥居は **絶対に描かない**。

> [common prefix above] A traditional unpainted wooden Buddhist temple gate (sanmon) stands centered, with massive squared pillars and a tiled gabled roof. Behind it, a tiled-roof main hall (hondo) softly visible. A faint wisp of grey-white incense smoke curls upward on one side. CRITICAL: NO torii gate, NO vermillion red — this is a Buddhist temple, not a Shinto shrine. Wood tones (light brown ≈ #C9A37A) and tile grey-blue (≈ #5F6B6E) only. Cream solid background.

---

### 3. type_jingu（神宮）

**シーン**: Ise/Meiji Jingu 風の格式高い拝殿。chigi（千木）と katsuogi（鰹木）が
屋根に乗った白木の社殿。手前に砂利の参道。

> [common prefix above] A high-ranking Shinto shrine main hall (haiden) in the style of Ise Jingu — pale unpainted cypress wood, with prominent chigi (forked X-shaped finials) and katsuogi (horizontal billets) on a thick thatched-style gabled roof. A simple gravel approach path widens toward the viewer. No torii in frame; the hall is the focus. Pale wood tones and warm cream stones; no vermillion. Cream solid background.

---

### 4. type_taisha（大社）

**シーン**: 出雲大社の大注連縄（shimenawa）が大きく前面に下がっている社殿。
注連縄が画面の主役。

> [common prefix above] A grand shrine hall in the style of Izumo Taisha. The visual focus is an enormous straw shimenawa rope hanging horizontally across the front of the building, with thick tapered ends and white shide paper streamers. Wooden hall behind, with a steep dark-grey gabled roof. The rope colour is warm oatmeal/sand (≈ #D8C58F) with subtle braided texture. Cream solid background.

---

### 5. type_tenmangu（天満宮）

**シーン**: 朱塗りの社殿の前に梅の木が一本。梅の花が満開で、ピンクの花弁がふわっと舞う。
牛の像（撫で牛）を脇に小さく添える。

> [common prefix above] A small vermillion-painted Tenmangu shrine hall in the background. A single plum tree (ume) in full pink blossom occupies the foreground, with a few pink petals drifting softly through the air. A small bronze ox statue (nade-ushi) sits at the lower side of the composition, lying down peacefully. Pink blossoms are soft and dusty (≈ #E8B5C2), not saturated. Cream solid background.

---

### 6. type_inari（稲荷神社）

**シーン**: 朱色の千本鳥居トンネルが奥行きをもって連なり、手前左右に白い狐
（kitsune）の石像が 1 体ずつ。狐の首には赤い前掛け。

> [common prefix above] A tunnel of vermillion torii gates receding into the distance with strong perspective (Fushimi Inari style). The vermillion is muted, not bright. In the foreground, one white stone fox (kitsune) statue sits on each side, each wearing a small red cloth bib. The foxes face forward with calm stylised expressions. Cream solid background.

---

### 7. type_hachimangu（八幡宮）

**シーン**: 朱塗りの楼門（rōmon）形式の社殿が中央に。屋根の上やそばに白い鳩が
2〜3 羽ふわっと舞う。

> [common prefix above] A vermillion-painted two-story Hachimangu-style shrine gate (rōmon) centered, with a tiled hip roof and white plaster walls between vermillion pillars. Two or three small white doves drift gently around the upper eaves — doves are the sacred symbol of Hachimangu. Vermillion is muted; doves are soft cream-white. Cream solid background.

---

### 8. type_daishi（大師）

**シーン**: 弘法大師ゆかりの寺院。瓦屋根の本堂と五重塔（gojū-no-tō）が並んで立つ。
僧侶の姿は入れない。

> [common prefix above] A Buddhist Daishi-style temple compound — a tiled-roof main hall (hondo) on the left and a five-story pagoda (gojū-no-tō) on the right, both at similar scale, separated by a small gap of cream sky. Wood tones and tile grey-blue, no vermillion. No people, no monks. Cream solid background.

---

## 受け入れ基準

- 8 枚すべて、**正本リファレンス `learn_bell_rope.png`** と並べて違和感がないこと
  - 背景色（クリーム `#F2EBDF` 系）が完全一致
  - 彩度が同レベル（淡め、暖色寄り）
  - 輪郭線なし・色面で形を取る描き方が統一
  - 影の深さ・方向が同程度の薄さ
- 写実的な瓦・木質感・写真的ライティングが残っていないこと
- 各タイプの特徴（torii / sanmon / 千木鰹木 / shimenawa / 梅 / 狐 / 鳩 / 五重塔）が
  一目でわかること
- 文字・看板が入っていないこと
- 朱色は muted（`#C84B3D` 程度）、原色 NG

## 生成 → 配置フロー

`learn_illustrations_regen_plan.md` と同一手順:

1. ChatGPT image gen でプロンプト実行（共通プレフィックス + 個別プロンプト）
2. **必ず `learn_bell_rope.imageset/illustration.png` を一緒にアップロードしてスタイル参照**
3. 1254×1254 RGBA PNG をダウンロード
4. `wave2d-output/regen_named/<name>.png` にバックアップ保存
5. `GosyuinMap/Assets.xcassets/TypeIllustrations/<name>.imageset/illustration.png` に配置
6. 同階層に `Contents.json` を作成（既存 `learn_*.imageset/Contents.json` 参照）
7. Xcode で再ビルド → Learn → "Shrine & Temple Types" で検収

## チェックリスト

- [ ] type_jinja
- [ ] type_tera
- [ ] type_jingu
- [ ] type_taisha
- [ ] type_tenmangu
- [ ] type_inari
- [ ] type_hachimangu
- [ ] type_daishi
