# GosyuinMap

A location-based shrine stamp collecting app for iOS.

## Project Overview

- **Bundle ID**: `com.bjprodby.gosyuinmap`
- **Deployment Target**: iOS 18.0
- **Frameworks**: SwiftUI, SwiftData, MapKit, ActivityKit, StoreKit 2, Lottie
- **Swift Version**: 6.0
- **Xcode**: 16.0+

## Directory Structure

```
GosyuinMap/
  GosyuinMapApp.swift              @main entry (onboarding gate + splash + Transaction listener)
  ContentView.swift                TabView (Explore, Collect, Learn)

  Views/
    Explore/
      ExploreView.swift            Map tab, proximity detection, stamp collection trigger
      ExploreState.swift           Map state management
      ShrineDetailView.swift       Shrine info page
      StampCollectionPrompt.swift  Full-screen collection celebration (Lottie + SwiftUI particles)
      TipJarCard.swift             Inline tip card shown after stamp collection
      Annotations/                 ShrinePinView, CategoryIconView
      Sheet/                       ExploreSearchContent, PlaceDetailContent, DirectionsSheet
      Navigation/                  NavigationETABar, NavigationTopBar, RecenterButton
      Overlay/                     FloatingSearchBar, FloatingCategoryChips, MapFloatingButtons
    Collect/
      CollectView.swift            Stats hero (count/progress/this week/this month) + paginated gosyuin book
      StampDetailView.swift        Individual stamp detail
      GosyuinStampView.swift       Grid stamp display (hexagon/circle alternation)
      GosyuinArtworkView.swift     Large stamp artwork (detail page)
      GosyuinBookSpreadView.swift  Book page layout
    Learn/
      LearnListView.swift          Article list with staggered entrance
      LearnDetailView.swift        Illustrated step-by-step guides
      EtiquetteIllustrations.swift Canvas-drawn illustrations (legacy, being replaced by PNGs)
      GuideArticleIcon.swift       Guide icon component
    Settings/
      SettingsView.swift           Settings + comprehensive DEBUG menu
      TipJarFullView.swift         Full tip jar page (3 tiers with images)
    OnboardingView.swift           4-page first launch (Discover, Collect, Learn, Start)
    SplashView.swift               Returning user splash (1.5s)

  Models/
    CollectedStamp.swift           SwiftData model (slotId, collectedDate)
    Shrine.swift                   Shrine data + ShrineCategory enum
    ShrineData_*.swift             8 regional shrine data files (290+ shrines)
    StampDefinition.swift          290+ stamp visual definitions
    GuideArticle.swift             Learn tab article definitions
    JapanCoordinates.swift         Japan geography coordinates
    GosyuinActivityAttributes.swift  Live Activity attributes

  Services/
    LocationService.swift          CoreLocation + proximity detection (100m threshold)
    ShrineSearchService.swift      MKLocalSearch (Japanese queries, English display)
    DirectionsService.swift        MapKit directions
    GooglePlacesService.swift      Optional Google Places enrichment
    WorshipSessionManager.swift    Live Activity lifecycle
    TipStore.swift                 StoreKit 2 consumable products (3 tiers)
    TipPromptController.swift      Tip display frequency gating (@AppStorage)

  Extensions/
    Color+Theme.swift              Semantic colors, DS namespace (Spacing, Radius, Anim, Font)
    Animation+DS.swift             Animation modifiers, AnimatedCounter, AnimationSequence
    GlassEffect+Adaptive.swift     Liquid Glass helper

  Resources/
    Animations/                    Lottie JSON files (confetti, fireworks, sparkle, etc.)
    Tips.storekit                  StoreKit testing configuration (3 consumable products)
  Assets.xcassets/
    AppIcon                        Vermillion torii icon (Wave 1)
    ArtworkStamps/                 290+ stamp PNG images (1024x1024)
    Avatars/                       Bonus character avatars (unused, reserved)
    TipCards/                       Tip tier illustrations (saisen, omamori, goshuin)
    GuideIcons/                    Learn tab guide icons (SVG)
    LearnIllustrations/            Step-by-step guide illustrations (PNG)
    TypeIllustrations/             Shrine/temple type illustrations (PNG)

GosyuinMapWidget/                  Live Activity widget extension
```

## Architecture

### App Flow

1. **First launch**: `OnboardingView` (4 pages) with location permission request
2. **Returning users**: `SplashView` (1.5s) then `ContentView` (3 tabs)
3. **Stamp collection**: Proximity-based (100m), `StampCollectionPrompt` full-screen celebration
4. **Onboarding state**: Persisted via `@AppStorage("hasCompletedOnboarding")`

### Stamp Collection Sequence

1. User within 100m of uncollected shrine (LocationService)
2. StampCollectionPrompt appears (fullScreenCover from Explore, sheet from Debug)
3. "Collect Stamp" tap triggers phased animation:
   - Phase 1 (0ms): Ink wave + screen flash + screen shake + haptic impact
   - Phase 2 (100ms): Stamp slams in (scale 2.5 to 1.0, rotation -20 to 0)
   - Phase 3 (400ms): "Stamp Collected!" title bounces in
   - Phase 4 (500ms): Lottie confetti + SwiftUI sakura petal particles
   - Phase 5 (1500ms): Done button fades in
   - Phase 6 (2500ms+): Tip card (if frequency gate allows)

### Design System (DS namespace)

```swift
DS.Spacing   // xs(4), sm(8), md(12), lg(16), xl(24), xxl(32)
DS.Radius    // sm(8), md(12), lg(16), xl(20), pill(999)
DS.Font      // sectionLabel, statHero, statMedium, statSmall, etc.
DS.Anim      // press, stamp, select, reveal, collect, entrance, celebration, etc.
```

View modifiers: `.cardStyle()`, `.vermillionButtonStyle()`, `.accentedCard()`
Animation modifiers: `.appearAnimation()`, `.popIn()`, `.slideUp()`, `.celebrationPop()`, `.pulseLoop()`
Button styles: `.pressable`, `.stamp`

### Collect Tab Stats Hero

The Collect tab opens with a stats card showing collection totals — no gamification (no levels, no achievements, no passport). Layout:

- Section label: "STAMPS COLLECTED" + percentage (top-right)
- Big animated count (`statHero`) + "/ 290" denominator
- Vermillion progress bar
- Three sub-stats: This week / This month / Last stamp date

### Tip Jar (StoreKit 2)

3 consumable products:
- `com.bjprodby.gosyuinmap.tip.small` (Saisen, ~$1)
- `com.bjprodby.gosyuinmap.tip.medium` (Omamori, ~$3)
- `com.bjprodby.gosyuinmap.tip.large` (Goshuin, ~$5)

Frequency: first 5 stamps skipped, then every 5th collection. "Don't show again" permanently hides. Re-enable in Settings.

**App Store Connect is NOT set up yet.** Products work via `Tips.storekit` testing config in Xcode scheme.

## Development Rules

- All UI strings in English
- SwiftUI previews use `#Preview` macro
- SwiftData previews use `.modelContainer(for:inMemory:)`
- Custom colors require explicit `Color.` prefix
- Use `DS.Anim` tokens instead of raw animation values
- Lottie animations loaded via `LottieView(animation: .named("filename"))` (no .json extension)
- When adding files, update `project.pbxproj` (PBXBuildFile, PBXFileReference, PBXGroup, Sources/Resources build phase)
- Search categories: English display names, Japanese queries for MKLocalSearch
- Auto-seed removed from CollectView. Use Settings > Debug to add stamps.

## Known Issues / Future Work

- Lottie animation files (confetti, fireworks, etc.) are placeholder quality from public CDN. Replace with custom-designed animations matching the washi/vermillion aesthetic.
- Animation choreography needs further polish (per user feedback, target Pokemon GO-level celebration).
- App Store Connect setup required before release (Paid Applications Agreement, bank account, 3 consumable products).
- Some stamp artwork images are AI-generated (Gemini) and may need quality review.
- Learn tab illustrations being transitioned from Canvas-drawn to AI-generated PNGs.

## Build & Run

```sh
open GosyuinMap.xcodeproj
# Cmd+R (iPhone 17 Pro simulator recommended)
# StoreKit testing works automatically via Tips.storekit in scheme
```

For real device: trust developer certificate in Settings > General > VPN & Device Management.

Debug menu: Collect tab > gear icon > Settings > Debug section.
