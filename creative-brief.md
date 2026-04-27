# GosyuinMap Creative Asset Brief

## Overview

This brief covers all generated image assets for the app (icons, stamps, badges, store materials, share cards). Screen-level UI direction is in `docs/design-rework-brief.md` — this doc is strictly about what images we generate, how they should look, and how we get them into the repo.

**North star:** "A digital gosyuin-cho that feels as sacred and personal as the real thing." (inherited from `design-rework-brief.md`)

**Production pipeline:**
1. Plan — this doc (Claude chat)
2. Generate raster — split by asset complexity:
   - **ChatGPT Plus / DALL-E** (via Claude in Chrome) — app icons, category icons, badges (flat illustration style), store hero images, tip cards. Sweet spot: brandmarks + flat illustration achievement badges + photorealistic composites
   - **Gemini** (existing `stamps_gemini/` workflow) — gosyuin stamps with vertical kanji + 朱印 seals. DALL-E cannot handle this composition reliably
   - Company Figma AI credits stay reserved for HYPES
3. Vectorize (assets that need to be SVG) — **Recraft** ([project](https://www.recraft.ai/project/75b7ebc8-b5a0-43ac-856c-1d2f0d9613fa)):
   - Drag the raster PNG onto the Recraft canvas
   - Recraft auto-vectorizes flat illustrations to clean SVG paths
   - Export as SVG
   - For text/kanji that DALL-E got wrong, edit in Figma after vectorization (SVG `<text>` is editable)
4. Review — drag assets into Figma for comparison/triage; verify SVG renders correctly at all sizes
5. Integrate — add to `Assets.xcassets` with the naming rules below

**Asset format by category:**
| Asset type | DALL-E raster | Recraft SVG | Final format |
|---|---|---|---|
| App icons | ✓ | – (raster OK) | PNG 1024×1024 |
| Category icons | ✓ (silhouette) | ✓ | SVG |
| Achievement badges | ✓ (flat illustration) | ✓ | SVG |
| Gosyuin stamps | – (use Gemini) | – | PNG 1024×1024 |
| Store hero images | ✓ | – (raster OK) | PNG |
| OG images | ✓ | – (raster OK) | PNG |
| Tip cards | ✓ | optional | PNG or SVG |

**Prompting rules (from Wave 1):**
- Always add explicit negatives: "no decoration", "no other elements", "no scenery". DALL-E defaults to "Japan pack" when given Japanese motif keywords
- Seasonal variants: state "keep base color" explicitly. "Spring" alone → DALL-E will turn the whole image pink
- Language: state "English text only, no Japanese" explicitly when copy is in English. Default drift is to Japanese for shrine context
- Each asset family in its own chat. Reusing chats causes context bleed (myojin icon got an unintended center circle from prior app icon turns)

---

## Design System (Existing — Must Follow)

Reference `GosyuinMap/Extensions/Color+Theme.swift` as the source of truth. Do not redefine tokens here.

### Colors
| Token | Value (Light) | Usage in generated assets |
|---|---|---|
| `vermillion` | `#C13B2A` | Primary accent, seals, CTA highlights |
| `pageBackground` | `rgb(247, 242, 235)` | Default background for all asset types |
| `cardBackground` | White | Card surfaces only |
| `indigo` | `rgb(38, 77, 153)` | Water / temizu / night motif accent |
| `matcha` | `rgb(51, 140, 77)` | Nature / seasonal greenery accent |
| `kincha` | `rgb(153, 102, 38)` | Gold / omikuji / fortune accent |

### Typography (for copy-bearing assets)
- Section labels: uppercase, monospaced, letter-spaced (matches `DS.Font.sectionLabel`)
- Display kanji: 楷書 / 行書 (handwritten brush), never 明朝 for hero titles
- Latin display: system rounded bold — avoid serifs
- Body Latin: system — avoid custom fonts in generated assets (add via SwiftUI)

### Illustration Style System (already explored in `illustration-roadmap.md`)
| Style | Usage | Where |
|---|---|---|
| **A. Flat** | Learn tab illustrations, tip gratitude cards, onboarding scenes | SwiftUI-rendered today; flat PNGs later |
| **B. Washi watercolor** | Hero visuals (App Store #1, OG, Passport map) | New for this brief |
| **C. Line art + vermillion seal** | Gosyuin stamps, category icons, achievement badges | Matches existing `ArtworkStamps/*` |

**Rule:** one asset set stays in one style. No mixing within a single screen/surface.

---

## Motif Vocabulary

**OK:** torii / komainu / temizuya / gosyuin-cho / 朱印 seals / stone paths / washi paper / sumi ink / bell rope / ema / cherry / plum / maple / paper lantern / fox (inari) / miko silhouette / five-storied pagoda

**Not OK:**
- Over-cute kawaii deformation
- Concrete depictions of deities / Buddha statues
- Specific real shrine crests (mon) generated randomly — too easy to get inadvertently accurate
- "Chinese restaurant" red-and-gold glitz
- AI-mangled kanji — every asset with kanji must pass human QA

---

## Asset Categories

### 1. App Icon & Splash

**Current state:** One 1024×1024 `AppIcon.png` — vermillion gradient background, bold white torii silhouette. Works, but has no texture and no seasonal variants. Tinted/Dark mode variants missing.

**Generate:**
| # | Asset Name | Purpose | Size |
|---|---|---|---|
| 1 | `app_icon_default_v2` | Main icon with subtle washi grain | 1024×1024 |
| 2 | `app_icon_sakura` | Spring alt (iOS Alt Icons) | 1024×1024 |
| 3 | `app_icon_momiji` | Autumn alt | 1024×1024 |
| 4 | `app_icon_yuki` | Winter alt | 1024×1024 |
| 5 | `app_icon_shinryoku` | Early summer alt | 1024×1024 |
| 6 | `app_icon_tinted` | iOS 18 tinted monochrome | 1024×1024 |
| 7 | `app_icon_dark` | iOS 18 dark variant | 1024×1024 |

**Spec:** Keep the torii silhouette as the core symbol across all variants. Background swaps (cherry petals / maple / snow / fresh leaves). Never change the torii geometry between variants — that's the brand constant.

**Placement:** `GosyuinMap/Assets.xcassets/AppIcon.appiconset/` + new `AppIconSakura.appiconset/` etc.

---

### 2. Category Icons (Shrine/Temple Types)

**Current state:** 8 monochrome SVGs in `Assets.xcassets/CategoryIcons/` using `currentColor` fill. Silhouettes of torii, roof, fox ears, plum, pagoda, etc. Minimal and consistent.

**Generate:**
| # | Asset Name | Category | Motif |
|---|---|---|---|
| 1 | `icon_myojin` | 明神 | Simplified myojin torii (curved) |
| 2 | `icon_gongen` | 権現 | Mountain + shrine silhouette |
| 3 | `icon_sengen` | 浅間 | Mt. Fuji silhouette |
| 4 | `icon_konpira` | 金比羅 | Steep stone steps |
| 5 | `icon_ebisu` | 恵比寿 | Fishing hook / tai fish tail |
| 6 | `icon_benzaiten` | 弁財天 | Lute (biwa) silhouette |

**Spec:**
- SVG, viewBox `0 0 64 64`, single path using `currentColor` fill
- Stroke width ≥ 3px effective at 24×24 pin size (no hairlines)
- Visual weight matches existing 8 icons — eyeball against `icon_jinja.svg` for reference
- Must read as a silhouette at 20×20 (test in map pin context)

**Placement:** `GosyuinMap/Assets.xcassets/CategoryIcons/icon_{key}.imageset/icon.svg`

---

### 3. Gosyuin Stamps (Individual Shrine Artwork)

**Current state:** 290+ PNGs at 1024×1024 in `Assets.xcassets/ArtworkStamps/`. Existing style is traditional: beige washi background, circular black line drawing of the shrine building, vertical kanji shrine name, 3 red square seals (`奉拝` top, shrine seal center, location seal lower-left).

**Status: locked.** The 290 stamps are sufficient for launch coverage — no new generation planned. Existing assets were produced via the Gemini workflow (`stamps_gemini/`); reproducing the look in DALL-E was attempted in Wave 1 and failed (DALL-E cannot reliably compose vertical kanji + 朱印 + circular line architecture in one square).

If new shrine entries are added later that need a bespoke stamp, generate via Gemini using the same prompt template the existing 290 came from. Do not attempt these in DALL-E.

**Spec:**
- 1024×1024 PNG, RGB
- Background: washi beige `rgb(247, 242, 235)` with subtle fiber grain
- Main motif: circular line drawing (black sumi ink) of shrine architecture
- Text: vertical kanji on left (shrine name), small location name on right
- Seals: 3× red square篆書 seals (`奉拝` top, motif-based center, location bottom-left)
- Slight ink bleed / imperfect edges — hand-stamped feel, not vector-sharp

**QA checklist (every stamp):**
- [ ] Kanji characters are real (not AI-corrupted)
- [ ] Shrine name matches intended target
- [ ] Seals read as篆書 (seal script), not regular kanji
- [ ] Background is washi beige, not white
- [ ] Ink work feels hand-drawn, not digital-clean

**Placement:** `GosyuinMap/Assets.xcassets/ArtworkStamps/stamp_{romaji}.imageset/stamp_{romaji}.png`

---

### 4. OG & App Store Screenshots

**Current state:** None produced. Blocking launch readiness.

**Generate:**
| # | Asset Name | Purpose | Size |
|---|---|---|---|
| 1 | `store_hero_1` | App Store screenshot #1 — hero with tagline | 1290×2796 (6.9") |
| 2 | `store_hero_2` | Screenshot #2 — map frame with pins | 1290×2796 |
| 3 | `store_hero_3` | Screenshot #3 — Stamp Book | 1290×2796 |
| 4 | `store_hero_4` | Screenshot #4 — proximity collection moment | 1290×2796 |
| 5 | `store_hero_5` | Screenshot #5 — Learn tab | 1290×2796 |
| 6 | `og_share_card` | OG image for web/LP | 1200×630 |

**Spec:**
- Two candidate directions — both worth piloting before committing:
  - **B1. Style B watercolor minimal** (original spec): washi watercolor scene + English tagline, no device mockup. Editorial, quiet.
  - **B2. Composite App Store layout** (emerged from Wave 1 #5): Japanese tagline + wordmark + feature callout list + device mockup + supporting object photography. Higher information density, more conversion-oriented.
- Top third: tagline (English for B1, Japanese acceptable for B2)
- Bottom two-thirds: device frame or illustration
- Only one accent color in addition to beige/black — vermillion, nothing else
- Taglines from onboarding copy: "Sacred Places, All Around You" / "Walk There, Earn a Stamp" / "Every Visit, a Memory"
- DALL-E note: when given Japanese shrine context, the model defaults to direction B2. To force B1, prompt must include explicit negatives: "no device mockup, no UI elements, no feature callouts, English text only, no Japanese"

**Also needed (Passport-screen asset dependency):**
| # | Asset Name | Purpose | Size |
|---|---|---|---|
| 7 | `passport_japan_map_watercolor` | Watercolor Japan base for `ShrinePassportView` map section | 1200×800 |
| 8 | `passport_header_ornament` | Decorative kumo/yama silhouette band | 1200×200 |
| 9 | `passport_empty_state` | "Your journey starts here" hero for 0-stamp state | 800×800 |
| 10 | `share_watermark_seal` | Vermillion seal watermark for shared images | 256×256 PNG w/ alpha |

These hit Style B. Screen layout is specified in `docs/design-rework-brief.md` Screen 2.

**Placement:**
- Store materials: `/Users/takumi_yasuda/hypes-workspace/gosyuin_store/` (not in-bundle)
- Passport assets: `Assets.xcassets/PassportAssets/` (new folder)

---

### 5. Achievement Badges (Flat Illustration Style)

> **Direction confirmed in Wave 2A:** Takumi approved DALL-E's spontaneous output style — colored ring border + flat central illustration + bottom banner with kanji or number + small subtitle. NOT minimal kanji-only seal — that direction was rejected as too plain.

**Reference badge:** `wave2a_badge_torii_shrine_v1.png` (green ring + torii + shrine + "25 神社参拝" banner). Canonical template — all badges follow this composition.

**Source of truth:** `GosyuinMap/Models/CollectorLevel.swift` — the `Achievement` struct list. Do NOT invent new achievements; only generate art for what's defined in code.

**Total: 38 badges across 3 categories** (per `Achievement.all` in code):

#### 5a. Milestone (8 badges)

Stamp-count progression. ID corresponds to `Achievement.id`:

| ID | Title | kanji (banner) | Description | Center illustration |
|---|---|---|---|---|
| `hatsumoude` | Hatsumoude | 初 | Collect your first stamp | Single torii on stone path, one petal floating |
| `gosha` | Gosha Mairi | 五 | Collect 5 stamps | 5 stamps fanned out / small shrine cluster |
| `jusha` | Jusha Meguri | 十 | Collect 10 stamps | Map with 10 pins / walking pilgrim |
| `nijugosha` | Silver Pilgrim | 廿五 | Collect 25 stamps | Silver-toned shrine bell or seal |
| `gojusha` | Gold Pilgrim | 五十 | Collect 50 stamps | Golden shrine torii at sunset |
| `hyakusha` | Hyakusha Mairi | 百 | Collect 100 stamps | Trophy / 100-pillar shrine |
| `nihyakusha` | Grand Pilgrim | 二百 | Collect 200 stamps | Crown / sacred mountain |
| `zensha` | Zensha Seiha | 全 | Collect every stamp | Sparkles / all-stamps visualization |

#### 5b. Category Mastery (24 badges = 8 categories × 3 tiers)

For each `ShrineCategory` (jinja, tera, jingu, taisha, tenmangu, inari, hachimangu, daishi), 3 tier badges:

| Tier | ID suffix | Title | kanji | Description |
|---|---|---|---|---|
| 1 | `_1` | {Cat} Initiate | 初 | Visit your first {category} |
| 2 | `_5` | {Cat} Regular | 五 | Collect 5 {category} stamps |
| 3 | `_all` | {Cat} Master | 皆 | Collect every {category} stamp |

Center illustration uses the existing `CategoryIcons/icon_{category}.svg` motif (torii for jinja, fox for inari, plum for tenmangu, etc.).

**Color coding by category** (matches `CollectorLevel.swift` definitions):
- `jinja` — vermillion / `tera` — indigo / `jingu` — kincha / `taisha` — matcha
- `tenmangu` — purple-magenta / `inari` — orange-red / `hachimangu` — deep red / `daishi` — burnt orange

#### 5c. Exploration (6 badges)

| ID | Title | kanji | Description | Center illustration |
|---|---|---|---|---|
| `first_journey` | First Journey | 旅 | Visit shrines in 2 different regions | Compass / two-region map |
| `east_west` | East Meets West | 東西 | Visit Kanto and Kansai | Map split east/west, two markers |
| `variety_5` | Variety Seeker | 五 | Collect from 5 different categories | 5 different shrine icons in a circle |
| `all_categories` | Complete Explorer | 全 | Collect from every category | Compass star / 8-pointed mandala |
| `tokyo_10` | Tokyo Explorer | 都 | Collect 10 stamps in Tokyo | Tokyo skyline / Tokyo Tower silhouette |
| `kansai_10` | Kansai Wanderer | 西 | Collect 10 stamps in Kansai | Kyoto pagoda / Osaka castle silhouette |

**Out of scope (not implemented in code):**
- Seasonal badges (hatsumode, sakura mairi, momiji etc.) — not in `Achievement.all`
- Special timing badges (akatsuki, yoi, tsuki) — not in `Achievement.all`
- Streak / consecutive-day badges — no streak tracking in app

If new achievements are added to `CollectorLevel.swift`, update this brief and generate matching art.

**Spec:**
- 1024×1024 PNG (Retina master)
- Composition: outer ring (axis color) + pale interior + central flat illustration + bottom banner ("kanji + small subtitle")
- All badges share the same composition skeleton — only the center illustration and banner text vary
- Locked state: rendered at 0% saturation + 25% opacity at SwiftUI layer (NOT baked into asset)
- File: `GosyuinMap/Assets.xcassets/Badges/badge_{achievementId}.imageset/badge.svg`
- ID convention matches `Achievement.id` from `CollectorLevel.swift` (e.g. `badge_hatsumoude.svg`, `badge_jinja_5.svg`, `badge_first_journey.svg`)

---

### 6. Tip Gratitude Cards

**Current state:** Not implemented. Placeholder section — StoreKit tip jar is not yet built.

**Generate (when StoreKit lands):**
| # | Asset Name | Purpose |
|---|---|---|
| 1 | `tip_card_arigato` | Basic thank you (washi + 謝 seal) |
| 2 | `tip_card_omamori` | Omamori-style charm visual |
| 3 | `tip_card_ema` | Ema tablet with handwritten thanks |
| 4 | `tip_card_seasonal_sakura` | Spring variant |
| 5 | `tip_card_seasonal_momiji` | Autumn variant |

**Spec:**
- 1080×1920 (vertical share) + 1080×1080 (square share) dual exports
- Style A flat, with one Style C seal accent to keep brand link
- Leave a 300×400 clear area for SwiftUI-rendered thanks copy (user name, amount, date) — don't bake copy in

**Placement:** `Assets.xcassets/TipCards/`

---

## MVP Trial Plan (5 images)

Purpose: **validate tone reproducibility**, not produce finals. Generate in ChatGPT Plus, drag into Figma, score each axis.

| # | Category | Asset | Style | Size | Why |
|---|---|---|---|---|---|
| 1 | App Icon | `app_icon_default_v2` (washi grain version of current) | Brand mark | 1024×1024 | Brand core — confirms washi texture survives at app-icon scale |
| 2 | App Icon | `app_icon_sakura` (spring alt) | Brand mark | 1024×1024 | Checks variant system extensibility |
| 3 | Category Icon | `icon_myojin` (new SVG matching existing 8) | Line silhouette | SVG 64×64 | Confirms we can extend the icon family |
| 4 | Gosyuin Stamp | `stamp_placeholder_jinja` (generic placeholder) | Style C stamp | 1024×1024 | Must match existing 290-stamp feel |
| 5 | Store Hero | `store_hero_1` (watercolor + tagline) | Style B watercolor | 1290×2796 | Validates Style B (never produced at scale before) |

**Scoring (1-5 each):**
- Tone match vs brief
- Technical quality (resolution, AA, color fidelity)
- Reproducibility (same prompt twice → same tone)
- Drop-in readiness (usable as-is or post-processing needed)

**Pass:** all axes ≥ 4. Any axis ≤ 3 → iterate that axis before expanding.

**Wave 2 (post-MVP):** 3 badges in 3 different shape candidates (朱印 / 絵馬 / 円形) of the same achievement, to pick the final badge shape.

---

## Prompt Templates

### Template: Style C gosyuin stamp

> **For Gemini, not DALL-E.** Wave 1 confirmed DALL-E cannot reliably compose this layout.

```
Traditional Japanese gosyuin (temple stamp) artwork.
Square 1:1 composition, 1024x1024.
Warm beige washi paper background with subtle fiber texture.
Centered: circular frame containing a detailed black sumi-ink line drawing of [SUBJECT — e.g., "a five-storied pagoda", "a torii gate with stone path"].
On the left side: vertical black brush-written kanji "[SHRINE NAME]".
On the right side, small: black kanji "[LOCATION]".
Three red square seal-script (tensho) stamps:
  - top center: "奉拝"
  - middle: temple/shrine seal
  - lower-left: location seal
Hand-stamped look — slight ink bleed, imperfect edges, not digitally clean.
No modern elements, no color illustration, no photo realism, no other text.
```

### Template: Style B watercolor hero

```
Japanese watercolor illustration, minimal editorial composition.
Subject: [torii gate / shrine path / five-storied pagoda] at [dawn / dusk].
Soft washi paper texture background, warm beige base.
Sumi-e ink wash with selective vermillion accents (only on the torii / seal, nowhere else).
Gentle gradations, negative space generous, no human figures, no text.
Mood: serene, contemplative, reverent — editorial magazine quality.
Aspect [9:19.5 for store / 16:9 for OG].
```

### Template: App icon variant

```
iOS app icon, 1024x1024, square with full bleed, no rounded corners.
Background: solid vermillion (#C13B2A) gradient, lighter at top, darker at bottom, with very subtle washi paper fiber grain.
Centered: bold geometric pure white torii gate silhouette + a small white circle below the center beam (matches existing brand mark). Thick even strokes, fills ~50% canvas width. Completely flat — no shading on the torii.

[For seasonal variants — CRITICAL: keep the vermillion background; do NOT shift to pink/orange/blue/etc. Only add subtle elements:]
[Spring: 8 small flat white sakura petal silhouettes scattered in empty red areas at ~20% opacity, individual petals not flower clusters]
[Autumn: 8 maple leaf silhouettes, same treatment]
[Winter: small white snowflake silhouettes, same treatment]
[Summer: faint fresh-leaf silhouettes, same treatment]

Petals/leaves/flakes must NOT touch the torii or circle. Reference benchmark: Apple Maps icon level of minimalism.

ABSOLUTELY NO: shrine buildings, mountains, Mt. Fuji, water, waves, decorative circles behind the torii, text, kanji, additional seals, scenery. ONE shape on ONE flat background.
```

### Template: Category icon SVG

```
Single-color silhouette icon, SVG-ready.
64x64 canvas, subject filling ~70% of canvas centered.
Solid fill (single path preferred), no stroke, no gradients.
Subject: [myojin torii / Mount Fuji / biwa lute / etc.]
Style to match existing icon family: chunky, readable at 20x20, minimal internal detail.
Reference aesthetic: the 8 existing icons in `CategoryIcons/` — same visual weight.
```

### Template: Achievement badge (flat illustration)

```
Generate a flat-illustration achievement badge for a Japanese shrine pilgrimage app, 1024×1024 PNG.

Composition (match this template exactly — like an Apple Activity / Duolingo achievement badge):
- Outer thick ring border (about 8% of canvas width thickness), color = [AXIS COLOR: vermillion #C13B2A for milestones / indigo #264C99 for categories / green #338C4D for regions / kincha #99662E for seasonal / gray #807B73 for special]
- Inner pale fill (cream / pale washi tone)
- Center: a flat illustration of [SUBJECT — e.g. "a vermillion torii gate with shrine building behind it on stone steps", "a stylized white fox with red ear tips", "Mount Fuji silhouette with cherry blossoms"]
- Bottom banner inside the ring: "[KANJI / NUMBER]" in bold white, with small English text below like "VISIT" / "INARI" / "DAWN"

Style: flat illustration with soft color blocking, gentle gradients within shapes acceptable. NOT realistic, NOT 3D, NOT photo. Clean geometric edges.

Reference image: the "torii gate emblem with shrine design" badge generated previously — match that exact aesthetic.

ABSOLUTELY NO: gold, no laurel wreath, no ribbons, no Western achievement-badge tropes, no realistic textures, no paper grain, no ink bleed, no "vintage stamp" feel, no English numerals like "10 DAY STREAK" unless explicitly requested.
```

**Workflow per badge:**
1. Generate raster via prompt above (1 badge per ChatGPT message — ChatGPT struggles with 6-grid)
2. Drag PNG into Recraft → auto-vectorize → export SVG
3. If kanji is wrong (DALL-E often is), open SVG in Figma and replace `<text>` element with correct kanji glyph
4. Save to `Assets.xcassets/Badges/badge_{category}_{key}.imageset/badge_{category}_{key}.svg`

---

## File Naming & Integration

### Xcode asset paths
- App icons: `AppIcon.appiconset/` + `AppIconSakura.appiconset/` (one imageset per variant)
- Category icons: `CategoryIcons/icon_{key}.imageset/icon.svg`
- Gosyuin stamps: `ArtworkStamps/stamp_{romaji}.imageset/stamp_{romaji}.png`
- Badges: `Badges/badge_{achievementId}.imageset/badge.svg` — `achievementId` matches `Achievement.id` from `CollectorLevel.swift` exactly (e.g. `badge_hatsumoude`, `badge_jinja_5`, `badge_first_journey`)
- Tip cards: `TipCards/tip_{variant}.imageset/`
- Passport-screen assets: `PassportAssets/{name}.imageset/`

### Off-bundle (not in `.xcassets`)
- App Store screenshots: `/Users/takumi_yasuda/hypes-workspace/gosyuin_store/store_hero_{n}.png`
- OG image: `/Users/takumi_yasuda/hypes-workspace/gosyuin_store/og_share_card.png`

### Naming rules
- All filenames: `snake_case`, ASCII only (no Japanese in filenames)
- Romaji transliteration follows Hepburn — no macrons, long-o written as `ou` or `oo` as the shrine name does (match existing `ArtworkStamps/` convention)
- No version suffixes in final filenames (keep trial versions off-bundle)

---

## Wave 1 Results & Decisions

| # | Asset | Iterations | Status | Decision |
|---|---|---|---|---|
| 1 | `app_icon_default_v2` | 3 | ✓ pass | **Adopt as-is.** Skip washi grain v3 (texture lost at home-screen size, hurts more than helps) |
| 2 | `app_icon_sakura_v2` | 5 | ✓ pass | **Adopt as-is.** Petals readable at full size, dissolve to background at 60px — that's the right behavior for an alt icon |
| 3 | `icon_myojin_raw` | 1 | ◐ post-process | **Trace in Figma → strip the unwanted center circle → save as SVG** in `CategoryIcons/icon_myojin.imageset/icon.svg` |
| 4 | `stamp_placeholder_jinja` | 2 | ✗ defer | **DALL-E cannot do gosyuin layout.** Stamps locked at 290 (Gemini-only path going forward) |
| 5 | `store_hero_b2` | 1 | ✓ direction set | **B2 (composite layout) wins** for App Store screenshots. B1 watercolor moves to OG/LP/share-card surfaces only. Rationale: JP App Store browsers expect feature-rich screenshots; brand minimalism is preserved on AppIcon + in-app surfaces |

### Key learnings (folded into prompting rules above)
- DALL-E + "Japanese shrine" keywords defaults to "Japan pack" (rocks, fuji, sakura, water). Always include explicit negatives.
- Seasonal variants need "keep base color" callout. "Spring" alone makes everything pink.
- English text needs to be enforced explicitly. Japanese drift is the default for shrine context.
- Gosyuin stamps are not a DALL-E task. Keep them on the existing Gemini path.
- Reusing one chat across asset types causes context bleed. One chat per asset family.

## Next Actions

**Wave 2A (in progress):** 38 achievement badges aligned with `Achievement.all` in `CollectorLevel.swift`:
- 5a Milestone (8): `hatsumoude` / `gosha` / `jusha` / `nijugosha` / `gojusha` / `hyakusha` / `nihyakusha` / `zensha`
- 5b Category Mastery (24): each of jinja/tera/jingu/taisha/tenmangu/inari/hachimangu/daishi × 3 tiers (`_1` / `_5` / `_all`)
- 5c Exploration (6): `first_journey` / `east_west` / `variety_5` / `all_categories` / `tokyo_10` / `kansai_10`

Generate raster via ChatGPT (multi-badge grid prompts work well — Wave 2A pilot produced 9 badges in one image with consistent style), then bulk-vectorize via Recraft.

**Wave 2B (next):** Produce remaining 5 category icons in raw silhouette form for Figma tracing — `gongen` / `sengen` / `konpira` / `ebisu` / `benzaiten`.

**Wave 2C (after 2A/2B):** App Store screenshots #2-#5 in B2 composite direction (map / stamp book / collection moment / Learn). Also OG image (1200×630) in B1 watercolor direction.

**Parallel track:** Kanji-QA pass over existing `ArtworkStamps/` — flag any AI-corrupted stamps for regeneration via the Gemini path.

**Xcode integration (Wave 1 outputs):**
1. `wave1_app_icon_default_v2.png` → `Assets.xcassets/AppIcon.appiconset/AppIcon.png` (replace existing)
2. `wave1_app_icon_sakura_v2.png` → new `Assets.xcassets/AppIconSakura.appiconset/` (alt icon, register in Info.plist `CFBundleIcons`)
3. `wave1_icon_myojin_raw.png` → trace in Figma → SVG → `Assets.xcassets/CategoryIcons/icon_myojin.imageset/icon.svg`
4. `wave1_store_hero_b2.png` → archive in `/Users/takumi_yasuda/hypes-workspace/gosyuin_store/` as the B2 reference template

---

## Key Reference Files

- `GosyuinMap/Extensions/Color+Theme.swift` — Design tokens
- `GosyuinMap/Models/CollectorLevel.swift` — Badge data model + achievement list
- `docs/design-rework-brief.md` — Screen-level UI direction (Stamp Book, Passport, Learn, etc.)
- `docs/illustration-roadmap.md` — Style A/B/C exploration history
- `docs/learn-illustrations-brief.md` — Learn tab illustration spec precedent
- `Assets.xcassets/ArtworkStamps/` — 290-stamp library (canonical Style C reference)
- `Assets.xcassets/CategoryIcons/` — 8 existing icon references
