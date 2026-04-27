# Wave 1 Figma Review — Checklist

Wave 1 で生成された 4 枚を Figma に並べてレビューする手順 + 評価シート。

---

## 1. ChatGPT からダウンロード

ブラウザで開いている **Gosyuin プロジェクト → "iOS app icon request"** チャット内の以下 3 枚 + 別チャット 1 枚をダウンロード。

各画像の右下にある **↓ ダウンロードアイコン** をクリック → デフォルトで `~/Downloads/` に保存される。

| # | 画像内容（識別ポイント） | 推奨保存ファイル名 |
|---|---|---|
| 1 | 朱色 + 白鳥居 + 白い輪のみ（3 番目の生成、シンプル） | `wave1_app_icon_default_v2.png` |
| 2 | 朱色 + 白鳥居 + 薄ピンクの花びら数枚（v2、最後の sakura 生成） | `wave1_app_icon_sakura.png` |
| 3 | 朱色 + 白鳥居 + 大きめの白い桜の花（古い v1、参考比較用） | `wave1_app_icon_sakura_v1_REJECT.png` |
| 4 | 黒線の明神鳥居 + 中央に丸（前のチャット内、myojin 単体） | `wave1_icon_myojin.png` |
| 5 | App Store スクショ風モックアップ（縦長、日本語タグライン + デバイスフレーム） | `wave1_store_hero_b2.png` |

**スキップ**: 装飾過多な最初の app icon（鳥居 + 桜 + 富士山 + 水景）、マップピン、歩行者シルエット。すべて NG なので拾わなくて OK。

---

## 2. Figma に配置

新規ファイル `gosyuin-wave1-review.fig` を作成し、以下のレイアウトで配置:

```
┌──────────────────────────────────────────────────────────┐
│  GosyuinMap — Wave 1 Asset Review                        │
│  2026-04-25                                              │
├──────────┬──────────┬──────────┬──────────┬─────────────┤
│ #1 Icon  │ #2 Icon  │ #3 Myojin│ #4 Hero  │ Reference:  │
│ default  │ sakura   │ category │ (B2 dir) │ existing    │
│ v2       │ v2       │ icon     │          │ AppIcon.png │
│          │          │          │          │ + 8 cat ic. │
│ [drop]   │ [drop]   │ [drop]   │ [drop]   │ [drag from  │
│          │          │          │          │  Xcode]     │
└──────────┴──────────┴──────────┴──────────┴─────────────┘
```

各カードに 200×200 のミニサムネ + 64×64 のスーパーミニも置く（ホーム画面サイズ確認用）。

---

## 3. 評価シート

| 評価軸 | #1 Icon | #2 Sakura | #3 Myojin | #4 Hero |
|---|---|---|---|---|
| Tone match | _/5 | _/5 | _/5 | _/5 |
| Technical quality | _/5 | _/5 | _/5 | _/5 |
| Reproducibility | _/5 | _/5 | _/5 | _/5 |
| Drop-in readiness | _/5 | _/5 | _/5 | _/5 |
| **Total avg** | _/5 | _/5 | _/5 | _/5 |

**判定基準**: 全軸 4 以上で合格。1 軸でも 3 以下は要改善。

---

## 4. 決めること

レビュー完了後、以下を判断:

- [ ] **#1**: そのまま `Assets.xcassets/AppIcon.appiconset/` に投入する？ それとも washi grain を強める v3 をリトライする？
- [ ] **#2**: 花びら微調整なしでこのまま採用する？
- [ ] **#3**: Figma で輪を削除してトレース → SVG 化、で OK？
- [ ] **#4**: B1 ミニマル水彩 vs B2 デバイスモックアップ、どっちで進める？
  - B2 採用なら → Wave 2 で残り 4 枚のスクショも同方向で生成
  - B1 採用なら → リトライプロンプト強化（"no mockup, English only" 明示）

---

## 5. Wave 2 の方向

レビュー結果次第で Wave 2 のスコープが決まる:

- **バッジ形状の探索**: 朱印 / 絵馬 / 円形メダリオン 3 候補で同じ称号を 3 枚生成 → 形状決定
- **Style B 水彩の再挑戦**（B1 採用時のみ）
- **残りカテゴリアイコン 5 種**（gongen / sengen / konpira / ebisu / benzaiten）

---

## 6. 学び（次の生成までに把握しておく）

- DALL-E + 「Japanese shrine」コンテキスト = 装飾を勝手に盛りに行く → 強い negatives 必須
- 季節バリアント = 色を変えに行くので "keep base color" 明示
- 御朱印スタンプ = DALL-E では作れない、Gemini ワークフローを継続
- 1 チャット = 1 アセットファミリー（context bleed 回避）
- 英語コピー = "English only, no Japanese" 明示

詳細は `creative-brief.md` の "Wave 1 Results & Learnings" セクション参照。
