# Phase 1 — Gemini 画像生成プロンプト集

## 使い方

1. [Gemini](https://gemini.google.com/) を開く（画像生成機能付きのモデル、推奨: **Gemini 2.5 Flash (Nano Banana)** or **Imagen 3**）
2. 以下の3つのプロンプトを **それぞれ別スレッド** で実行
3. 生成された画像を `docs/illustration-samples/generated/` に保存
   - ファイル名：`style_A_flat.png`, `style_B_watercolor.png`, `style_C_lineart.png`
4. 気に入らなければ同じプロンプトで "Regenerate" で再生成
5. 3枚そろったら比較 → Phase 2（21枚のスタイル確定）へ

## 共通仕様

- **シーン**: 鳥居の前で静かに一礼する日本人女性
- **アスペクト比**: 3:2（横長、750×500px 相当）
- **構図**: 左側に人物（3/4 後ろ姿）、右奥に朱色の鳥居、背景に木々と参道
- **絶対禁止**: 文字・ロゴ・透かし、リアルな顔（細部）、アニメ調の大きな瞳、血・暴力、3Dレンダ感
- **共通要素**: 暖色系ベージュの背景、御朱印帳アプリの穏やかな雰囲気

---

## STYLE A: フラットイラスト（モダン）

```
A serene flat-style illustration of a Japanese woman in a traditional kimono
bowing respectfully in front of a vermilion torii gate at a Shinto shrine.

Style: Minimalist flat vector illustration, similar to Notion or Headspace
illustrations. Clean geometric shapes, soft solid color fills, no textures,
no shading gradients, no outlines, modern and contemporary feel.

Composition:
- Woman on the left (3/4 back view), bent forward at 45 degrees in a respectful bow
- Large vermilion torii gate on the right, partially visible
- Stone path leading from viewer toward the torii
- Simple abstract trees in background (flat color shapes)
- Warm cream/beige sky background

Color palette:
- Background: warm cream (#F7F2EB)
- Torii gate: vermilion red (#D44830)
- Woman's kimono: muted slate blue (#4A6B8F)
- Hakama (lower): deep navy (#2D3E5C)
- Obi: dusty rose-purple (#7A5D6B)
- Hair: dark charcoal (#1F1712)
- Skin: warm beige (#E8C8A5)
- Trees: sage green blocks (#8BA572)
- Path stones: warm tan (#B8A98A)

Technical: 3:2 aspect ratio, no text, no watermark, no border, clean edges.
Not photorealistic, not anime, not 3D render. Pure 2D flat illustration.
```

---

## STYLE B: 和風水彩タッチ

```
A traditional Japanese watercolor illustration on washi paper of a woman in
kimono bowing deeply at a vermilion torii gate of a Shinto shrine.

Style: Soft watercolor painting with visible paper texture. Gentle color
bleeds and wet-on-wet wash effects. Influenced by classic sumi-e and
modern Japanese picture books. Warm, atmospheric, and meditative.

Composition:
- Woman on the left (3/4 back view), bent deeply in a 90-degree bow
- Tall vermilion torii gate on the right, slightly misted at base
- Soft wash mountains in distance
- Loose ink-style trees on both sides
- Stone path with worn texture

Color palette (soft, muted, watercolor-like):
- Washi paper background: warm ivory (#F5EEDF) with subtle texture noise
- Torii: soft washed vermilion with gradient (#C43820 → #8A2410)
- Kimono: faded indigo blue (#4E6E90)
- Hakama: deep indigo (#2A4165)
- Obi: muted wine (#7A4A5E)
- Hair: soft ink black (#1E1812)
- Skin: warm peach (#E4C5A0)
- Distant mountains: sage wash (#9AA88E)
- Trees: ink wash green (#5A6B50)

Technique details: visible watercolor edges, slight color pooling at shape
borders, gentle irregular edges (not perfectly straight), organic brushwork.
Include a small red seal stamp ("hanko") in bottom-right corner with the
character "礼" in white on red square background.

Technical: 3:2 aspect ratio, no text (except the seal character 礼),
no watermark. Painterly feel. Not photorealistic, not flat vector.
```

---

## STYLE C: 線画 + ワンポイントカラー

```
A refined Japanese line-art illustration of a woman in kimono bowing at a
vermilion torii gate. Thin black ink linework with selective vermilion red
accents as the only color pop.

Style: Elegant pen-and-ink drawing, similar to a high-end Japanese travel
guidebook or "MUJI" aesthetic. Clean confident linework, minimal fills,
uncrowded composition. Refined and contemporary. Like a modernized ukiyo-e
outline.

Composition:
- Woman on the left (3/4 back view), bent forward in a respectful bow
- Vermilion torii gate on the right
- Path stones (outlines only)
- Distant trees as delicate outline silhouettes
- Mostly negative space (warm cream background)

Color strategy: 90% white/cream background with thin black (#1E1612) line
drawing. Only the TORII GATE TOP BEAM, TABLET, upper portion of pillars,
and the WOMAN'S OBI (sash) are filled with VERMILION (#D44830). Everything
else is outline-only.

Line weight: consistent 1.5–2pt thin ink lines, confident and slightly
irregular (hand-drawn feel), no shading, no hatching, no texture.

Details to include:
- Kimono folds suggested with minimal curved lines
- Hair as solid black silhouette
- Closed peaceful eye as a single curved line
- Small red square seal ("礼") in bottom-right corner

Technical: 3:2 aspect ratio, warm cream background (#FAF6EE), no text
(except seal character), no watermark. Not manga, not filled coloring page.
Sophisticated minimalist line illustration.
```

---

## Tips for Gemini

### プロンプトが効かないとき
- "flat illustration" ではなく "flat vector illustration, NO textures, NO shading"
- "watercolor" で3D感が出るときは "hand-painted watercolor, visible brush strokes, NOT digital render"
- "line art" で太い線になるときは "thin delicate ink lines, 1.5pt weight, continuous confident strokes"

### 再生成のバリエーション
スタイルは固定したまま、以下を末尾に追加して表情違いを試す：
- `Alternative pose: head tilted more to the side`
- `Vary the torii perspective: slightly tilted view`
- `Different season: autumn maple leaves on the ground`

### 複数バリエーション取得
Geminiに「上記プロンプトで4つのバリエーションを生成して」と指示すると2x2グリッドで複数案出せることが多い。

---

## 次のステップ

生成した3枚を `docs/illustration-samples/generated/` に保存後、どれに決めるか教えてください。
→ Phase 2 で同じスタイルの 3 枚（人物アクション/道具/俯瞰）を生成するプロンプトを作成します。
