# Wave 2A — アプリアイコン差し替え手順

Wave 1 で生成した PNG を Xcode に投入し、Default アイコンを差し替え + Sakura を Alt Icon として追加する手順。

## 前提

`~/Downloads/` に以下のファイルがある状態:
- `wave1_app_icon_default_v2.png` (1254×1254) — 朱色 + 白鳥居 + 白い輪
- `wave1_app_icon_sakura_v2.png` (1254×1254) — 上記 + 薄ピンク桜花びら

無ければ ChatGPT の "iOS app icon request" チャットから再ダウンロード。

---

## Phase 1 — Default アイコン差し替えのみ（最小構成）

### 1.1 ファイルコピー

```sh
cd ~/personal/gosyuin
cp ~/Downloads/wave1_app_icon_default_v2.png \
   GosyuinMap/Assets.xcassets/AppIcon.appiconset/AppIcon.png
```

これで既存の `AppIcon.png` を上書き。

### 1.2 Xcode で確認

```sh
open GosyuinMap.xcodeproj
```

1. Project navigator → `Assets.xcassets` → `AppIcon` を開く
2. プレビューが新しい画像になってるか確認（同じデザインに見えたら "preview cache" の可能性、Xcode 再起動）
3. Cmd+R で Simulator 起動 → ホーム画面に戻る → アイコン確認

合格なら Phase 2 へ進む（任意）。

---

## Phase 2 — Sakura Alt Icon 追加（iOS 18 Alt Icon 機能）

### 2.1 Alt Icon 用フォルダ作成

```sh
mkdir -p ~/personal/gosyuin/GosyuinMap/Assets.xcassets/AppIconSakura.appiconset
cp ~/Downloads/wave1_app_icon_sakura_v2.png \
   ~/personal/gosyuin/GosyuinMap/Assets.xcassets/AppIconSakura.appiconset/AppIconSakura.png
```

### 2.2 Contents.json 作成

`~/personal/gosyuin/GosyuinMap/Assets.xcassets/AppIconSakura.appiconset/Contents.json` を以下の内容で作成:

```json
{
  "images" : [
    {
      "filename" : "AppIconSakura.png",
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

### 2.3 Info.plist に Alt Icon 登録

`Info.plist`（または Xcode の Build Settings → Info タブ）に以下を追加:

```xml
<key>CFBundleIcons</key>
<dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>AppIconSakura</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>AppIconSakura</string>
      </array>
      <key>UIPrerenderedIcon</key>
      <false/>
    </dict>
  </dict>
</dict>
```

### 2.4 Alt Icon 切替コードを Settings あたりに仕込む（任意）

例: 設定画面に切替ボタンを置く場合、以下の API:

```swift
// Default に戻す
UIApplication.shared.setAlternateIconName(nil)

// Sakura に切り替え
UIApplication.shared.setAlternateIconName("AppIconSakura")
```

Phase 2 はここまでやると `iOS 設定 > GosyuinMap > Alt Icon` から手動切替できる + アプリ内からプログラム的にも切替可能。

---

## チェックリスト

### Phase 1（必須）

- [ ] `wave1_app_icon_default_v2.png` を `AppIcon.appiconset/AppIcon.png` に上書きコピー
- [ ] Xcode の Asset Catalog で新しいアイコンが表示される
- [ ] Simulator のホーム画面で新アイコン表示

### Phase 2（任意）

- [ ] `AppIconSakura.appiconset/` フォルダ作成
- [ ] `AppIconSakura.png` 配置
- [ ] `Contents.json` 作成
- [ ] `Info.plist` に `CFBundleIcons` 追加
- [ ] アプリビルド成功
- [ ] iOS 設定から Alt Icon に切替できる

---

## 結果共有時の項目

- [ ] Phase 1 完了？ / どこまで進んだ？
- [ ] Simulator のホーム画面のアイコンスクショ
- [ ] 違和感ある箇所（色が薄い / シャープすぎる / 余白がおかしい etc）
- [ ] Phase 2 まで進めるか、Phase 1 だけで止めるか

合格なら次は **C（Figma で kanji 差し替えフロー確立）** に進みます。
