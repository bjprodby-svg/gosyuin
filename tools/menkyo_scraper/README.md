# menkyoblog.com 仮免問題スクレイパー

menkyoblog.com の「仮免練習問題1〜10」（全10セット・500問）の問題文と
**正解（〇/✕）** を取得し、`menkyo_questions.json` として出力するツールです。
既存の `driving_test_review_quiz_v4.html` 追加用の JS スニペットも生成できます。

## ⚠️ 実行環境について

このスクリプトは **menkyoblog.com に接続できる環境（手元のPCなど）** で
実行してください。

> Claude Code の web 実行環境（このリポジトリを clone したサンドボックス）は
> **GitHub 以外への外向き通信が遮断**されています。`menkyoblog.com` への
> アクセスはすべて 403 になるため、サンドボックス内ではスクレイプを完了
> できません。そのため「実行可能なスクリプト」を成果物として用意しました。
> ふりがな除去・パース・JSON/JS 生成のロジックはオフラインのモックで検証済みです。

## セットアップ

```sh
cd tools/menkyo_scraper
pip install -r requirements.txt
```

## 使い方

```sh
# 全10セットを取得して menkyo_questions.json を出力
python scrape_menkyo.py

# JS スニペット (quiz_snippet.js) も同時出力
python scrape_menkyo.py --js

# 一部セットだけ
python scrape_menkyo.py --sets 1 2 3

# まず構造確認（実HTMLを保存してセレクタ調整に使う）
python scrape_menkyo.py --debug-dump 1
#   -> debug_set1.html / debug_set1.json が出る

# A/B が効かないときはブラウザ自動化に切替
pip install playwright && playwright install chromium
python scrape_menkyo.py --playwright
```

## 正解の取り方（3戦略・自動フォールバック）

このサイトは WordPress + **Watu Quiz Plugin**。正答は HTML に書かれず
AJAX/フォーム送信で採点されるため、上から順に試します。

1. **Strategy A — 埋め込みデータ**: `<script>` 内に正解 ID があれば抽出。
2. **Strategy B — フォーム採点の逆算**: 「全問○(正しい)」を送信し、結果ページの
   per-question 正誤から各問の正答を逆算（○が正解→`true`、不正解→`false`）。
3. **Strategy C — Playwright**: ブラウザで選択肢をクリックし結果ページから判定。

## ふりがな除去

問題文の読み仮名（例 `優先ゆうせん道路どうろ` → `優先道路`）を除去します。

- HTML が `<ruby>漢字<rt>かな</rt></ruby>` 形式なら **`<rt>` を捨てるだけ**で正確に除去。
- そうでなければ **既知読み辞書**（`KNOWN_READINGS`）で除去。辞書に無い語は
  `scrape_menkyo.py` の辞書に追記してください。保険として末尾助詞を温存する
  ヒューリスティック（`remove_furigana_heuristic`）も同梱（既定は無効）。

タスク記載の代表例は `test_furigana.py` で完全一致を検証済み：

```sh
python test_furigana.py
```

## 出力フォーマット

`menkyo_questions.json`:

```json
[
  {"set": 1, "n": 1, "q": "優先道路を通行している...", "answer": true,  "image_url": null},
  {"set": 1, "n": 9, "q": "この標識は...",            "answer": false, "image_url": "https://menkyoblog.com/wp-content/uploads/2020/02/shasensuu.gif"}
]
```

`quiz_snippet.js`（`--js` 指定時）:

```js
const menkyoKariQuestions = [
  {set:1, n:1, topic:'...', q:'...', answer:true, explanation:''},
];
```

## 注意・チューニング

- 各リクエスト間に 1.5 秒スリープ（`REQUEST_DELAY`）。サーバ負荷に配慮。
- Watu のクラス名 / フィールド名はテーマ・バージョンで変わります。うまく
  パースできない場合は `--debug-dump N` で実HTMLを確認し、`parse_quiz_page`
  の正規表現セレクタや Strategy B のボタン名・正誤判定を調整してください。
- 正解の自動判定は 100% 保証ではありません。出力後に数問を目視確認することを
  推奨します（`未確定` 件数は実行ログに表示されます）。
- robots.txt / 利用規約を事前に確認のうえ、私的学習の範囲でご利用ください。
```
