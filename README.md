# GosyuinMap

A location-based shrine stamp collecting app for iOS. Discover shrines and temples across Japan, collect digital gosyuin stamps by visiting them, and learn about shrine visit etiquette.

## Features

- **Explore** - Interactive MapKit map with shrine/temple search and category filtering
- **Collect** - Digital stamp book that tracks your gosyuin collection progress
- **Learn** - Guides on shrine visit etiquette and shrine/temple types
- **Proximity Detection** - Automatically detects when you're near a shrine (~100m) and prompts stamp collection
- **Live Activities** - Shows nearby shrine info on lock screen via ActivityKit

## Tech Stack

| Technology | Usage |
|---|---|
| SwiftUI | UI framework |
| SwiftData | Local data persistence |
| MapKit | Map display and search |
| ActivityKit | Live Activities for proximity alerts |
| CoreLocation | Location tracking |

- **Deployment Target**: iOS 18.0
- **Swift**: 6.0
- **Xcode**: 16.0+ (Liquid Glass features require Xcode 26 + iOS 26 SDK)

## Project Structure

```
GosyuinMap/
├── Views/
│   ├── Explore/       # Map tab - search, annotations, navigation, shrine details
│   ├── Collect/       # Stamp book tab - collection grid, stamp artwork
│   └── Learn/         # Etiquette guides
├── Models/            # SwiftData models, shrine data by region
├── Services/          # Location, directions, search services
├── Extensions/        # Theme colors, Liquid Glass helpers
└── Resources/         # Localization, assets
GosyuinMapWidget/      # Live Activity widget
scripts/               # Build & utility scripts
```

## Getting Started

### Prerequisites

- Xcode 16.0+
- iOS 18.0+ simulator or device

### Build & Run

```sh
git clone git@github.com:bjprodby-svg/gosyuin.git
cd gosyuin
open GosyuinMap.xcodeproj
# Press Cmd+R in Xcode (use iPhone 17 Pro simulator)
```

### Testing Proximity Features

In the iOS Simulator, set a custom location near a sample shrine to test proximity-based stamp collection:
- Simulator menu > Features > Location > Custom Location

## Architecture

### App Flow

1. **First launch** → Onboarding (3 pages: welcome, location permission, ready)
2. **Returning users** → Splash screen → Main tabs
3. **Stamp collection** → Proximity-based: automatic prompt when within ~100m of a shrine

### Data Model (SwiftData)

- `CollectedStamp` - Tracks stamp collection status (slotId, collectedDate)
- `Shrine` - Shrine data with coordinates, organized by region
- `StampDefinition` - Stamp visual definitions
- `GuideArticle` - Learn tab content

### Location-Based Collection

- `LocationService` tracks user location with 20m distance filter
- Checks proximity to all unvisited shrines on each location update
- Triggers collection prompt within 100m
- Collected stamps are excluded from future proximity alerts

## Development

See [CLAUDE.md](./CLAUDE.md) for detailed development rules and conventions.
