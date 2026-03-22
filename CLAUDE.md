# GosyuinMap

A location-based shrine stamp collecting app for iOS.

## Project Overview

- **Bundle ID**: `com.bjprodby.gosyuinmap`
- **Deployment Target**: iOS 18.0
- **Frameworks**: SwiftUI + SwiftData + MapKit + ActivityKit + Google Places Swift SDK
- **Swift Version**: 6.0
- **Xcode**: 16.0+ (Liquid Glass requires Xcode 26 + iOS 26 SDK)

## Directory Structure

```
GosyuinMap.xcodeproj/
GosyuinMap/
├── GosyuinMapApp.swift         # @main entry point (onboarding gate + splash + Places SDK init)
├── Secrets.swift               # API key configuration (Google Places)
├── ContentView.swift           # TabView (3 tabs)
├── Views/
│   ├── OnboardingView.swift    # First-launch onboarding (3 pages)
│   ├── SplashView.swift        # Returning user splash screen
│   ├── Explore/                # Map tab
│   │   ├── ExploreView.swift
│   │   ├── ShrineDetailView.swift
│   │   ├── ExploreSearchSheet.swift    # Apple Maps-style search sheet
│   │   └── StampCollectionPrompt.swift # Proximity-triggered collection UI
│   ├── Collect/                # Stamp Book tab
│   │   ├── CollectView.swift
│   │   └── StampDetailView.swift
│   └── Learn/                  # Learn tab
│       ├── LearnListView.swift
│       └── LearnDetailView.swift
├── Models/
│   ├── CollectedStamp.swift            # SwiftData model (stamp collection)
│   ├── Shrine.swift                    # Shrine data (8 samples, stable UUIDs)
│   ├── StampDefinition.swift           # Stamp definitions
│   ├── GuideArticle.swift              # Guide article definitions
│   └── GosyuinActivityAttributes.swift # Live Activity attributes (proximity)
├── Services/
│   ├── LocationService.swift           # Location + proximity detection (~100m)
│   ├── WorshipSessionManager.swift     # ProximityActivityManager (Live Activity)
│   ├── GooglePlacesService.swift       # Google Places Swift SDK wrapper
│   └── ShrineSearchService.swift       # Google Places + MKLocalSearch (fallback)
├── Extensions/
│   ├── GlassEffect+Adaptive.swift      # Liquid Glass helper
│   └── Color+Theme.swift               # Theme colors + DS constants
├── Assets.xcassets/
├── Preview Content/
└── Info.plist
```

## Architecture

### 3-Tab Structure

| Tab | View | Function |
|-----|------|----------|
| Explore | `ExploreView` | MapKit map + search sheet + proximity stamp collection |
| Collect | `CollectView` | Stamp book grid showing collection progress |
| Learn | `LearnListView` | Shrine visit etiquette guides |

### App Flow

1. **First launch** → `OnboardingView` (3 pages: welcome, location permission, ready)
2. **Returning users** → `SplashView` (1.5s) → `ContentView`
3. **Stamp collection** → Proximity-based: when user is within ~100m of a shrine, `StampCollectionPrompt` sheet appears automatically

### Data Model (SwiftData)

`CollectedStamp`: Stamp collection status
- `slotId`, `collectedDate`

### Location-Based Collection

- `LocationService` tracks user location with 20m distance filter
- Checks proximity to all unvisited shrines on each update
- Triggers `StampCollectionPrompt` when within 100m
- Collected stamps are excluded from future proximity alerts

### Live Activities

- `GosyuinActivityAttributes`: proximity-based (shrineName, distance, isCollected)
- `ProximityActivityManager`: start/update/collect/end activity lifecycle
- Widget shows shrine name + distance or collected checkmark

## Development Rules

- All UI strings are in English
- SwiftUI previews use `#Preview` macro
- SwiftData previews use `.modelContainer(for:inMemory:)`
- Use iOS 18 `Tab` initializer (`.tabItem` is deprecated)
- When adding files, update `.xcodeproj/project.pbxproj` Sources/Resources build phases
- Custom colors require explicit `Color.` prefix in `.foregroundStyle()` and `.tint()` (iOS 26 SDK)
- `seedSampleDataIfNeeded` is `#if DEBUG` only
- Search uses Google Places Swift SDK (primary) with MKLocalSearch fallback
- Google Places types: `shinto_shrine`, `buddhist_temple` for Nearby Search
- API key configured in `Secrets.swift` (via Info.plist build setting or hardcoded)
- SPM package: `https://github.com/googlemaps/ios-places-sdk`

## Build & Run

```sh
open GosyuinMap.xcodeproj
# Cmd+R in Xcode (use iPhone 17 Pro simulator)
```

Simulator: set custom location near a sample shrine to test proximity collection.
