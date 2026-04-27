# GosyuinMap Design Rework Brief v2

## Overview

GosyuinMap is an iOS shrine/temple stamp collection app. This brief covers a complete visual rework to achieve a cohesive, premium feel inspired by real gosyuin-cho (御朱印帳). The current UI is functional but looks like a data dashboard. It needs to feel like a treasured, tactile collection.

**Design north star:** "A digital gosyuin-cho that feels as sacred and personal as the real thing."

---

## Design System (Existing Tokens - Must Follow)

### Color Palette
| Token | Value (Light) | Usage |
|-------|---------------|-------|
| `vermillion` | AccentColor (~#C13B2A) | Primary accent (朱色) |
| `pageBackground` | `rgb(247, 242, 235)` warm beige | Page backgrounds |
| `cardBackground` | White | Card surfaces |
| `bodyText` | Dark gray | Body text |
| `subtitleText` | Medium gray | Subtitles, secondary |
| `captionText` | Light gray | Tertiary text |
| `indigo` | `rgb(38, 77, 153)` | Temple/water accent |
| `matcha` | `rgb(51, 140, 77)` | Nature/green |
| `kincha` | `rgb(153, 102, 38)` | Gold/fortune |

### Spacing: xs:4, sm:8, md:12, lg:16, xl:24, xxl:32
### Radius: sm:8, md:12, lg:16, xl:20

### Existing Components (use these, don't recreate)
- `IconBadge(icon:size:color:)` - Circular icon badge
- `SectionHeader(title:icon:trailing:)` - Section headers
- `ProgressBar(progress:color:height:useGradient:)` - Progress bars
- `CategoryIconView(category:size:color:)` - Canvas-drawn category icons (torii, pagoda, etc.)
- `GosyuinStampView(stamp:size:showDate:collectedDate:)` - Individual stamp artwork
- `.cardStyle()` - Standard card background + shadow
- `.accentedCard(accentColor:)` - Card with colored left border
- `.vermillionButtonStyle()` - Primary button
- `DS.Font.*` - Typography tokens

### Rules
- All UI strings in English
- No emojis in UI (use SF Symbols or Canvas drawings)
- Dark mode must work (existing colors auto-adapt)
- SwiftUI only, iOS 18+, Swift 6
- Skeuomorphic textures are encouraged for collection views

---

## Screen 1: Stamp Book / Collect Tab (`CollectView.swift`)

### Reference apps
- **Pokemon TCG Pocket**: Binder album, 3x3 grid pages, swipe to turn, card sleeve edges
- **御朱印帳ダイアリー**: Full-page per gosyuin, washi paper texture, page curl animation
- **Travel stamp apps**: Passport metaphor, ink-stamp overlays on cream pages

### Current problems
- Grid looks like a data table, not a book
- Each stamp is too small (1/3 screen width) to appreciate the artwork
- Uncollected stamps are boring ("?" in a circle/hexagon)
- No "book" feel, just a vertical scroll
- Level card + achievements take up too much space at the top

### Design spec

**Page layout:**
- Horizontal swipe between pages (like a real book/binder)
- Each page shows a 2x3 grid of stamps (6 per page)
- Washi paper texture background on each page (subtle fiber lines, warm cream)
- Leading edge of each page: book spine shadow (linear gradient, ~8px)
- Very subtle page edge on trailing side (1px line to hint there are more pages)

**Stamp cells:**
- **Collected:** Show the GosyuinStampView artwork, full color, with a very subtle paper inset shadow
- **Uncollected:** Show a faint silhouette of the category icon (CategoryIconView at 0.08 opacity) on a slightly darker washi background. Show the shrine name in tiny text below. This creates mystery and anticipation, not just a blank "?". Think Pokemon HOME silhouettes.

**Book header (above pages):**
- Category filter chips (same as current)
- Compact label: "Shrine 7/120" showing collected/total for active filter
- Page indicator: "Page 1 of 20" with left/right arrows

**Top section (above the book):**
- Level card: Keep current compact design (kanji hero, XP bar, count). It's good.
- Achievements: Show as one-line summary only ("15/38 Achievements, Next: Collect 25 stamps"). Tap opens a detail sheet. Do NOT show the full badge grid on this page.

### Files to modify
- `GosyuinMap/Views/Collect/CollectView.swift` - Main layout and book view
- `GosyuinMap/Views/Collect/GosyuinStampView.swift` - May need slight adjustments for the new cell size
- `GosyuinMap/Views/Collect/GosyuinBookSpreadView.swift` - Can be removed or repurposed

---

## Screen 2: My Journey / Passport (`ShrinePassportView.swift`)

### Reference apps
- Travel passport apps with leather covers and ink stamps
- Spotify Wrapped summary cards (designed to be screenshotted)

### Current problems
- Level roadmap dots are tiny and inconsistent
- Badge summary dots are hard to parse
- The card doesn't feel "shareable" enough

### Design spec

**Overall feel:** This is the "shareable card" view. Design it as if every user will screenshot it and post to Instagram/LINE.

**Level roadmap:**
- Replace tiny dots with a horizontal "pilgrimage trail" path
- Current level node: large (24px), filled with gradient, white border, icon inside
- Completed levels: medium (14px), filled with level color, checkmark inside
- Future levels: small (10px), gray empty circle
- Connected by a horizontal track line (filled up to current level, gray after)
- Show kanji labels only for: first level, current level, final level

**Stats section:**
- Hero stat: Visited count, prominently sized (48pt font), vermillion color
- Supporting stats in a row below: Types, Regions, Badges (smaller, with icons)
- Clear visual hierarchy: one big number, three small ones

**Badge summary:**
- For each achievement category: show category name + progress bar + "X/Y" count
- No individual badge dots, too cramped. Keep it clean.
- Use `ProgressBar` component

**Map section:** The Canvas-drawn Japan map is good. Keep it. Make connection lines slightly more visible (use dashed vermillion lines instead of barely-visible solid ones).

### Files to modify
- `GosyuinMap/Views/Collect/ShrinePassportView.swift`

---

## Screen 3: Stamp Collection Prompt (`StampCollectionPrompt.swift`)

### Reference apps
- Duolingo lesson completion celebration
- Pokemon TCG Pocket card pack opening

### Current state (already improved)
The current implementation has: category icon (Canvas drawn), stamp artwork reveal animation, expanding rings, confetti particles, and reward notification cards. This is already decent.

### Design spec (polish only)

- The stamp artwork reveal (GosyuinStampView appearing with scale+rotation spring) is the hero moment. Make sure it lingers for ~2 seconds before fading.
- Confetti: Use the shrine's category color as the dominant confetti color, with vermillion and kincha as accents.
- Reward cards (level-up, badge unlock): Keep the current card layout but add a subtle sparkle icon on the trailing side.
- The "Collect Stamp" button should pulse subtly (opacity 0.85-1.0, repeating) to draw attention.

### Files to modify
- `GosyuinMap/Views/Explore/StampCollectionPrompt.swift`

---

## Screen 4: Learn Tab (`LearnDetailView.swift`, `LearnListView.swift`, `EtiquetteIllustrations.swift`)

### Current problems (critical)
- Illustrations use **emoji icons** (castle emoji, mountain emoji) for shrine/temple type cards. This looks cheap and inconsistent with the rest of the app.
- Canvas illustrations (people, torii, coin toss, etc.) are charming but vary in quality and style.
- Illustration background colors are inconsistent (some pink, some beige, some blue-tinted).
- Step cards have varying heights and padding depending on whether they have an illustration.
- No visual progress indicator (user doesn't know "I'm on step 3 of 7").

### Design spec

**Type cards (Shrine & Temple Types article):**
- Replace ALL emoji icons with `CategoryIconView` Canvas drawings. The app already has custom Canvas icons for each category (torii for jinja, pagoda for tera, crown for jingu, mountain for taisha, etc.).
- Each type card should use: CategoryIconView on the left (48x48, in a circle with the category color at 0.1 opacity), then title + Japanese subtitle + description + examples.
- Consistent card height within the same article.

**Step illustrations (Shrine Worship, Temple Worship, Temizu, etc.):**
- Normalize all illustration background colors to a single palette:
  - Shrine-related articles: warm cream `rgb(255, 245, 238)` (same as washi paper)
  - Temple-related articles: soft blue-gray `rgb(238, 242, 248)`
- Ensure all illustration frames are the same height (200px) with consistent padding.
- Illustrations that are missing (e.g., bell ringing, incense step 1) should show a simple placeholder using the relevant SF Symbol at large size + caption, not just omit the illustration.

**Step progress indicator:**
- Add a horizontal progress indicator at the top of each detail view showing "Step X of Y" with small dots or a progress bar.
- Current step highlighted with the article's accent color.

**Card consistency:**
- All step cards: consistent structure of [number badge] [title + Japanese subtitle] [optional illustration] [description text]
- All note/info cards: consistent use of `.accentedCard(accentColor:)` with the article's theme color
- Corner radius: Use `DS.Radius.lg` (16) for all cards uniformly

**Article list (LearnListView):**
- Each article card should show a small preview illustration or category icon, not just the SF Symbol icon
- Add a subtle completion indicator if the user has read the article (optional, low priority)

### Files to modify
- `GosyuinMap/Views/Learn/LearnDetailView.swift` - Replace emoji type icons, normalize card layouts
- `GosyuinMap/Views/Learn/LearnListView.swift` - Optionally improve card previews
- `GosyuinMap/Views/Learn/EtiquetteIllustrations.swift` - Normalize background colors
- `GosyuinMap/Models/GuideArticle.swift` - May need to add step count data

---

## Screen 5: Place Detail (`PlaceDetailContent.swift`)

### Current state (already improved by Cowork)
The place detail now uses `IconBadge`, `CategoryIconView` in the hero map, and `Color.subtitleText`/`Color.captionText` consistently. The "Visit to Collect" prompt is moved near the top.

### Design spec (minor polish)
- The hero map annotation now uses CategoryIconView, which is good. Keep it.
- Photo gallery: Add rounded corner radius consistent with `DS.Radius.lg`
- Review cards: Ensure star ratings use `Color.kincha` instead of `.orange` for consistency with the app's gold palette

### Files to modify
- `GosyuinMap/Views/Explore/Sheet/PlaceDetailContent.swift` - Minor color tweaks only

---

## Implementation Priority

1. **Stamp Book (Screen 1)** - Most impactful, core experience
2. **Learn Tab (Screen 4)** - Emoji icons are the most visually jarring issue
3. **My Journey (Screen 2)** - Polish for shareability
4. **Stamp Collection Prompt (Screen 3)** - Already decent, just polish
5. **Place Detail (Screen 5)** - Minor tweaks

## Build & Run
```sh
cd /Users/takumi_yasuda/personal/gosyuin
open GosyuinMap.xcodeproj
# Cmd+R with iPhone 17 Pro simulator
```

## Key Reference Files (read-only, for design context)
- `GosyuinMap/Extensions/Color+Theme.swift` - All design tokens + DS constants
- `GosyuinMap/Models/CollectorLevel.swift` - 12 levels + 38 achievements
- `GosyuinMap/Views/Explore/Annotations/CategoryIconView.swift` - Custom Canvas category icons
- `GosyuinMap/Models/StampDefinition.swift` - Stamp definitions with artwork
