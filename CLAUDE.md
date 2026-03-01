# GosyuinMap

御朱印（神社仏閣の参拝記念印）を記録・管理するiOSアプリ。

## プロジェクト概要

- **Bundle ID**: `com.bjprodby.gosyuinmap`
- **Deployment Target**: iOS 18.0
- **フレームワーク**: SwiftUI + SwiftData + MapKit + ActivityKit
- **Swift Version**: 6.0
- **Xcode**: 16.0+（Liquid Glass 機能には Xcode 26 + iOS 26 SDK が必要）

## ディレクトリ構成

```
GosyuinMap.xcodeproj/        # Xcode プロジェクト
GosyuinMap/
├── GosyuinMapApp.swift      # @main エントリポイント
├── ContentView.swift        # TabView（4タブ）
├── Views/
│   ├── Explore/             # 地図タブ（MapKit + MKLocalSearch）
│   │   ├── ExploreView.swift
│   │   ├── ShrineDetailView.swift
│   │   └── SearchSheetView.swift    # 神社検索シート
│   ├── Collect/             # スタンプ帳 + 御朱印記録タブ
│   │   ├── CollectView.swift
│   │   ├── StampDetailView.swift
│   │   ├── GosyuinListView.swift          # 御朱印記録一覧
│   │   ├── GosyuinFormView.swift          # 御朱印追加/編集フォーム
│   │   └── GosyuinRecordDetailView.swift  # 御朱印記録詳細
│   └── Learn/               # 参拝マナータブ
├── Models/
│   ├── Gosyuin.swift                    # SwiftData モデル（御朱印記録）
│   ├── CollectedStamp.swift             # SwiftData モデル（スタンプ収集）
│   ├── Shrine.swift                     # 神社データ（サンプル）
│   ├── StampDefinition.swift            # スタンプ定義
│   ├── GuideArticle.swift               # ガイド記事定義
│   └── GosyuinActivityAttributes.swift  # Live Activities 属性
├── Services/
│   ├── LocationService.swift            # 位置情報サービス
│   ├── WorshipSessionManager.swift      # 参拝セッション管理
│   └── ShrineSearchService.swift        # MKLocalSearch 神社検索
├── Extensions/
│   ├── GlassEffect+Adaptive.swift       # Liquid Glass ヘルパー
│   └── Color+Theme.swift                # テーマカラー定義
├── Assets.xcassets/
├── Preview Content/
└── Info.plist
```

## アーキテクチャ

### 4タブ構成

| タブ | View | 機能 |
|------|------|------|
| Explore | `ExploreView` | MapKit で周辺の神社仏閣を表示 + MKLocalSearch で動的検索 |
| Collect | `CollectView` | スタンプ帳グリッドでコレクション管理 |
| Records | `GosyuinListView` | SwiftData で御朱印記録の CRUD |
| Learn | `LearnListView` | 参拝作法・御朱印マナーの解説 |

### データモデル（SwiftData）

`Gosyuin`: 御朱印の記録
- `name`, `templeName`, `date`, `latitude`, `longitude`, `memo`, `imageData`

`CollectedStamp`: スタンプ収集状況
- `slotId`, `collectedDate`

### iOS 26 対応

- Liquid Glass は `#available(iOS 26, *)` で条件適用
- iOS 18〜25 では `.ultraThinMaterial` にフォールバック
- ヘルパー: `View.adaptiveGlassBackground(cornerRadius:)`

### Live Activities

- `GosyuinActivityAttributes` モデル定義済み
- Widget Extension（`GosyuinMapWidget/`）で Dynamic Island + ロック画面 UI 実装済み

## 開発ルール

- SwiftUI のプレビューは `#Preview` マクロを使用
- SwiftData のプレビューには `.modelContainer(for:inMemory:)` を付与
- iOS 18 の `Tab` イニシャライザを使用（`.tabItem` は非推奨）
- ファイル追加時は `.xcodeproj/project.pbxproj` の Sources/Resources ビルドフェーズにも追加
- 日本語の UI 文字列はコード内に直接記述（現時点ではローカライズ未対応）
- `seedSampleDataIfNeeded` は `#if DEBUG` で囲まれたデバッグ専用

## ビルド・実行

```sh
open GosyuinMap.xcodeproj
# Xcode で Cmd+R で実行
```

位置情報を使用するため、シミュレータではカスタムロケーション設定を推奨。
