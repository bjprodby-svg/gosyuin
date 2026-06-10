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
      CollectView.swift            Stamp book with paginated gosyuin grid
      StampDetailView.swift        Individual stamp detail
      GosyuinStampView.swift       Grid stamp display (hexagon/circle alternation)
      GosyuinArtworkView.swift     Large stamp artwork (detail page)
      GosyuinBookSpreadView.swift  Book page layout
      ShrinePassportView.swift     Journey card with pilgrimage trail + map + stats
      LevelDetailView.swift        Level progress + achievement list (tappable from level card)
      AvatarView.swift             Flat-illustration avatar per collector level
      BadgeView.swift              SVG badge component
    Learn/
      LearnListView.swift          Article list with staggered entrance
      LearnDetailView.swift        Illustrated step-by-step guides
      GuideArticleIcon.swift       Guide icon component
    Settings/
      SettingsView.swift           Settings + comprehensive DEBUG menu
      TipJarFullView.swift         Full tip jar page (3 tiers with images)
    OnboardingView.swift           4-page first launch (Discover, Collect, Learn, Start)
    SplashView.swift               Returning user splash (1.5s)

  Models/
    CollectedStamp.swift           SwiftData model (slotId, collectedDate)
    Shrine.swift                   Shrine model + ShrineCategory enum + JSON loader (Resources/shrines.json, 480 shrines)
    StampDefinition.swift          Stamp model + JSON loader (Resources/stamps.json, 290 stamps)
    CollectorLevel.swift           12-tier level system + Achievement + AchievementCategory
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

  Resources/
    shrines.json                   Shrine catalog (480 shrines, loaded at launch)
    stamps.json                    Stamp catalog (290 stamps, loaded at launch)
    shrine_images.json             Optional image-URL overlay keyed by shrine name
    Animations/                    Lottie JSON files (confetti, fireworks, sparkle, etc.)
    Tips.storekit                  StoreKit testing configuration (3 consumable products)
  Assets.xcassets/
    AppIcon                        Vermillion torii icon (Wave 1)
    ArtworkStamps/                 290+ stamp PNG images (1024x1024)
    Avatars/                       12 level avatars + bonus character avatars
    Badges/                        SVG achievement badges
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
   - Phase 5 (1000ms): Reward rows cascade (level up, badges) with stagger
   - Phase 6 (1600ms): Level Up overlay (if applicable) with Lottie fireworks
   - Phase 7 (2500ms+): Tip card (if frequency gate allows)

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

### Collector Level System (12 tiers)

| Lv | Kanji | Title | Threshold |
|----|-------|-------|-----------|
| 1 | 初参 | Hatsumairi | 0 |
| 2 | 参り | Mairi | 1 |
| 3 | 巡り | Meguri | 3 |
| 4 | 遍路 | Henro | 7 |
| 5 | 旅人 | Tabibito | 15 |
| 6 | 山伏 | Yamabushi | 30 |
| 7 | 先達 | Sendatsu | 50 |
| 8 | 行者 | Gyoja | 80 |
| 9 | 主 | Nushi | 120 |
| 10 | 大権現 | Daigongen | 180 |
| 11 | 明神 | Myojin | 250 |
| 12 | 神使 | Shinshi | 380 |

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
