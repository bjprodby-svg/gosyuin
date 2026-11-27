GosyuinMap の公開用ページ一式（静的サイト）
作成：マーケティング担当、2026-11-24

このフォルダの中身をそのまま、無料の静的ホスティング（GitHub Pages、Cloudflare Pages、Netlify など）に上げれば動く。
外部のスクリプトやフォントは使っていない。ビルドは不要。この README.txt は上げなくてよい。

  index.html      紹介ページ（App Store Connect の「マーケティング URL」）
  privacy.html    プライバシーポリシー、英語と日本語（「プライバシーポリシー URL」、必須）
  support.html    サポートと FAQ（「サポート URL」、必須）
  styles.css      3 ページ共通のスタイル（明るい表示と暗い表示は端末の設定に従う）
  images/         アプリのアイコン、寺社の種類の絵 8 枚、共有用の画像（og.png）、スクリーンショット 6 枚（いまは仮の画像）

■ 上げる前に埋めるもの（3 つ）

1. 連絡先メール（オーナーが決める）
   REPLACE-ME@example.com を、決めたアドレスに置き換える。
   場所：support.html の連絡先 2 か所（冒頭と末尾）、privacy.html の「Contact」と「お問い合わせ」の 2 か所。
   まとめて置き換えるコマンド（このフォルダで実行。you@example.org を実際のアドレスに）：
     sed -i '' 's/REPLACE-ME@example.com/you@example.org/g' support.html privacy.html
   確認：grep -c "REPLACE-ME" *.html がすべて 0 になること。

2. App Store のリンク（App Store Connect でアプリを登録した後）
   アプリが共有するリンクはすべてこの紹介ページ（https://bjprodby-svg.github.io/gosyuin/?ct=...）。ページの App Store ボタン
   （ヒーロー、末尾、スマホの画面下の帯の 3 つ）が、開かれたときの ct をそのまま App Store のキャンペーンに渡す。
   埋めるのは index.html の 2 か所だけ：
     a. 末尾の <script> の APP_ID に App Store の Apple ID（数字だけ）、PROVIDER_TOKEN に App Store Connect の
        キャンペーンリンクの pt の値。入れるとボタンの文言が「Download on the App Store」に変わり、押すと App Store が開く。
     b. <head> の Smart App Banner の行のコメントを外し、APP_ID を同じ数字に。
   アプリ側は GosyuinMap/Models/AppLinks.swift の appStoreID と providerToken に同じ値を入れる。
   ID がない間、ボタンは「Coming soon to the App Store」で押しても何も出ない。仕組みは docs/specs/share-link.md。

3. スクリーンショット（iOS エンジニアが撮影した後）
   images/screenshots/ の 6 枚は「Screenshot placeholder」と書いた仮の画像。
   同じファイル名で、見出しを載せる前の素の画面（1320 x 2868）に上書きする。HTML は触らなくてよい。
     01-press-stamp.png  02-map.png  03-customs.png  04-lock-screen.png  05-shrine-guide.png  06-stamp-book.png
   撮り方は docs/marketing/screenshot-shotlist.md。

■ 置き場所が決まった後に 1 行だけ直すもの（任意）

   index.html の <meta property="og:image" content="images/og.png"> を、https:// から始まる完全なアドレスにする。
   直さなくてもページは動く。X や Threads に貼ったときの画像が出ないだけ。

■ 知っておくこと

- privacy.html の本文は appstore/PRIVACY_POLICY.html（最終更新 2026-11-24）と同じ。変えたのは連絡先メールを仮の値にしたことと、
  末尾の「掲載手順」の囲みを外したことだけ。ポリシーを改めるときは、元のファイルとこのページの両方を直す。
- 「App Store からダウンロード」のボタンは Apple の黒いバッジに似せて CSS と SVG で描いたもの（公式の画像はダウンロードが
  必要なので入れていない）。公開後は https://tools.applemediaservices.com/ から公式バッジを取得して差し替えるのが望ましい。
- ページの文面は appstore/APP_STORE_METADATA.md の掲載文と同じ事実（269 か所、約 100 m、iOS 26 以降、英語、登録と広告なし）に
  揃えてある。どれかが変わったら両方を直す。
