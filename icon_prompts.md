# Learn タブ アイコン生成プロンプト集

ChatGPT (GPT-4o image generation / DALL-E) に投げる用のプロンプト 7 種。
1 個ずつ生成すると品質が安定する。

---

## 共通スタイル仕様（全アイコン共通）

```
スタイル: 立体的なイラスト調、2 色構成。フラットすぎず、適度な陰影で立体感を出す。
配色: メイン色は濃いチャコール (#2C2622)、アクセントは指定色を一箇所だけ。
構図: 正方形 1024×1024、被写体は中央に配置、上下左右 12% の余白を確保。
背景: 完全な透明 (PNG with alpha channel)。
ディテール: 滑らかな曲線、和の伝統的なモチーフ。テキスト・文字は一切入れない。
品質要件: 44×44 ピクセルに縮小しても何のアイコンか識別できる視認性。
NG: グラデーション、ドロップシャドウ、写実的な質感、3D レンダリング、ロゴ風、絵文字風、彩度の高いカラフル配色。
```

---

## 1. Shrine & Temple Types（神社と寺の種類）

```
A square illustrated icon, 1024x1024, transparent background, PNG.
Subject: A side-by-side composition of a Japanese torii gate (left half) and a Japanese 3-tier pagoda (right half), shown as compact silhouettes with subtle dimensional shading.
Style: Two-tone illustration. Main color is deep charcoal (#2C2622) for both structures. Accent color is muted purple (#8C4085) used ONLY on the top crossbeam (kasagi) of the torii and the spire/finial of the pagoda.
Composition: Centered, with 12% padding on all sides. Both structures roughly equal in visual weight.
Lighting: Subtle flat shading suggests three-dimensional form, but no gradients or glows.
No text, no logos, no people. Clean vector-illustration look.
```

---

## 2. Shrine Worship（神社参拝）

```
A square illustrated icon, 1024x1024, transparent background, PNG.
Subject: A single bold Japanese torii gate, centered and prominent. The classic Shinto symbol — two upright pillars, a horizontal nuki beam, and a curved kasagi top beam.
Style: Two-tone illustration with subtle dimensional shading. Main color is deep charcoal (#2C2622) for the pillars and nuki beam. Accent color is traditional Japanese vermilion red (#C0392B) used on the curved kasagi top beam (giving it the iconic red-roof look of Shinto torii).
Composition: Torii fills most of the canvas, slight ground line at base, 10% padding.
Lighting: Subtle inner highlight on pillars suggests cylindrical form. No gradients, no shadows on ground.
No text, no people. Traditional Japanese illustration aesthetic.
```

---

## 3. Temple Worship（仏教寺院での合掌）

```
A square illustrated icon, 1024x1024, transparent background, PNG.
Subject: Two human hands pressed together vertically in a Buddhist gasshō (合掌) prayer pose — palms together, fingertips pointing up, viewed from the front. Slightly stylized, not photorealistic.
Style: Two-tone illustration with subtle dimensional shading. Main color is deep charcoal (#2C2622) for the hands. Accent color is muted indigo (#4F4FA1) shown as a small soft halo dot or circle of light hovering just above the fingertips.
Composition: Hands centered vertically, occupying ~70% of canvas height. 12% padding.
Lighting: Subtle shadow line where palms meet to suggest dimensional separation. Tiny highlight on outer edges of palms.
No face, no body, no text. Buddhist iconography, serene and clean.
```

---

## 4. Temizu Purification（手水舎の清め）

```
A square illustrated icon, 1024x1024, transparent background, PNG.
Subject: A traditional Japanese hishaku (柄杓) — a long-handled wooden ladle — tilted at an angle as if pouring water. Three water droplets falling from the cup downward.
Style: Two-tone illustration with subtle dimensional shading. Main color is deep charcoal (#2C2622) for the ladle (cup and handle). Accent color is deep blue (#264C99) used ONLY for the water droplets and a thin water stream line.
Composition: Ladle handle from upper right diagonal down to lower left where the cup is. Droplets fall from cup. 10% padding.
Lighting: Subtle inner shading on the cup interior suggests bowl depth. No gradients.
No text, no hands, no temizuya basin. Just the ladle and water, clean illustration.
```

---

## 5. Gosyuin Stamps（御朱印帳）

```
A square illustrated icon, 1024x1024, transparent background, PNG.
Subject: An open Japanese goshuincho (accordion-fold prayer book) shown from a slight overhead angle. Left page shows a calligraphy brush stroke (single elegant character-like sweep). Right page shows a square red vermilion seal stamp (square with stylized cuts inside).
Style: Two-tone illustration with subtle dimensional shading. Main color is deep charcoal (#2C2622) for the book cover, page edges, and brush strokes. Pages are warm cream/paper white (#F0EAE0). Accent color is traditional vermilion red (#C0392B) for the square seal stamp.
Composition: Book centered, both pages visible, slight perspective so it looks dimensional rather than flat. 10% padding.
Lighting: Subtle shadow under the book and along the spine fold to suggest depth.
No real readable text — calligraphy brush strokes should look abstract and characterful, not actual kanji. Traditional Japanese aesthetic.
```

---

## 6. Omikuji Fortune（おみくじ）

```
A square illustrated icon, 1024x1024, transparent background, PNG.
Subject: A traditional Japanese omikuji — a folded paper fortune strip — with a red string/cord tied at the top in a knot, hanging vertically. The paper has subtle horizontal fold lines suggesting it's been folded.
Style: Two-tone illustration with subtle dimensional shading. Main color is deep charcoal (#2C2622) for the paper outline, fold details, and shadow lines. Paper itself is warm cream (#F0EAE0). Accent color is muted amber/red (#99662B or vermilion #C0392B) used for the tying cord, knot, and a small vertical seal-like accent on the paper.
Composition: Paper hangs vertically, centered. Knot at top occupies ~15% of height. Paper takes ~70% of height. 10% padding.
Lighting: Subtle shadow along one edge of paper to suggest 3D fold/curl. Cord has a slight rope texture suggested through line variation.
No text, no readable characters. Traditional Japanese shrine aesthetic.
```

---

## 7. General Manners（参拝の作法）

```
A square illustrated icon, 1024x1024, transparent background, PNG.
Subject: A single human figure shown in side profile, bowing forward respectfully (お辞儀), with hands at sides. Wearing simple traditional or business-style clothing — emphasis is on the bowing posture, not detailed clothing.
Style: Two-tone illustration with subtle dimensional shading. Main color is deep charcoal (#2C2622) for the silhouette of the person. Accent color is sky blue (#4D8CBF) used ONLY for a sash or belt detail at the waist.
Composition: Figure centered, facing right, bowing about 45 degrees forward. Subtle ground line beneath. 12% padding.
Lighting: Subtle inner shading suggests body volume. No detailed face, no hair detail — silhouette focus.
No text, no other people, no environment. Clean illustration of respectful bowing posture.
```

---

## 生成後の取り込み手順

1. ChatGPT で生成した PNG を保存（例: `guide_types.png`, `guide_sanpai.png` ...）
2. ファイル名は既存の Asset Catalog 名に合わせる:
   - `guide_types`
   - `guide_sanpai`
   - `guide_temple`
   - `guide_temizu`
   - `guide_gosyuin`
   - `guide_omikuji`
   - `guide_manners`
3. `GosyuinMap/Assets.xcassets/` 内の各 `guide_xxx.imageset/` フォルダにある既存 PNG を上書き
4. Xcode を再起動 → ビルド

※ もし新規アセット追加が必要な場合は、Xcode のアセットカタログに直接ドラッグ＆ドロップが一番安全。
※ Template 適用（黒だけにする）は LearnListView.swift 側で `.renderingMode(.template)` で扱っているので、PNG は元の 2 色のままで OK。アクセント色はリストでは消えますが、後で工夫できます。
