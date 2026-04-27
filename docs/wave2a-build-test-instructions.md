# Wave 2A — 実機 / Simulator ビルド確認手順

Wave 2A で投入した SVG バッジ + `BadgeView` component が Xcode で正しく表示されるかを確認する手順。

## 0. 事前確認（追加されたファイル）

```
GosyuinMap/Assets.xcassets/Badges/
├── Contents.json
└── badge_milestone_jussan.imageset/
    ├── Contents.json
    └── badge.svg                          ← Recraft 出力 SVG

GosyuinMap/Views/Collect/
└── BadgeView.swift                        ← 新規 SwiftUI component
```

`GosyuinMap.xcodeproj/project.pbxproj` も 4 箇所更新（PBXBuildFile / PBXFileReference / Views/Collect group / Sources build phase）。

---

## 1. Xcode 起動

```sh
cd ~/personal/gosyuin
open GosyuinMap.xcodeproj
```

Xcode が project を読み込んだら、Project navigator で `GosyuinMap › Views › Collect` を開いて `BadgeView.swift` がリストにあるか確認。

---

## 2. ビルドが通るか確認

**Scheme**: GosyuinMap
**Destination**: iPhone 17 Pro Simulator
**Configuration**: Debug

```
⌘B
```

エラーが出たら以下の順で原因切り分け:

| エラー文 | 原因 | 対処 |
|---|---|---|
| `Cannot find 'BadgeView' in scope` | pbxproj への登録が未反映 | Xcode を一度閉じて再起動、Clean Build (⇧⌘K) |
| `No such image named 'badge_milestone_jussan'` | imageset の Contents.json か SVG パスが不正 | `Assets.xcassets/Badges/badge_milestone_jussan.imageset/` の中身確認 |
| `'BadgeView' is ambiguous for type lookup` | 同名定義の衝突 | プロジェクト全体検索で BadgeView の定義箇所が 1 箇所だけか確認 |
| その他 | — | エラーメッセージをコピーして共有 |

ビルド成功したら次へ。

---

## 3. SwiftUI Preview で BadgeView 単体確認

1. Project navigator で `Views/Collect/BadgeView.swift` を開く
2. 右上の **Editor Options** → **Canvas** ON（または `⌥⌘↵`）
3. Canvas が起動するのを待つ（初回は 30 秒前後かかる）
4. 3 つの Preview が縦に並ぶはず:
   - **Badge sizes (unlocked)** — 80 / 48 / 32 / 20pt の横並び
   - **Badge — locked vs unlocked** — locked はグレースケール+25% opacity
   - **Badge in achievement row** — 実画面風の row レイアウト

各 Preview で:
- ✅ 緑リング + 山 + 旗 + "10" + "DAY STREAK" が見える → 成功
- ✅ サイズが 4 段階で正しく縮小してる
- ✅ locked 状態がグレースケールに見える
- ❌ "?" マークやプレースホルダー → asset が読まれてない（Step 2 のエラー対処へ）

---

## 4. Simulator 実機で確認

```
⌘R
```

iPhone 17 Pro Simulator が起動 → app が表示される。

**Stamp Book タブ** に移動。現状の Achievement summary は SF Symbols ベースで動いているので、BadgeView 統合前は **見た目は変わらない** はず（バッジ画像はまだ CollectView から呼ばれてない）。

**実機で BadgeView を確認したい場合の暫定 hack** (任意):
`CollectView.swift` の `levelCard` の中、レベル漢字の表示の隣に以下を一時的に追加:

```swift
BadgeView(assetName: "badge_milestone_jussan", size: 64)
```

これで Stamp Book タブ上部に SVG バッジが表示される。確認後、追加した行は git で revert で OK。

---

## 5. 結果共有時の項目

- [ ] ビルド成功 / 失敗（失敗ならエラー文）
- [ ] Preview 3 つの表示結果（スクショ歓迎）
- [ ] Simulator 起動成功 / 失敗
- [ ] BadgeView 単体表示の品質判定（合格 / 微調整 / 不合格）
- [ ] SVG レンダリング所感 — エッジ綺麗？ 文字読める？ 色味 OK？

これで合格なら **C（Figma で kanji 差し替えフロー）** に進みます。
不合格項目があれば修正してリトライ。
