# Learn Tab Illustration Replacement Brief

## Overview

The Learn tab currently uses 9 Canvas-drawn illustrations (1541 lines of code) with a simple stick-figure style. These need to be replaced with polished, consistent illustration assets (PNG images).

**Goal:** Replace all Canvas illustrations with pre-rendered image assets that have a unified, warm, Japanese-inspired illustration style.

---

## Style Direction

**Preferred style:** Warm, flat illustration with subtle texture. Think "Japanese travel guidebook" or "NHK World educational animation" feel. Not photorealistic, not cartoon. Clean lines with soft colors.

**Color palette:**
- Warm cream/beige backgrounds (matching app's `pageBackground` rgb(247,242,235))
- Vermillion red for shrine elements (torii, seals)
- Indigo blue for temple elements
- Soft skin tones
- Muted natural colors (wood brown, stone gray, matcha green)
- Gold accents for coins, ornaments

**Character style:**
- Simple but proportional people (not stick figures, not detailed anime)
- Kimono/casual clothing, shown from side or 3/4 angle
- Expressive through body posture, not facial detail
- Similar to Headspace app meditation illustrations or Notion's illustration style

**Consistency rules:**
- All illustrations: same canvas size (750x500px @3x, so 250x167pt)
- Same line weight across all illustrations
- Same character proportions
- Transparent or matching cream background
- No text baked into illustrations (text is rendered by SwiftUI separately)

---

## Required Illustrations (21 total)

### Shrine Worship Article (5 illustrations)

| # | Asset Name | Scene | Key Elements |
|---|-----------|-------|-------------|
| 1 | `learn_torii_bow` | Person bowing at torii gate | Torii gate (vermillion), person in 3/4 view bowing slightly, stone path, trees in background |
| 2 | `learn_coin_offering` | Person tossing coin into offering box | Saisen box (wooden), 5-yen coin in arc trajectory, person's hand tossing gently |
| 3 | `learn_bell_rope` | Person pulling bell rope | Suzu bell at top, thick shimenawa rope, person gripping rope |
| 4 | `learn_bow_twice` | Person bowing deeply (二礼) | Person at 90-degree bow, shrine hall in background, "x2" indicator |
| 5 | `learn_clap_twice` | Person clapping hands (二拍手) | Hands together at chest height, motion lines around hands, "x2" indicator |

### Temple Worship Article (4 illustrations)

| # | Asset Name | Scene | Key Elements |
|---|-----------|-------|-------------|
| 6 | `learn_incense` | Person at incense burner | Large incense burner (koro), wisps of smoke, person wafting smoke toward self |
| 7 | `learn_temple_coin` | Person at temple offering box | Similar to #2 but with temple elements (no torii, show temple roof line) |
| 8 | `learn_temple_bell` | Person at temple bell | Waniguchi (crocodile-mouth bell), rope, person striking |
| 9 | `learn_prayer_hands` | Hands pressed together in prayer (合掌) | Close-up of hands in gasshō position, eyes closed, subtle incense smoke |

### Temizu Purification Article (5 illustrations)

| # | Asset Name | Scene | Key Elements |
|---|-----------|-------|-------------|
| 10 | `learn_temizu_1` | Pick up ladle | Temizuya (stone basin with water), person reaching for bamboo ladle |
| 11 | `learn_temizu_2` | Rinse left hand | Ladle pouring water over left hand |
| 12 | `learn_temizu_3` | Rinse right hand | Ladle pouring water over right hand |
| 13 | `learn_temizu_4` | Rinse mouth | Water cupped in left hand, person bringing to mouth |
| 14 | `learn_temizu_5` | Tilt ladle to clean | Ladle held vertically, water running down handle |

### Gosyuin Collection Article (5 illustrations)

| # | Asset Name | Scene | Key Elements |
|---|-----------|-------|-------------|
| 15 | `learn_gosyuin_1` | Worship first | Person at shrine/temple praying (establishing that worship comes before collecting) |
| 16 | `learn_gosyuin_2` | Find the gosyuin counter | Counter/window with 御朱印 sign, person approaching |
| 17 | `learn_gosyuin_3` | Hand over gosyuin-cho | Person handing open book to shrine staff across counter |
| 18 | `learn_gosyuin_4` | Wait respectfully | Person standing to the side, waiting, shrine staff writing |
| 19 | `learn_gosyuin_5` | Receive with both hands | Person receiving book back with both hands, bowing slightly |

### Omikuji Article (1 illustration)

| # | Asset Name | Scene | Key Elements |
|---|-----------|-------|-------------|
| 20 | `learn_omikuji` | Drawing a fortune | Omikuji box/cylinder, person shaking it, paper fortune slips |

### General Manners Article (1 illustration)

| # | Asset Name | Scene | Key Elements |
|---|-----------|-------|-------------|
| 21 | `learn_manners` | Respectful behavior overview | Split scene: person walking on path edge (not center), person being quiet, camera with X mark |

---

## Implementation Steps

### Step 1: Generate/create illustrations
- Create 21 PNG images at 750x500px (will be displayed at 250x167pt @3x)
- Ensure consistent style across all images
- Save with transparent or cream (#F7F2EB) background
- Name files exactly as listed in the Asset Name column

### Step 2: Add to Xcode assets
- Add all PNGs to `GosyuinMap/Assets.xcassets/` as image sets
- Each image set should have the @3x version (750x500)
- Optionally provide @2x (500x333) and @1x (250x167)

### Step 3: Replace Canvas views with Image views
- In `LearnDetailView.swift`, replace `AnyView(XxxIllustration(...))` with `AnyView(Image("learn_xxx"))` wrapped in a consistent frame
- Create a simple `LearnIllustration` view:

```swift
struct LearnIllustration: View {
    let name: String

    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
    }
}
```

### Step 4: Clean up
- Delete `EtiquetteIllustrations.swift` (1541 lines of Canvas code)
- Remove from Xcode project (pbxproj)
- Keep `IllustrationFrame` if needed for layout consistency, or inline into `LearnIllustration`

---

## Mapping: Current Canvas View → New Asset

| Current Canvas View | Used In | New Asset(s) |
|---|---|---|
| `ToriiGateIllustration` | Shrine Worship step 1 | `learn_torii_bow` |
| `CoinOfferingIllustration` | Shrine step 2, Temple step 2, General Manners | `learn_coin_offering`, `learn_temple_coin`, `learn_manners` |
| `BowIllustration` | Shrine step 4 | `learn_bow_twice` |
| `ClapIllustration` | Shrine step 5 | `learn_clap_twice` |
| `PrayerHandsIllustration` | Shrine step 6, Temple step 5 | `learn_prayer_hands` |
| `IncenseIllustration` | Temple step 1 | `learn_incense` |
| `TemizuIllustration(step:)` | Temizu steps 1-5 | `learn_temizu_1` through `learn_temizu_5` |
| `GoshuinchoIllustration(step:)` | Gosyuin steps 1-5 | `learn_gosyuin_1` through `learn_gosyuin_5` |
| `OmikujiIllustration` | Omikuji article | `learn_omikuji` |

---

## File References
- `GosyuinMap/Views/Learn/LearnDetailView.swift` - Where illustrations are referenced
- `GosyuinMap/Views/Learn/EtiquetteIllustrations.swift` - Current Canvas code (to be deleted)
- `GosyuinMap/Assets.xcassets/` - Where new image assets go
