# Gosyuin Stamp Collection Animation - Functional Spec

## 1. Document Info

| Field | Value |
|-------|-------|
| Owner | @takumi_yasuda |
| Designer | @takumi_yasuda |
| Developer | @takumi_yasuda |
| Status | Draft |
| Target Release | TBD |
| Jira Ticket | TBD |
| Figma Design | TBD |
| Created | 2026-03-21 |
| Last Updated | 2026-03-21 |

---

## 2. What & Why

### What

- Enhance the stamp collection animation in `StampCollectionPrompt` to deliver a more immersive, physically satisfying "ink press" experience
- Add a multi-phase animation system: Anticipation → Impact → Celebration → Collection
- Introduce dynamic reward scaling that increases animation intensity at collection milestones
- Add particle/confetti effects for the celebration phase
- Add optional sound design layer synchronized with haptic feedback
- Improve the post-stamp share card for social sharing

### Why

The stamp collection moment is the core reward loop of GosyuinMap. A richer, more physical animation creates a stronger emotional anchor for each shrine visit, increasing user motivation to visit more shrines. Research shows that apps like Duolingo and Pokémon GO use escalating celebration animations to reinforce habit formation and make milestone moments memorable.

---

## 3. Functionality

### 3.1 Current State (Baseline)

The existing `StampCollectionPrompt.swift` already implements:

- Long-press gesture with 1.0s `pressDuration` and progress ring
- Ghost preview during pressing (opacity ramps with progress)
- Ink spread mask expanding from center (`Circle().scaleEffect(inkReveal)`)
- Squish effect on contact (`squish = 0.97` → spring back to `1.0`)
- Random rotation (`-3°...3°`) for a realistic hand-press feel
- 3-step haptic chain: medium impact(0.6) → heavy impact(1.0) → success
- Washi paper texture background (procedurally generated)
- Post-stamp buttons: Share, View in Stamp Book, Done

This spec builds on top of this existing system. No existing animations are removed; they are enhanced.

### 3.2 Enhanced Animation Phases

The stamp collection animation is structured into 4 sequential phases:

#### Phase 1: Anticipation (during long-press, 0–1.0s)

| Element | Current | Enhanced |
|---------|---------|----------|
| Progress ring | ✅ Circle trim stroke | No change |
| Ghost preview | ✅ Opacity 0.15→0.40 | Add subtle pulse (scale 1.0↔1.02, 0.5s loop) |
| Button fill | ✅ Leading-edge progress fill | No change |
| Haptic | ✅ medium impact at press start | Add light ticks every 0.25s during hold |
| Sound | ❌ None | Soft paper-rustle loop (optional, respects system mute) |
| Background | ❌ Static | Subtle vignette darkening (opacity 0→0.05) |

#### Phase 2: Impact (stamp presses into paper, 0–0.3s after release)

| Element | Current | Enhanced |
|---------|---------|----------|
| Stamp appear | ✅ scale 1.05, opacity 0.7 | No change |
| Squish | ✅ 0.97 compression | No change |
| Ink spread | ✅ Circle mask expands | Add radial ink bleed texture (subtle irregular edge) |
| Rotation | ✅ Random -3°...3° | No change |
| Haptic | ✅ heavy impact(1.0) | No change |
| Sound | ❌ None | Single "don" (木魚-like thud), ~100ms |
| Screen shake | ❌ None | Micro-shake: offset ±2pt for 0.15s (optional, milestone only) |

#### Phase 3: Celebration (0.3–1.5s after stamp)

| Element | Current | Enhanced |
|---------|---------|----------|
| Checkmark | ✅ Checkmark + "Stamp Collected!" | No change to text |
| Celebration opacity | ✅ Spring animation | No change |
| Haptic | ✅ success feedback | No change |
| Particles | ❌ None | **NEW**: Confetti burst from stamp center (see §3.3) |
| Glow | ❌ None | **NEW**: Soft radial glow behind stamp (stampColor, opacity 0→0.3→0, 1.0s) |
| Sound | ❌ None | Ascending chime (2-note, ~300ms) |

#### Phase 4: Collection (1.0s+ after stamp)

| Element | Current | Enhanced |
|---------|---------|----------|
| Done buttons | ✅ Fade in at 1.0s | No change |
| Share button | ✅ ShareLink with text | Enhanced share preview (see §3.5) |
| Collection counter | ❌ None | **NEW**: "X / Y stamps collected" badge below checkmark |
| Stamp Book hint | ✅ "View in Stamp Book" button | Add subtle pulse animation to draw attention |

### 3.3 Particle / Confetti System

A lightweight confetti burst plays during Phase 3 (Celebration).

**Implementation approach**: Use SwiftUI `Canvas` with `TimelineView` for particle rendering. Avoid SpriteKit to keep the view hierarchy pure SwiftUI.

**Particle specification**:

| Property | Value |
|----------|-------|
| Count | 12–20 particles (base), up to 40 at milestones |
| Shape | Small circles (3–5pt) and short rectangles (2×6pt) |
| Colors | stampColor + stampColor.opacity(0.6) + gold accent |
| Origin | Center of stamp area |
| Spread | 360° radial, random velocity 80–200pt/s |
| Gravity | Downward pull after 0.3s, simulating fall |
| Lifetime | 1.0–1.5s with fade-out in last 0.3s |
| Rotation | Random spin per particle |

**Performance constraint**: Particles are rendered in a single `Canvas` overlay. No individual SwiftUI views per particle. Target: zero dropped frames on iPhone 12 and newer.

### 3.4 Dynamic Reward Scaling

Animation intensity scales based on collection milestones. The `rewardTier` is determined by total stamps collected (including the current one).

| Tier | Condition | Particle Count | Glow | Sound | Screen Shake | Extra |
|------|-----------|---------------|------|-------|-------------|-------|
| **Normal** | < 5 stamps | 12 | Standard | 2-note chime | None | — |
| **Nice** | 5, 10, 15, 20 stamps | 24 | Brighter (0.4) | 3-note chime | Micro-shake | "Nice! X stamps" text |
| **Milestone** | 25, 50 stamps | 40 | Pulsing glow | Fanfare (~500ms) | Shake + zoom | Full-screen celebration overlay |
| **Complete** | All stamps collected | 60 | Rainbow cycle | Special jingle | Shake + confetti rain | "Collection Complete!" modal |

**Tier resolution logic**:

```
let totalCollected = collectedStamps.count + 1  // including current
let tier: RewardTier = switch totalCollected {
    case _ where totalCollected == allStamps.count: .complete
    case 25, 50: .milestone
    case let n where n % 5 == 0: .nice
    default: .normal
}
```

**Data dependency**: The prompt needs access to `collectedStamps.count` and `allStamps.count` (total available). These are passed in as parameters or read from the SwiftData context.

### 3.5 Share Card Enhancement

The current `ShareLink` shares plain text. Enhance it with a rendered image card.

**Share card contents**:

- Stamp artwork (`GosyuinStampView`) rendered at 2x on a washi-textured background
- Shrine name and address
- Collection date
- "X / Y collected" progress indicator
- App branding footer: "GosyuinMap" with torii icon

**Implementation**: Render the card as a `UIImage` using `ImageRenderer` (iOS 16+), then share via `ShareLink(item: image, preview:)`.

**Card size**: 1080×1350px (Instagram portrait ratio, 4:5).

### 3.6 Sound Design

All sounds are optional and respect the system mute switch and in-app sound setting.

| Phase | Sound | Duration | File |
|-------|-------|----------|------|
| Anticipation | Paper rustle loop | ~1.0s (loops during press) | `paper_rustle.caf` |
| Impact | Wooden thud ("don") | ~100ms | `stamp_impact.caf` |
| Celebration (Normal) | 2-note ascending chime | ~300ms | `chime_normal.caf` |
| Celebration (Nice) | 3-note ascending chime | ~400ms | `chime_nice.caf` |
| Celebration (Milestone) | Short fanfare | ~500ms | `chime_milestone.caf` |
| Celebration (Complete) | Special jingle | ~800ms | `chime_complete.caf` |

**Implementation**: Use `AVAudioPlayer` with pre-loaded audio buffers. Alternatively, use `AudioServicesPlaySystemSound` for short sounds to avoid latency. Sound files are `.caf` format for minimal decode latency on iOS.

**User setting**: Add a "Sound Effects" toggle in a future Settings screen. Default: ON. Stored in `UserDefaults`.

---

## 4. Business Logic

### 4.1 Reward Tier Calculation

- Tier is calculated at the moment `onCollect()` is called, before the animation begins
- The "current" stamp is counted in the total (i.e., if user had 4 stamps and collects a 5th, tier = `.nice`)
- Milestone numbers (5, 10, 15, 20, 25, 50) are defined as a constant array for easy tuning
- `.complete` tier takes precedence over all other tiers

### 4.2 State Changes

| Trigger | Current State | Next State | Animation Effect |
|---------|--------------|------------|-----------------|
| Long-press begins | `.ready` | `.pressing` | Phase 1 starts |
| Finger released early | `.pressing` | `.ready` | Cancel, reset progress |
| Press duration completed | `.pressing` | `.stamped` | Phases 2→3→4 chain |
| "Done" tapped | `.stamped` | (dismissed) | Sheet dismisses |
| "View in Stamp Book" tapped | `.stamped` | (dismissed + tab switch) | Navigate to Collect tab |

No changes to the existing state machine. The enhanced animations are layered on top.

### 4.3 Animation Timing Summary

```
t=0.0s  Press starts (Phase 1: Anticipation)
t=1.0s  Press completes → executeStamp()
t=1.0s  Phase 2: Impact (stamp appears, ink spreads, squish)
t=1.2s  Phase 2→3 transition (squish releases, spring settle)
t=1.3s  Phase 3: Celebration (particles burst, glow, chime, text)
t=1.5s  Particles peak, begin falling
t=2.0s  Phase 4: Collection (buttons fade in)
t=2.5s  Particles fully faded, glow dissipated
```

Total animation duration: ~2.5s from press completion to full settle. This is slightly longer than the current ~1.5s, but the added elements keep the user engaged throughout.

### 4.4 Open Questions

1. **Sound assets**: Should we commission custom sound effects, use royalty-free audio, or synthesize programmatically with `AVAudioEngine`? Programmatic synthesis avoids asset management but limits quality.

2. **Particle rendering**: `Canvas` + `TimelineView` vs. a minimal `SpriteKit` overlay? Canvas is pure SwiftUI but may have performance limits with 40+ particles on older devices. Need benchmarking.

3. **Share card generation timing**: Should the share card image be pre-rendered during the celebration phase (async), or generated on-demand when user taps Share? Pre-rendering is smoother but uses memory.

4. **Accessibility**: Should the celebration animation be reduced or removed when "Reduce Motion" is enabled? Proposed: keep stamp appearance but skip particles and screen shake.

5. **Collection counter data source**: `StampCollectionPrompt` currently receives only `shrine` and callbacks. It would need additional context (total collected, total available) for reward tier calculation and the "X / Y" counter. Pass as init parameters or inject via `@Environment`?

---

## 5. Edge Cases & Error Handling

| Scenario | Expected Behavior |
|----------|-------------------|
| Reduce Motion enabled | Skip particles, glow pulse, and screen shake. Keep stamp appear + ink spread with reduced spring animation. Celebration text still shows. |
| Device muted (silent switch) | No sound effects play. Haptics still fire. |
| Very fast re-collection (double trigger) | `onCollect()` is gated by `phase == .stamped` check. Cannot fire twice. |
| Low memory / old device (iPhone 12) | Particle count capped at 12 regardless of tier. Glow effect simplified (no pulse). |
| Stamp definition missing (`stampDef == nil`) | Existing behavior: falls back to `.vermillion` color. Particles still fire with fallback color. |
| All stamps already collected before this one | `.complete` tier fires only when this stamp makes the collection complete. If already complete, this case shouldn't occur (proximity alerts exclude collected stamps). |
| Share card rendering fails | Fall back to current text-only `ShareLink`. Log error silently. |
| Sound file missing from bundle | Silently skip sound. No crash. Guard with `guard let url = Bundle.main.url(...)` |
| User backgrounds app during animation | Animation continues on return via SwiftUI state. Particles may appear mid-flight; this is acceptable. |

---

## 6. Acceptance Criteria

### 6.1 Must Work

- User can long-press to collect a stamp with the enhanced 4-phase animation
- Confetti particles burst from the stamp center upon collection
- Particle count and celebration intensity scale with collection milestones (5, 10, 15, 20, 25, 50, complete)
- "X / Y stamps collected" counter displays after stamp collection
- Sound effects play when device is not muted (if sound assets are available)
- Haptic feedback fires at each phase transition
- Share button generates a visual share card with stamp artwork
- Animation runs at 60fps on iPhone 12 and newer
- "View in Stamp Book" navigates to the Collect tab with the newly collected stamp

### 6.2 Must NOT Happen

- Particles must not persist on screen after 2.5s
- Sound effects must not play when system silent switch is on
- Animation must not block user interaction with Done/Share buttons once they appear
- Screen shake must not occur when "Reduce Motion" is enabled
- Particle rendering must not cause frame drops below 30fps on supported devices
- `executeStamp()` must not fire more than once per prompt presentation
- Sound/particle assets must not increase app bundle size by more than 2MB total

---

## 7. Related Links

| Resource | Link |
|----------|------|
| Research Report | `gosyuin_stamp_animation_research.html` |
| Existing Stamp Code | `GosyuinMap/Views/Explore/StampCollectionPrompt.swift` |
| Live Activity Spec | `docs/live-activity-spec.md` |
| Stamp Definitions | `GosyuinMap/Models/StampDefinition.swift` |
| Collect Tab Views | `GosyuinMap/Views/Collect/` |

---

## 8. Notes & Discussion

### Implementation Priority

Recommended implementation order:

1. **Particle system** (`ConfettiCanvasView`) — most visible enhancement, self-contained
2. **Dynamic reward scaling** (`RewardTier` enum + calculation) — adds progression feel
3. **Glow effect** — simple overlay, quick win
4. **Collection counter** — requires data plumbing (collectedStamps count)
5. **Share card** — ImageRenderer-based, independent of animation
6. **Sound design** — depends on asset availability, can ship as a follow-up

### Architecture Notes

- `RewardTier` should be an enum in a new file or added to `StampDefinition.swift`
- `ConfettiCanvasView` should be a reusable SwiftUI component in `Views/Explore/` or a shared `Components/` folder
- Sound manager should be a lightweight singleton (`StampSoundManager`) to pre-load audio buffers at app launch
- Share card rendering should use `@MainActor` and `ImageRenderer` with explicit scale factor (3x for retina)

### Inspiration Sources

- **Duolingo**: Progressive celebration scaling (50/100/365 streaks), confetti + character animation
- **Pokémon GO**: Stamp rally progression, daily stamp → weekly reward pattern
- **Smart Gosyuin**: Digital gosyuin ink texture reference, traditional aesthetic preservation
- **Nintendo Switch achievement stamps**: Physical ink-press metaphor with satisfying "weight"
