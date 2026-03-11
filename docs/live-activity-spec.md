# Live Activity / Dynamic Island 仕様

## 体験設計

### コンセプト
「アプリを閉じていても、街歩きの中で神社との出会いを逃さない」

Dynamic Island は**アプリ外にいる時間**にこそ価値を発揮する。
主な役割は 3 つ:

1. **気づき** — 散策中、近くの神社の存在を教える
2. **案内** — ナビ中、残り距離をコンパクトに伝える
3. **達成** — スタンプ取得の余韻を見届ける

---

## モード定義

Live Activity には 2 つのモードがある。

### 1. Proximity モード（散策型）

ユーザーが意図せず神社の近くを通りかかった時に発動。

| 項目 | 仕様 |
|------|------|
| **開始条件** | 未取得の神社の 100m 圏内に入った時 |
| **開始タイミング** | `LocationService.nearbyShrine` が non-nil に変化した瞬間 |
| **表示内容（compact）** | Leading: ⛩ / Trailing: `XXm` |
| **表示内容（expanded）** | 神社名 + 距離 + "You're near this shrine" |
| **距離更新** | 位置更新のたびに最寄り神社との距離を再計算して更新 |
| **終了条件（自然消滅）** | 100m 圏外に出て 30 秒経過 → フェードアウト終了 |
| **終了条件（取得）** | スタンプ取得 → "Collected!" 表示 → 5 秒後に終了 |
| **終了条件（ユーザー操作）** | "Not Now" タップ → 即時終了 |
| **再表示抑制** | 同一神社は "Not Now" 後、そのアプリセッション中は再起動しない |

### 2. Navigation モード（目的型）

ユーザーがアプリ内でナビを開始した時に発動。

| 項目 | 仕様 |
|------|------|
| **開始条件** | `ExploreView` でナビゲーション開始時 |
| **表示内容（compact）** | Leading: 🚶 / Trailing: `XXm` |
| **表示内容（expanded）** | 神社名 + 距離 + 残り時間 + プログレスバー |
| **距離更新** | 位置更新のたびに distance + estimatedMinutes を更新 |
| **到着判定** | 100m 圏内に入ったら "You've arrived!" に切り替え |
| **終了条件（到着後取得）** | スタンプ取得 → "Collected!" → 5 秒後終了 |
| **終了条件（ユーザー操作）** | ナビ終了ボタン → 即時終了 |
| **モード切り替え** | Proximity → Navigation への昇格あり（ナビ開始時に置き換え） |

---

## 状態遷移図

```
[アプリ起動中 / 散策中]
        │
        │ nearbyShrine != nil
        ▼
  ┌─────────────┐
  │  Proximity   │──── 100m 圏外 + 30s ────→ [終了]
  │   モード     │──── "Not Now" ──────────→ [終了 + 抑制]
  │             │──── スタンプ取得 ─────────→ [Collected! → 5s → 終了]
  │             │──── ナビ開始 ─────────────┐
  └─────────────┘                          │
                                           ▼
                                   ┌──────────────┐
                                   │  Navigation   │
                                   │   モード      │──── 到着(< 100m) ──→ [Arrived!]
                                   │              │──── ナビ終了 ────────→ [終了]
                                   │              │──── スタンプ取得 ────→ [Collected! → 5s → 終了]
                                   └──────────────┘
```

---

## 接続ポイント（実装箇所）

### ExploreView に追加するもの

```
@State private var activityManager = ProximityActivityManager()
@State private var dismissedShrineIds: Set<UUID> = []  // セッション中の抑制リスト
```

### イベント → アクション対応表

| イベント | 発火元 | アクション |
|---------|-------|-----------|
| `nearbyShrine` が変化 (non-nil) | `.onChange(of: locationService.nearbyShrine)` | `activityManager.startActivity()` |
| 位置更新 | `.onChange(of: locationService.currentLocation)` | `activityManager.updateDistance()` |
| "Collect Stamp" タップ | `StampCollectionPrompt.onCollect` | `activityManager.markCollected()` |
| "Not Now" タップ | `StampCollectionPrompt.onDismiss` | `activityManager.endActivity()` + `dismissedShrineIds.insert()` |
| `nearbyShrine` が nil に変化 | `.onChange(of: locationService.nearbyShrine)` | 30s タイマー開始 → `activityManager.endActivity()` |
| ナビ開始 | `beginNavigation()` | 既存 Activity あれば終了 → Navigation モードで新規開始 |
| ナビ中の位置更新 | `.onChange(of: locationService.currentLocation)` | distance + estimatedMinutes を更新 |
| ナビ終了 | `endNavigation()` | `activityManager.endActivity()` |

### 再表示抑制ロジック

```swift
// nearbyShrine 変化時のガード
guard !dismissedShrineIds.contains(shrine.id) else { return }
```

`dismissedShrineIds` はアプリがバックグラウンドから完全に終了されるとリセットされる（@State のため）。
つまり次回起動時には同じ神社でも再び通知される。これは意図的な設計：
- 「今日はいいや」→ 抑制
- 「別の日にまた来た」→ 再通知

---

## 表示デザイン（既存 Widget で実装済み）

### Compact（ノッチ横の小さい表示）

**Proximity:**
```
 ⛩  │  85m
```

**Navigation:**
```
 🚶  │  350m
```

### Expanded（長押しで広がる表示）

**Proximity:**
```
┌─────────────────────────────┐
│ ⛩  Meiji Jingu        85m  │
│    You're near this shrine  │
└─────────────────────────────┘
```

**Navigation:**
```
┌─────────────────────────────┐
│ 🚶  Meiji Jingu       350m │
│                       7 min │
│ ━━━━━━━━━━━━━━━░░░░░░░░░░  │
└─────────────────────────────┘
```

**Collected:**
```
┌─────────────────────────────┐
│ ✓  Meiji Jingu    Collected!│
│    Stamp added to your      │
│    collection               │
└─────────────────────────────┘
```

---

## 既存コードの状態

| ファイル | 状態 |
|---------|------|
| `GosyuinActivityAttributes.swift` | 実装済み。変更不要 |
| `ProximityActivityManager` (`WorshipSessionManager.swift`) | 実装済み。30s 遅延終了の追加が必要 |
| `GosyuinMapWidgetLiveActivity.swift` | 実装済み。変更不要 |
| `ExploreView.swift` | **未接続。ここが主な作業箇所** |
| `LocationService.swift` | 距離情報の公開が必要（現在は nearest shrine のみで距離値なし） |

---

## 実装時の変更サマリ

1. **`LocationService`**: `nearbyShrine` に加えて `nearbyDistance: CLLocationDistance?` を公開
2. **`ProximityActivityManager`**: `endActivityWithDelay(seconds: 30)` を追加（圏外離脱時用）
3. **`ExploreView`**: activityManager インスタンス追加 + 上記イベント表のハンドリングを `.onChange` に追加
4. **`ExploreView`**: `dismissedShrineIds` で "Not Now" の再表示抑制
