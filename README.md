# GosyuinMap

A location-based shrine stamp collecting app for iOS. Visit real shrines and temples across Japan, collect digital gosyuin stamps, track your pilgrimage progress, and learn about shrine visit etiquette.

## Features

### Explore
Interactive MapKit map with shrine/temple discovery. Search by name, filter by category (Jinja, Tera, Inari, Taisha, etc.), get directions, and navigate to shrines.

### Collect
Digital stamp book with 290+ unique gosyuin stamps. Proximity-based collection triggers automatically when you're within 100m of a shrine. Celebration animations with confetti, level-up overlays, and badge rewards.

### Learn
Illustrated guides on shrine visit etiquette: Shinto worship (sanpai), temple worship, temizu (hand purification), omikuji (fortune drawing), gosyuin (stamp book) basics, and visitor manners.

### Progression System
- 12-tier collector levels (Hatsumairi to Shinshi) with unique avatars
- Achievement badges for milestones, category completions, and regional exploration
- Shrine Passport with pilgrimage trail visualization and journey statistics

### Tip Jar
Optional support via StoreKit 2 (Saisen / Omamori / Goshuin tiers). Non-intrusive, frequency-gated, dismissible.

## Tech Stack

| Technology | Usage |
|---|---|
| SwiftUI | UI framework |
| SwiftData | Local data persistence |
| MapKit | Map display and search |
| Lottie | Rich celebration animations |
| StoreKit 2 | In-app tip jar |
| ActivityKit | Live Activities for proximity alerts |
| CoreLocation | Location tracking and proximity detection |

- **Platform**: iOS 18.0+
- **Swift**: 6.0
- **Xcode**: 16.0+

## Project Structure

```
GosyuinMap/
  Views/
    Explore/         Map tab, shrine pins, search, navigation, stamp collection prompt
    Collect/         Stamp book, level card, passport, level detail, avatar, badge
    Learn/           Illustrated etiquette guides
    Settings/        Settings, tip jar
  Models/            SwiftData models, shrine data (8 regions), stamps, levels, achievements
  Services/          Location, directions, search, StoreKit tip store
  Extensions/        Design system (DS), animation tokens, Liquid Glass
  Resources/         Lottie animations, StoreKit config, localization
GosyuinMapWidget/    Live Activity widget
docs/                Design specs, animation specs, illustration roadmap
```

## Getting Started

```sh
git clone git@github.com:bjprodby-svg/gosyuin.git
cd gosyuin
cp GosyuinMap/Config/Secrets.xcconfig.sample GosyuinMap/Config/Secrets.xcconfig
# Edit Secrets.xcconfig and paste your Google "Places API (New)" key.
open GosyuinMap.xcodeproj
# Cmd+R in Xcode (iPhone 17 Pro simulator recommended)
```

### Google Places API Key

The app uses Google Places API (New) to enrich shrine pages with photos, ratings,
reviews and opening hours, to discover shrines in the visible map area, and to
power name search beyond the bundled list. Without a key, the app still runs —
it just falls back to the curated 290 shrine list.

- Get a key from Google Cloud Console with **Places API (New)** enabled.
- Restrict the key to the iOS bundle id `com.bjprodby.gosyuinmap` for safety.
- Put it in `GosyuinMap/Config/Secrets.xcconfig` (gitignored). The file
  references `$(GOOGLE_PLACES_API_KEY)` from `Info.plist` at build time.

### Debug Menu

The app includes a comprehensive debug menu (DEBUG builds only) accessible from **Collect tab > gear icon > Settings**:

- **Collect a Stamp**: Trigger the full stamp collection flow with animations
- **Level Up + Tip + Collect**: One-tap to experience level-up celebration, badge unlock, and tip card
- **First Ever Stamp**: Reset and experience the initial collection
- **Stamp Stepper**: Fine-grained control over stamp count
- **Reset Onboarding**: Re-experience the first launch flow

### StoreKit Testing

The project includes a `Tips.storekit` configuration file, pre-configured in the run scheme. StoreKit products work automatically in the simulator.

## Design System

The app uses a centralized design system (`DS` namespace) for consistency:

- `DS.Spacing` / `DS.Radius` / `DS.Font`: Layout tokens
- `DS.Anim`: Animation tokens (press, reveal, collect, celebration, etc.)
- Reusable modifiers: `.cardStyle()`, `.vermillionButtonStyle()`, `.appearAnimation()`, `.popIn()`, `.celebrationPop()`
- Semantic colors: vermillion, pageBackground, kincha, matcha, indigo
- Button styles: `.pressable`, `.stamp`

## Architecture

### App Flow

1. **First launch**: 4-page onboarding (Discover, Collect, Learn, Start)
2. **Returning users**: Splash screen (1.5s) then 3-tab main view
3. **Stamp collection**: Proximity-based (100m threshold), full celebration animation sequence

### Data Model

| Model | Purpose |
|---|---|
| `CollectedStamp` | SwiftData. Tracks slotId and collectedDate |
| `Shrine` | Static data with coordinates, category, organized by 8 regions |
| `StampDefinition` | 290+ stamp visual definitions with artwork references |
| `CollectorLevel` | 12-tier progression system with thresholds and achievements |

### Animation System

Two-layer approach:
1. **DS.Anim tokens**: SwiftUI native animations for UI transitions
2. **Lottie**: Rich celebration effects (confetti, level-up, sparkles, fireworks)

Custom SwiftUI particle systems for themed confetti (sakura petals, gold flecks).

## Development

See [CLAUDE.md](./CLAUDE.md) for development rules and conventions.

## License

This project is not open-source. All rights reserved.
