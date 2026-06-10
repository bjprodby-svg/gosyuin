# GosyuinMap Refactoring Plan & Log

A full-codebase refactoring to remove accumulated waste (dead code, redundant
assets, and large hand-written data literals).

> **Build-verification caveat:** This work was performed in a Linux environment
> with **no Swift/Xcode toolchain**, so changes could not be compiled. All
> data migrations were done with deterministic parsers plus validation, and all
> deletions were confirmed to have zero remaining references. A macOS build
> (`Cmd+R`, iPhone 17 Pro simulator) is still required to confirm compilation
> before release.

## Baseline (before)

- 64 Swift files, ~27,800 lines.
- `Models/ShrineData_*.swift`: 8 files, **13,575 lines** of `Shrine(...)` literals.
- `Models/StampDefinition.swift`: 752 lines of `StampDefinition(...)` literals.
- `docs/`: 6.7 MB, much of it heavy throwaway artifacts.

## Findings (waste inventory)

| Category | Item | Size | Disposition |
|---|---|---|---|
| Dead file | `Views/Learn/EtiquetteIllustrations.swift` | 1,541 lines | Deleted (legacy Canvas art, replaced by PNGs; zero refs) |
| Dead file | `Views/Learn/IllustrationStyleSamples.swift` | 852 lines | Deleted (style exploration, not even in pbxproj) |
| Dead file | `Extensions/GlassEffect+Adaptive.swift` | 13 lines | Deleted (`adaptiveGlassBackground` never called) |
| Data-as-code | `Models/ShrineData_*.swift` ×8 | 13,575 lines | Migrated to `Resources/shrines.json` + loader |
| Data-as-code | `Models/StampDefinition.swift` array | 730 lines | Migrated to `Resources/stamps.json` + loader |
| Heavy assets | `docs/stamp-images/` (4 PNGs) | 4.2 MB | Deleted (duplicates of `Assets.xcassets/ArtworkStamps`) |
| Heavy assets | `docs/item-get-animation-research.html` | 1.0 MB | Deleted (research artifact) |
| Heavy assets | `docs/vendor/lottie.min.js` | 300 KB | Deleted (vendored lib for HTML prototypes) |
| Heavy assets | `docs/*prototype/review/mocks.html` | ~120 KB | Deleted (throwaway HTML prototypes) |

> The one-off conversion scripts referenced below live under `scripts/`
> (gitignored local tooling); their method is documented here for reproducibility.

## Phases

### Phase 1 — Dead code & asset cleanup ✅
- Deleted the three dead Swift files and removed their `project.pbxproj`
  entries (`PBXBuildFile`, `PBXFileReference`, group child, Sources phase).
- Pruned heavy throwaway `docs/` artifacts (6.7 MB → 1.1 MB). Kept the
  lightweight design `.md` briefs/specs, `lottie-refs/` (future animation
  reference), and the launch playbook.
- Verified: zero dangling references to any deleted symbol.

### Phase 2 — Shrine data → JSON ✅
- `scripts/convert_shrine_data.py`: deterministic char-level parser of the
  Swift `Shrine(...)` literals → `Resources/shrines.json` (480 shrines).
  Validates count, unique IDs/slots, required fields, categories.
- `Shrine.samples` now loads & decodes `shrines.json` via a private
  `ShrineSeed: Decodable` (concatenation order preserved exactly). The existing
  `shrine_images.json` overlay is unchanged.
- Deleted the 8 `ShrineData_*.swift` files; updated `project.pbxproj`
  (36 source-entry lines removed, `shrines.json` registered as a resource).

### Phase 3 — Stamp data → JSON ✅
- `scripts/convert_stamp_data.py`: parser handling `\u{...}` escapes and
  `Color(red:green:blue:)` → `Resources/stamps.json` (290 stamps).
- `StampDefinition.all` now loads & decodes `stamps.json` via a private
  `StampSeed: Decodable` (order/IDs preserved). File: 752 → 63 lines.
- `stamps.json` registered as a bundle resource.

### Phase 4 — Design-system consistency (scoped) 🔶
Lower-risk consistency cleanups in the view layer (DS tokens vs. raw values).
Because these cannot be compiled here, the pass is kept conservative: only
swaps where the token definition exactly matches the raw value, and never
removes a modifier that affects layout. See commit log for specifics.

## Net result
- Swift: ~27,800 → ~11,700 lines (~16,000 lines of data/dead code removed).
- `docs/`: 6.7 MB → 1.1 MB.
- Shrine & stamp catalogs are now data (`Resources/*.json`), loaded at launch.

## Follow-up (requires macOS build)
1. Compile and run; confirm `shrines.json`/`stamps.json` decode (asserts fire
   in DEBUG if not). Verify Collect/Explore/Detail screens populate.
2. Broader DS-token migration (frame sizes → `DS.IconSize`, remaining raw
   animation literals) is best done with the compiler available.
