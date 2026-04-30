# Learn タブ イラスト再生成プラン

最終更新: 2026-04-29
基準: ユーザー確認済み Style C（水彩タッチ・ベージュ背景・近接プロファイル）

---

## Canonical スタイル

### 男性キャラ（参拝・寺院・御朱印・おみくじで使用）

参考画像: `learn_gosyuin_3.imageset/illustration.png`, `learn_shrine_final_bow.imageset/illustration.png`, `learn_omikuji_pay.imageset/illustration.png`

- 黒髪ショート、20 代前半の青年、横顔または 3-quarter view
- 赤（バーガンディ寄り）の長袖クルーネックセーター
- ベージュ／カーキのパンツ
- 白スニーカー
- 水彩タッチのフラットアニメ調、柔らかいエッジ、軽い陰影
- 背景: クリーム／オフホワイト（#F5F1E8 系）の単色塗り
- カメラは被写体に近接、被写体は画面の縦方向ほぼフル（feet to head）または上半身近接

### 女性キャラ（手水のみ）

参考画像: `learn_temizu_4.imageset/illustration.png`, `learn_temizu_5.imageset/illustration.png`

- 黒髪ロー・ポニーテール、20 代の女性、3-quarter view
- 淡い水色（パウダーブルー）の襟付き長袖ブラウス
- 紺色（ネイビー）のロングスカート、丈は脛下まで
- 黒のフラットシューズ
- 水彩タッチ・クリーム背景・上記男性と完全に同じ画風

### 共通仕様

- 解像度: 1254 × 1254 px (RGBA PNG)
- アスペクト比: 1:1（正方形）
- 背景: 透明 NG。クリーム単色（既存と統一）
- 文字／ロゴ／看板の文字は読めても可だが日本語のみ・誤字なし
- 影は柔らかく薄め、輪郭線はあえて強く描かず色面で形を取る

---

## 再生成リスト（13 枚）

すべて `GosyuinMap/Assets.xcassets/LearnIllustrations/<name>.imageset/illustration.png` に上書き。

### 参拝（Shrine Worship）— 全 6 ステップ全て差し替え

#### 1. learn_torii_bow

参考: gosyuin_3 と同じ画風で。
シーン: 朱塗りの大鳥居の前、赤セーター青年が手前に立ち、参道の脇から軽くお辞儀（30°）。鳥居越しに奥に参道が伸びる。

> Soft watercolor flat anime illustration, cream background. A young Japanese man in a burgundy red crewneck sweater and beige pants stands at the side of the approach path in front of a large vermillion torii gate, bowing slightly at about 30 degrees, hands at his sides. The torii gate is fully visible at the right side, with the stone-paved path leading into the distance. Profile / 3-quarter view from the left side. Same exact style and character as the reference image: short black hair, soft watercolor texture, gentle shading, no harsh outlines, cream/off-white solid background. Square 1:1 composition.

#### 2. learn_coin_offering

参考: gosyuin_3, omikuji_pay と同じ画風で。
シーン: 拝殿の賽銭箱の前で、青年が右手で 5 円玉をそっと投げ入れている。横顔。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater and beige pants stands in front of a wooden shrine offering box (saisen-bako), gently dropping a five-yen coin into the slot. Profile view from the left, the offering box sits on the right. Calm expression, hands moving naturally. Same character and identical style as the reference image. Square 1:1.

#### 3. learn_bell_rope

参考: omikuji_pay と同じ画風で。
シーン: 鈴と鈴緒、青年が右手で鈴緒を握って軽く揺らしている。横顔。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater grips a thick braided shrine bell rope (suzuo) with his right hand and gently shakes it; the brass bell hangs above. Profile view from the left. Identical character and style as the reference. Square 1:1.

#### 4. learn_bow_twice

参考: shrine_final_bow と同じ画風で（深い 90° お辞儀）。
シーン: 拝殿前で深く 2 礼している瞬間（約 90°）、両手は脇。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater bowing deeply, about 90 degrees from vertical, hands relaxed at his sides. He is standing in front of a wooden shrine hall (haiden). Profile view from the left. Identical character and style as the reference image. Square 1:1.

#### 5. learn_clap_twice

シーン: 拝殿前で胸の高さで両手を合わせ、右手を少し下にずらしている。柏手の瞬間（手はまだ離れている）。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater stands in front of a wooden shrine hall, holding his hands at chest height for the two-claps prayer (nihakushu). His right hand is offset slightly lower than the left, hands almost touching mid-clap. Eyes gently closed. 3-quarter view from the front-left. Identical character and style as the reference. Square 1:1.

### 手水（Temizu）— Step 1〜3 を女性 Style C に差し替え

#### 6. learn_temizu_1

参考: temizu_4, temizu_5 と完全同一スタイル・同一人物。
シーン: 手水舎の前で、右手で柄杓を握り、水盤から水をすくっている。3-quarter。

> Soft watercolor flat anime illustration, cream background. The same young Japanese woman as in the reference temizu illustrations: black hair tied in a low ponytail, pale powder-blue collared blouse with rolled sleeves, navy floor-length skirt, black flats. She holds a wooden ladle (hishaku) in her right hand and is scooping water from a stone temizuya basin lined with green bamboo. 3-quarter view from the front. Identical character, palette, and style as the temizu_4 reference. Square 1:1.

#### 7. learn_temizu_2

シーン: 柄杓を右手に持ち、左手の上に水を流して洗っている。

> Soft watercolor flat anime illustration, cream background. Same woman as the reference. She holds the wooden ladle in her right hand and gently pours water from it onto her cupped left hand to purify it; thin droplets fall into the basin below. 3-quarter view, hands as the focal point. Identical style and character as temizu_4 reference. Square 1:1.

#### 8. learn_temizu_3

シーン: 柄杓を左手に持ち替え、右手の上に水を流して洗っている（ステップ 2 の鏡像）。

> Soft watercolor flat anime illustration, cream background. Same woman as the reference. She has switched the ladle to her left hand and now pours water onto her right hand to purify it. Mirror composition of the previous step. Identical style and character as temizu_4 reference. Square 1:1.

### 寺院（Temple）— prayer_hands と緑セーター 3 枚を差し替え

#### 9. learn_incense

参考: omikuji_pay の赤セーター男に揃える（現状は緑セーター）。
シーン: 大型の青銅製常香炉の前で、青年が立ち上る煙を両手で自分の方へあおいでいる。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater (NOT green) and beige pants stands beside a large bronze incense burner (jōkōro) at a Buddhist temple. White-grey smoke rises from burning incense sticks. He gently fans the smoke toward his own face with both hands, eyes calm. 3-quarter view, profile-leaning, the incense burner is on the right. Identical character and style as the gosyuin reference. Square 1:1.

#### 10. learn_temple_coin

シーン: 寺院の賽銭箱に右手でコインを投げ入れている。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater and beige pants stands at a Buddhist temple's wooden offering box. He drops a coin into the slatted top with his right hand. The temple's wooden hondo (main hall) eaves are visible at the upper right. Profile view from the left. Identical character and style as the gosyuin reference. Square 1:1.

#### 11. learn_temple_bell

シーン: 鰐口（waniguchi、円盤型ゴング）か吊り鐘の縄を持ち、軽く揺らしている。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater pulls a thick braided rope hanging from a large bronze waniguchi gong / Buddhist temple bell suspended from a wooden frame. Profile view, the bell occupies the right half of the image. Identical character and style as the reference. Square 1:1.

#### 12. learn_prayer_hands

シーン: 本堂前で胸の高さに合掌、目を閉じて静かに祈っている（柏手しない）。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater stands in front of a Buddhist temple's main hall, palms pressed together at chest level (gasshō), eyes gently closed in silent prayer. NO clapping motion — hands fully together. 3-quarter view from the front-left. Identical character and style as the reference. Square 1:1.

### おみくじ（Omikuji）— omikuji draw を男に差し替え

#### 13. learn_omikuji

シーン: 木製の六角形おみくじ箱を両手で持ち、軽く振ってひいている。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater holds a long hexagonal wooden omikuji box with both hands at chest level, tilting it to draw a numbered stick from the small hole. Calm, contemplative expression. 3-quarter view. Identical character and style as the omikuji_pay / omikuji_read references. Square 1:1.

---

## 新規追加（3 枚）

コードで `illustration: nil` になっているステップに新規イラストを追加。Step 番号は `LearnDetailView.swift` 上のもの。

### 14. learn_temple_bow_at_gate（寺院 Step 1）

シーン: 山門 (sanmon) の手前で青年が一礼。山門のしきい (敷居) は跨ぐ前。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater bows once at the threshold of a large wooden Japanese Buddhist temple gate (sanmon), with massive wooden pillars and a tiled roof visible. He stands respectfully outside the gate, about to enter with his left foot first; the threshold beam (shikii) is at his feet. Profile view from the left. Identical character and style as the reference. Square 1:1.

### 15. learn_temple_bow_out（寺院 Step 6）

シーン: 山門を出て振り返り、本堂方向に一礼。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater stands just outside the temple's wooden sanmon gate, having turned back to face the inner courtyard, bowing once in farewell. Calm expression. 3-quarter view. Identical character and style as the reference. Square 1:1.

### 16. learn_omikuji_tie_or_keep（おみくじ Step 4）

シーン: 結び所（musubi-dokoro）の縄や枝に、おみくじの紙を細く折って結びつけている。

> Soft watercolor flat anime illustration, cream background. The same young Japanese man in burgundy red sweater carefully ties a folded white omikuji fortune slip onto a horizontal rope (or wooden lattice) at a shrine's musubi-dokoro, where dozens of other folded paper strips are already tied, fluttering softly. 3-quarter view, hands as the focal point. Identical character and style as the reference. Square 1:1.

---

## 生成 → 配置フロー

各画像について:

1. ChatGPT image gen で上記プロンプトを実行
2. 必ず参考画像 (gosyuin_3 or temizu_4) を一緒にアップロードしてスタイル参照
3. 1254×1254 RGBA PNG をダウンロード
4. `wave2d-output/regen_named/<name>.png` に保存
5. `GosyuinMap/Assets.xcassets/LearnIllustrations/<name>.imageset/illustration.png` に上書き
6. 新規 3 枚は imageset ディレクトリと `Contents.json` を新規作成
7. `LearnDetailView.swift` の対応する `illustration: nil` を `illustration: AnyView(LearnIllustration(name: "..."))` に置換
8. `project.pbxproj` の Resources に新規 imageset 3 つを追加

## チェックリスト

- [ ] learn_torii_bow
- [ ] learn_coin_offering
- [ ] learn_bell_rope
- [ ] learn_bow_twice
- [ ] learn_clap_twice
- [ ] learn_temizu_1
- [ ] learn_temizu_2
- [ ] learn_temizu_3
- [ ] learn_incense
- [ ] learn_temple_coin
- [ ] learn_temple_bell
- [ ] learn_prayer_hands
- [ ] learn_omikuji
- [ ] learn_temple_bow_at_gate (new)
- [ ] learn_temple_bow_out (new)
- [ ] learn_omikuji_tie_or_keep (new)
