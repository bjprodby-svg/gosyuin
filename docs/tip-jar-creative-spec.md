# Tip Jar クリエイティブ要件

3 tier それぞれにイラスト/アイコンが必要。`TipJarCard` (インライン) と `TipJarFullView` (フルページ) の両方で使用。

## 共通仕様

| 項目 | 仕様 |
|---|---|
| フォーマット | PNG, 透過背景 |
| サイズ | 1024×1024 (Xcode が自動リサイズ) |
| 表示サイズ | カード内: 44-56pt 円形クリップ / フルページ: 最大 80pt |
| テイスト | 和風, 御朱印帳の世界観に合う。フラットイラスト or 墨絵風 |
| 色味 | 金茶 (kincha `#996626`) をベースに各 tier で差別化 |

---

## Tier 1: 賽銭 (Saisen) — $0.99

| 項目 | 内容 |
|---|---|
| モチーフ | お賽銭箱に硬貨を入れる瞬間, または五円玉 |
| イメージ | 素朴で控えめ。小さな感謝の気持ち |
| 色トーン | 淡い金茶, 銅色 |
| 避けるもの | リアルな通貨表現, ドル記号 |

## Tier 2: お守り (Omamori) — $2.99

| 項目 | 内容 |
|---|---|
| モチーフ | 和風のお守り袋 (紐付き) |
| イメージ | 中間の tier。守りたい気持ち。温かみ |
| 色トーン | 金茶 + 朱色 (vermillion) のアクセント |
| 避けるもの | 特定の神社名, 宗教的に強いシンボル |

## Tier 3: 御朱印 (Goshuin) — $4.99

| 項目 | 内容 |
|---|---|
| モチーフ | 御朱印帳に朱印が押される瞬間, または開いた御朱印帳 |
| イメージ | 最上位 tier。格調高い。特別感。"POPULAR" バッジ付き |
| 色トーン | 深い金茶 + 朱色, グラデーション感 |
| 避けるもの | 実在する御朱印のコピー |

---

## 使用箇所

### TipJarCard (インライン, 収集後表示)

```
┌─────────────────────────────────┐
│ [44pt 円形]  Saisen      $0.99 │  ← ここに画像
│ [44pt 円形]  Omamori     $2.99 │
│ [44pt 円形]  Goshuin     $4.99 │
└─────────────────────────────────┘
```

### TipJarFullView (Settings > Tip Jar)

```
┌─────────────────────────────────┐
│ [56pt 円形]  Saisen             │
│              説明文              │
│         [ $0.99 ボタン ]        │  ← ここに画像 (大きめ)
└─────────────────────────────────┘
```

現在は SF Symbols の代わりに漢字テキスト (賽銭 / お守り / 御朱印) を円形バッジに入れている。クリエイティブが来たらそこを `Image` に差し替え。

---

## 生成プラン (後日実施)

Wave 2A (avatar evolution) 完了後に着手。フローは確立済み:

1. ChatGPT/DALL-E で 1024×1024 PNG 透過背景生成（個別 3 リクエスト）
2. Recraft でベクタライズ（任意、PNG のままでも可）
3. `Assets.xcassets/TipCards/tip_saisen.imageset/`, `tip_omamori.imageset/`, `tip_goshuin.imageset/` に配置
4. SwiftUI 側で `Image("tip_saisen")` 等に差し替え

---

## 実施結果 (2026-04-27)

**採用: A — ピクセルスプライト**（16-bit JRPG 風 / Stardew Valley 系）

アバターと同じピクセルアートテイストで統一感を確保。Tip Jar も「アプリ内のもう一つの世界観」として
ゲーム的レイヤーで一貫させる方針。

### 検討した別案

- **A: ピクセルスプライト**（採用） — アバターと統一感、親しみやすい
- **B: プレミアム和風 3D 風**（却下） — 3 回連続でトリ/狐/お守りの誤生成、コントロール不能
- **C: リッチフラット和紙 + 金箔**（リザーブ） — 高級感あるが、課金画面だけ世界観が浮く懸念

C 版のソース画像は `~/personal/gosyuin/wave2a-output/` に保存済み（チャット履歴より復元可）。
将来テーマ切替で「上品モード」を出す場合に再利用検討。

### 配置済みアセット

| ファイル | サイズ | 形式 | 内容 |
|---|---|---|---|
| `Assets.xcassets/TipCards/tip_saisen.imageset/card.png` | 724×724 | RGBA | ピクセル五円玉（square hole, 五円文字入り）／背景透過 |
| `Assets.xcassets/TipCards/tip_omamori.imageset/card.png` | 724×724 | RGBA | ピクセル赤お守り（桜紋様、白紐）／背景透過 |
| `Assets.xcassets/TipCards/tip_goshuin.imageset/card.png` | 724×724 | RGBA | ピクセル開いた御朱印帳（朱印付き）／背景透過 |

ソース: `~/personal/gosyuin/wave2a-output/tip_pixel_grid.png` (2172×724, 3 パネル横並び)
※ 元生成は RGB で背景クリーム色 RGB(250,239,222) が焼き込まれていたため、後処理で alpha=0 に変換。バックアップ: `/tmp/tipcard_backup/{tip_saisen,tip_omamori,tip_goshuin}_original.png`

### SwiftUI 使用例

```swift
Image("tip_saisen")
    .resizable()
    .interpolation(.none)  // ピクセル鮮明化（必須）
    .scaledToFit()
    .frame(width: 64, height: 64)
```

`.interpolation(.none)` を必ず付ける。スムージングするとピクセル感が失われる。
アバター（`AvatarView`）と同じ扱い。

### 配信前の TODO

- [x] `TipJarCard` / `TipJarFullView` の SwiftUI 実装で `Image("tip_saisen")` 等に差し替え (2026-04-29)
- [x] 文字バッジ（賽銭/お守り/御朱印）はカード内に SwiftUI Text として残す（画像内には含めない方針）
  - 漢字 Text は削除、`Saisen` / `Omamori` / `Goshuin` の英語ラベルのみ表示する形に変更
- [x] StoreKit 連携
  - `TipStore` 実装済み、`Tips.storekit` Configuration 配置済み、Scheme に紐付け済み
  - Product ID: `com.bjprodby.gosyuinmap.tip.{small,medium,large}` で一致確認

---

## 設計改訂 (2026-04-29 v2)

初版（v1）では金茶 Circle 背景 + ピクセル画像の組み合わせで装飾的なカードを採用したが、
PNG が透過になっていなかったこと、また全体に装飾過多であることから minimal 路線に変更。

### v1 → v2 の主な変更

| 項目 | v1 | v2 |
|---|---|---|
| PNG 背景 | RGB / 焼き込みクリーム背景 | RGBA / 透過 |
| 画像下の SwiftUI Circle | あり (`Color.kincha.opacity(0.1)`) | 削除 |
| TipJarCard ヘッダー | 金茶グラデ + heart icon + 大タイトル | テキスト 2 行のみ |
| TipJarCard 行スタイル | 行ごとに薄カード + カプセル価格ボタン | divider 区切り + 行末テキスト価格 |
| TipJarFullView ヘッダー | 同心円リング + heart icon | タイトル + 小サブタイトルのみ |
| TipJarFullView 行スタイル | 個別カード × 3 + 大ボタン | 1 つのリスト（divider 区切り）+ 行末テキスト価格 |
| Tier 3 (Goshuin) | 金茶グラデ円 + 太枠 + POPULAR 塗り | 同列扱い + POPULAR は朱色 outline |
| 画像サイズ | TipJarCard 36pt / Full 46pt | TipJarCard 40pt / Full 48pt |

### 実装ノート

- 透過 PNG により `.interpolation(.none)` のピクセル感がカード背景にそのまま乗る
- 価格は `Color.kincha` テキストで控えめに強調（Tier 間で差別化しない）
- POPULAR バッジは `Color.vermillion` の細枠 capsule + monospaced 9pt
- タップ領域は `.contentShape(Rectangle())` で行全体に拡張
- アニメーション (`DS.Anim.entrance` の stagger) は維持
