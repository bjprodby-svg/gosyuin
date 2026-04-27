# Phase 1 — Illustration Style Samples

「鳥居でお辞儀 (Torii Bow)」を 3 スタイルで試作。Phase 2 以降で採用するスタイルを選択する。

## 成果物

### 1. HTML 版（ブラウザで確認）
- `style-comparison.html` — SVGで 3 スタイル並列表示
- ダブルクリックで Safari/Chrome で開ける
- SVGフィルター（`feTurbulence`, `feDisplacementMap`）で水彩にじみを再現

### 2. SwiftUI Canvas 版（実機/シミュレータで確認）
- `/GosyuinMap/Views/Learn/IllustrationStyleSamples.swift`
- 3 種類の View：
  - `FlatToriiBowIllustration`
  - `WatercolorToriiBowIllustration`
  - `LineArtToriiBowIllustration`
- 統合ビュー：`IllustrationStyleSamplesView`

#### Xcode プロジェクトへの組み込み
1. `IllustrationStyleSamples.swift` を Xcode の `GosyuinMap/Views/Learn/` グループにドラッグ
2. "Add to target: GosyuinMap" にチェック
3. プレビュー（Cmd+Option+Return でキャンバス表示）または Learn タブから呼び出し

#### Learn タブから呼び出す例（`LearnListView.swift` の末尾などに追加）
```swift
#if DEBUG
.toolbar {
    ToolbarItem(placement: .topBarTrailing) {
        NavigationLink("Samples") {
            IllustrationStyleSamplesView()
        }
        .font(.caption)
    }
}
#endif
```

## 3 スタイルの特徴

| スタイル | 特徴 | 向いている用途 |
|---------|------|---------------|
| **A. フラット** | 幾何学的、モダン、クリーン | 再現しやすく量産向き。モダンなプロダクト感 |
| **B. 和風水彩** | にじみ・ぼかし、和紙質感、温かみ | 御朱印帳テーマと親和性◎。情緒的な読み物体験 |
| **C. 線画+朱色** | 細い黒線 + 朱色の差し色、上品 | ガイドブック風、洗練された印象、ミニマル |

## Phase 2 への進み方

ユーザーが 1 スタイル選択 → 次の 3 枚（人物アクション / 静物道具 / 全体俯瞰）を同じスタイルで制作。
