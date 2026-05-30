#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
menkyoblog.com 仮免練習問題スクレイパー (セット1〜10 / 全500問)

このサイトは WordPress + Watu Quiz Plugin で作られており、
「どちらが正答か」は HTML には書かれていない（AJAX/フォーム送信で採点される）。

本スクリプトは以下の戦略を上から順に試し、最初に成功した方法で正解を確定する:

  Strategy A : ページ内 <script> / data 属性に埋め込まれた正解データを抽出
  Strategy B : Watu の採点フォームに「全問 ○ (正しい)」を送信し、
               結果ページの正誤判定から各問の正答を逆算する (requests のみ)
  Strategy C : Playwright でブラウザを自動操作し、各問の選択肢をクリックして
               結果ページの差分から判定する (A/B が効かない場合のフォールバック)

問題文のふりがなは
  1) <ruby><rt> があれば rt を捨てる (最も正確)
  2) なければヒューリスティック + 既知読み辞書で除去
で除去する。

出力: menkyo_questions.json  (+ --js で quiz_snippet.js)

使い方:
    pip install -r requirements.txt
    python scrape_menkyo.py                 # 全10セット
    python scrape_menkyo.py --sets 1 2 3     # 一部のセットだけ
    python scrape_menkyo.py --debug-dump 1   # セット1の解析結果を dump して構造を確認
    python scrape_menkyo.py --js             # quiz_snippet.js も出力
    python scrape_menkyo.py --playwright     # 最初から Strategy C を使う

※ このスクリプトはネットワークに出られる環境（手元のPC）で実行してください。
   Claude Code の web 実行環境は GitHub 以外への接続が遮断されているため
   ここでは実行できません。
"""

from __future__ import annotations

import argparse
import json
import re
import sys
import time
from dataclasses import dataclass, asdict, field
from pathlib import Path
from typing import Optional
from urllib.parse import urljoin

try:
    import requests
    from bs4 import BeautifulSoup
except ImportError:  # pragma: no cover
    sys.exit("依存パッケージが未インストールです: pip install -r requirements.txt")


BASE = "http://menkyoblog.com"
ADMIN_AJAX = f"{BASE}/wp-admin/admin-ajax.php"

# セット番号 -> URL (パーセントエンコード済みスラッグ)
SET_URLS = {
    1:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%91/",
    2:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%92/",
    3:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%93/",
    4:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%94/",
    5:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%95/",
    6:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%96/",
    7:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%97/",
    8:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%98/",
    9:  f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%99/",
    10: f"{BASE}/%e4%bb%ae%e5%85%8d%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%ef%bc%91%ef%bc%90/",
}

HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 "
        "(KHTML, like Gecko) Chrome/124.0 Safari/537.36"
    ),
    "Accept-Language": "ja,en;q=0.8",
}

REQUEST_DELAY = 1.5  # サーバ負荷軽減のためのスリープ秒


# --------------------------------------------------------------------------- #
# データ構造
# --------------------------------------------------------------------------- #
@dataclass
class Question:
    set: int
    n: int
    q: str
    answer: Optional[bool] = None          # True=○(正しい) / False=✕(誤り)
    image_url: Optional[str] = None
    # 解析用メタ（出力時には落とす）
    qid: Optional[str] = field(default=None, repr=False)
    true_answer_id: Optional[str] = field(default=None, repr=False)
    false_answer_id: Optional[str] = field(default=None, repr=False)

    def to_output(self) -> dict:
        return {
            "set": self.set,
            "n": self.n,
            "q": self.q,
            "answer": self.answer,
            "image_url": self.image_url,
        }


# --------------------------------------------------------------------------- #
# ふりがな除去
# --------------------------------------------------------------------------- #

# 仮免問題で頻出する「漢字 -> 読み仮名」。ruby が無い場合のフォールバックで使用。
# 必要に応じて追記してください（長い語から順に当てると安全）。
KNOWN_READINGS: dict[str, str] = {
    "原動機付自転車": "げんどうきつきじてんしゃ",
    "普通自動車": "ふつうじどうしゃ",
    "大型自動車": "おおがたじどうしゃ",
    "自動二輪車": "じどうにりんしゃ",
    "横断歩道": "おうだんほどう",
    "自転車横断帯": "じてんしゃおうだんたい",
    "交差点": "こうさてん",
    "信号機": "しんごうき",
    "歩行者": "ほこうしゃ",
    "優先道路": "ゆうせんどうろ",
    "中央線": "ちゅうおうせん",
    "車両通行帯": "しゃりょうつうこうたい",
    "安全地帯": "あんぜんちたい",
    "踏切": "ふみきり",
    "徐行": "じょこう",
    "追越": "おいこ",
    "追い越し": "おいこし",
    "原動機": "げんどうき",
    "自転車": "じてんしゃ",
    "自動車": "じどうしゃ",
    "二輪車": "にりんしゃ",
    "標識": "ひょうしき",
    "標示": "ひょうじ",
    "車線": "しゃせん",
    "減少": "げんしょう",
    "通行": "つうこう",
    "道路": "どうろ",
    "場所": "ばしょ",
    "以内": "いない",
    "以外": "いがい",
    "手前": "てまえ",
    "横断": "おうだん",
    "運転": "うんてん",
    "停止": "ていし",
    "駐車": "ちゅうしゃ",
    "車": "くるま",
    "優先": "ゆうせん",
    "帯": "たい",
    "付": "つき",
    "数": "すう",
    "先": "さき",
    "次": "つぎ",
    "速度": "そくど",
    "制限": "せいげん",
    "前方": "ぜんぽう",
    "後方": "こうほう",
    "右折": "うせつ",
    "左折": "させつ",
    "進入": "しんにゅう",
    "進行": "しんこう",
    "方向": "ほうこう",
    "合図": "あいず",
    "警音器": "けいおんき",
    "歩道": "ほどう",
    "車道": "しゃどう",
    "路面": "ろめん",
    "区間": "くかん",
    "区域": "くいき",
    "黄色": "きいろ",
    "青色": "あおいろ",
    "矢印": "やじるし",
}

_KANJI = r"一-鿿々"
_HIRA = r"ぁ-ゖゝ-ゞ"


def remove_furigana_known(text: str) -> str:
    """既知の「漢字+読み」連結を辞書で除去（長い語優先）。"""
    for kanji in sorted(KNOWN_READINGS, key=len, reverse=True):
        text = text.replace(kanji + KNOWN_READINGS[kanji], kanji)
    return text


def remove_furigana_heuristic(text: str) -> str:
    """
    辞書に無い箇所向けの保険的ヒューリスティック。

    このサイトのふりがなは「漢字直後に読み仮名がぴったり挟まる」形式。
    [漢字]+[ひらがな]+ を検出し、ひらがな末尾に助詞らしき部分があれば
    それだけ残して読み仮名部分を落とす。

    100% ではないので、出力後に目視確認する前提。
    """
    particles = ["について", "という", "って", "から", "まで", "より",
                 "など", "ので", "のは", "の", "は", "を", "が", "に",
                 "で", "と", "や", "も", "へ", "ば"]

    pattern = re.compile(rf"([{_KANJI}]+)([{_HIRA}]{{2,}})")

    def repl(m: re.Match) -> str:
        kanji, hira = m.group(1), m.group(2)
        # 末尾の助詞だけ温存（読み仮名そのものは捨てる）
        for p in sorted(particles, key=len, reverse=True):
            if hira.endswith(p) and len(hira) > len(p):
                return kanji + p
        return kanji

    return pattern.sub(repl, text)


def clean_question_text(text: str) -> str:
    text = re.sub(r"\s+", " ", text).strip()
    text = remove_furigana_known(text)
    # ヒューリスティックは誤爆リスクがあるので既定では辞書のみ。
    # より積極的に消したい場合は次行を有効化:
    # text = remove_furigana_heuristic(text)
    return text


def extract_text_dropping_ruby(node) -> str:
    """
    <ruby>漢字<rt>かな</rt></ruby> 形式なら rt/rp を取り除いてから
    テキスト化する（= ふりがなが最も正確に消える）。
    ruby が無ければ単純な get_text。
    """
    if node is None:
        return ""
    # コピーを破壊的に編集しないよう、rt/rp を一時的に外す
    for rt in node.find_all(["rt", "rp"]):
        rt.extract()
    return node.get_text(" ", strip=True)


# --------------------------------------------------------------------------- #
# HTML パース（Watu フォーム）
# --------------------------------------------------------------------------- #
@dataclass
class ParsedQuiz:
    quiz_id: Optional[str]
    form_action: str
    hidden_fields: dict
    questions: list[Question]


def _abs_img(src: Optional[str]) -> Optional[str]:
    if not src:
        return None
    return urljoin(BASE, src)


def parse_quiz_page(html: str, set_no: int, page_url: str) -> ParsedQuiz:
    """
    Watu の問題フォームをパースして、問題文・画像・各選択肢の answer_id を得る。

    Watu (無料版/Pro) の典型的な DOM:
        <form ... id="watupro..." action="...">
          <input type="hidden" name="watupro_quiz" value="QUIZ_ID">
          ... (nonce 等)
          <div class="watupro-question-block" data-question-id="QID">
             <p>問題文 ... <img src="..."> </p>
             <label><input type="radio" name="quizans[QID]" value="AID">正しい</label>
             <label><input type="radio" name="quizans[QID]" value="AID">誤り</label>
          </div>
          ...
        </form>

    ※ クラス名やフィールド名はテーマ/バージョンで変わるため、
       複数の候補を緩く拾う。実HTMLを見たら --debug-dump で確認し調整可。
    """
    soup = BeautifulSoup(html, "html.parser")

    # --- フォーム特定 ---------------------------------------------------- #
    form = None
    for f in soup.find_all("form"):
        fid = (f.get("id") or "") + " " + " ".join(f.get("class") or [])
        if "watu" in fid.lower() or f.find("input", attrs={"name": re.compile(r"quizans|watu", re.I)}):
            form = f
            break
    if form is None:
        form = soup  # フォームが無くても問題ブロックだけ拾えることがある

    form_action = urljoin(page_url, form.get("action") or page_url) if hasattr(form, "get") else page_url

    # --- hidden フィールド ----------------------------------------------- #
    hidden: dict[str, str] = {}
    quiz_id = None
    for inp in form.find_all("input", attrs={"type": "hidden"}):
        name, val = inp.get("name"), inp.get("value", "")
        if not name:
            continue
        hidden[name] = val
        if re.search(r"quiz", name, re.I) and val.isdigit():
            quiz_id = val

    # --- 問題ブロック ----------------------------------------------------- #
    blocks = form.find_all(
        attrs={"class": re.compile(r"watu.*question|question.*block|quiz.*question", re.I)}
    )
    # 取れなければ「quizans[QID] を持つ input の祖先」からグルーピング
    if not blocks:
        groups: dict[str, object] = {}
        for inp in form.find_all("input", attrs={"name": re.compile(r"quizans|q\[", re.I)}):
            m = re.search(r"\[(\d+)\]|=(\d+)", inp.get("name", ""))
            qid = (m.group(1) or m.group(2)) if m else None
            if qid and qid not in groups:
                # 祖先の中で最も近い "ブロックっぽい" 要素
                groups[qid] = inp.find_parent(["div", "li", "td", "p"]) or inp.parent
        blocks = list(groups.values())

    questions: list[Question] = []
    for idx, block in enumerate(blocks, start=1):
        # 問題文 + 画像
        img = block.find("img")
        image_url = _abs_img(img.get("src")) if img else None

        # 問題文ノード（選択肢ラベルを除いた本文）。<p> 優先。
        text_node = block.find("p") or block
        q_raw = extract_text_dropping_ruby(text_node)
        q_text = clean_question_text(q_raw)

        # 選択肢 (radio)
        radios = block.find_all("input", attrs={"type": re.compile("radio|checkbox", re.I)})
        qid = None
        true_aid = false_aid = None
        for r in radios:
            nm = r.get("name", "")
            m = re.search(r"\[(\d+)\]|(\d+)\]?$", nm)
            if m and not qid:
                qid = m.group(1) or m.group(2)
            label_txt = ""
            lbl = r.find_parent("label") or r.find_next_sibling(string=True)
            if hasattr(lbl, "get_text"):
                label_txt = lbl.get_text(strip=True)
            elif isinstance(lbl, str):
                label_txt = lbl.strip()
            # ○ / 正しい / 正解 → true, ✕ / 誤り / 間違い → false
            if re.search(r"○|◯|正しい|正$|^正解$|true|maru", label_txt):
                true_aid = r.get("value")
            elif re.search(r"[×✕✖]|誤|間違|false|batu|ばつ", label_txt):
                false_aid = r.get("value")
        # 2択でラベル判定できなかった場合は出現順 (1番目=○,2番目=✕) を仮採用
        if radios and true_aid is None and false_aid is None and len(radios) >= 2:
            true_aid, false_aid = radios[0].get("value"), radios[1].get("value")

        if not q_text:
            continue
        questions.append(Question(
            set=set_no, n=idx, q=q_text, image_url=image_url,
            qid=qid, true_answer_id=true_aid, false_answer_id=false_aid,
        ))

    return ParsedQuiz(quiz_id=quiz_id, form_action=form_action,
                      hidden_fields=hidden, questions=questions)


# --------------------------------------------------------------------------- #
# Strategy A: 埋め込み正解データ
# --------------------------------------------------------------------------- #
def strategy_a_embedded(html: str, quiz: ParsedQuiz) -> bool:
    """
    <script> 内に正解 (correct answer id) が埋め込まれていれば利用。
    Watu PRO の一部設定では JS に答えが出る。見つかれば answer を埋めて True を返す。
    """
    # answer_id -> correct? のような JSON / JS オブジェクトを総当たりで探す
    candidates = re.findall(r"(?:correct|right|answer)[\"']?\s*[:=]\s*([\[{][^\]}]*[\]}])",
                            html, re.I)
    correct_ids: set[str] = set()
    for c in candidates:
        correct_ids.update(re.findall(r"\d+", c))
    if not correct_ids:
        return False

    filled = 0
    for q in quiz.questions:
        if q.true_answer_id in correct_ids:
            q.answer = True
            filled += 1
        elif q.false_answer_id in correct_ids:
            q.answer = False
            filled += 1
    return filled > 0


# --------------------------------------------------------------------------- #
# Strategy B: フォーム送信して採点結果から逆算
# --------------------------------------------------------------------------- #
def strategy_b_grade(session: requests.Session, quiz: ParsedQuiz) -> bool:
    """
    「全問 ○ (正しい)」を選んで送信 → 結果ページの per-question 正誤から
    各問の正答を逆算する。

    結果ページで「その問題が正解だった」= ○ が正答 (answer=True)
                 「その問題が不正解だった」= ✕ が正答 (answer=False)
    """
    if not any(q.true_answer_id for q in quiz.questions):
        return False

    payload = dict(quiz.hidden_fields)
    for q in quiz.questions:
        if q.qid and q.true_answer_id:
            payload[f"quizans[{q.qid}]"] = q.true_answer_id  # 全問○を選択
    # Watu の送信ボタン名（候補）
    payload.setdefault("watupro_finish", "1")
    payload.setdefault("submit", "送信")

    try:
        resp = session.post(quiz.form_action, data=payload, headers=HEADERS, timeout=30)
        resp.raise_for_status()
    except Exception as e:  # noqa
        print(f"  [B] 送信失敗: {e}", file=sys.stderr)
        return False

    result = BeautifulSoup(resp.text, "html.parser")
    # 結果ページは question-id ごとに correct/incorrect クラスや ○✕ を表示する
    filled = 0
    for q in quiz.questions:
        marker = None
        if q.qid:
            marker = result.find(attrs={"data-question-id": q.qid}) \
                or result.find(id=re.compile(rf"(question|q)[-_]?{q.qid}\b"))
        scope = marker or result
        scope_html = str(scope)
        # 近傍に "correct"(正解) があれば ○ が正答
        snippet = scope_html
        if marker is None:
            continue
        if re.search(r"class=\"[^\"]*correct", snippet) or "正解" in snippet:
            q.answer = True
            filled += 1
        elif re.search(r"class=\"[^\"]*(incorrect|wrong)", snippet) or "不正解" in snippet:
            q.answer = False
            filled += 1

    return filled > 0


# --------------------------------------------------------------------------- #
# Strategy C: Playwright フォールバック
# --------------------------------------------------------------------------- #
def strategy_c_playwright(set_no: int, url: str) -> list[Question]:
    """
    ブラウザを起動し、全問「正しい(○)」を選択して結果を表示、
    各問の正誤マークから答えを確定する。A/B が無理な場合の最終手段。
    """
    try:
        from playwright.sync_api import sync_playwright
    except ImportError:
        print("  [C] playwright 未インストール: pip install playwright && playwright install chromium",
              file=sys.stderr)
        return []

    results: list[Question] = []
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page(user_agent=HEADERS["User-Agent"])
        page.goto(url, wait_until="networkidle", timeout=60000)

        # ○(正しい) のラジオを全部クリック
        labels = page.query_selector_all("label")
        for lbl in labels:
            t = (lbl.inner_text() or "").strip()
            if re.search(r"○|◯|正しい|^正解$", t):
                try:
                    lbl.click()
                except Exception:  # noqa
                    pass

        # 送信ボタン
        for sel in ["input[type=submit]", "button[type=submit]",
                    "text=送信", "text=採点", "text=Finish"]:
            btn = page.query_selector(sel)
            if btn:
                btn.click()
                break
        page.wait_for_load_state("networkidle", timeout=60000)

        html = page.content()
        browser.close()

    # 結果ページを HTML パーサで処理（問題文 + 正誤）
    soup = BeautifulSoup(html, "html.parser")
    blocks = soup.find_all(attrs={"class": re.compile(r"question", re.I)})
    for idx, block in enumerate(blocks, start=1):
        text_node = block.find("p") or block
        q_text = clean_question_text(extract_text_dropping_ruby(text_node))
        img = block.find("img")
        b = str(block)
        ans = None
        if re.search(r"class=\"[^\"]*correct", b) or "正解" in b:
            ans = True
        elif re.search(r"class=\"[^\"]*(incorrect|wrong)", b) or "不正解" in b:
            ans = False
        if q_text:
            results.append(Question(set=set_no, n=idx, q=q_text, answer=ans,
                                    image_url=_abs_img(img.get("src")) if img else None))
    return results


# --------------------------------------------------------------------------- #
# セット単位の処理
# --------------------------------------------------------------------------- #
def scrape_set(session: requests.Session, set_no: int, use_playwright: bool,
               debug_dump: bool) -> list[Question]:
    url = SET_URLS[set_no]
    print(f"[set {set_no}] GET {url}")
    resp = session.get(url, headers=HEADERS, timeout=30)
    resp.raise_for_status()
    html = resp.text

    quiz = parse_quiz_page(html, set_no, url)
    print(f"[set {set_no}] 問題抽出: {len(quiz.questions)}問 / quiz_id={quiz.quiz_id}")

    if debug_dump:
        dump = {
            "quiz_id": quiz.quiz_id,
            "form_action": quiz.form_action,
            "hidden_fields": quiz.hidden_fields,
            "questions": [
                {"n": q.n, "q": q.q, "qid": q.qid,
                 "true_aid": q.true_answer_id, "false_aid": q.false_answer_id,
                 "image_url": q.image_url}
                for q in quiz.questions
            ],
        }
        Path(f"debug_set{set_no}.json").write_text(
            json.dumps(dump, ensure_ascii=False, indent=2), encoding="utf-8")
        Path(f"debug_set{set_no}.html").write_text(html, encoding="utf-8")
        print(f"[set {set_no}] debug_set{set_no}.json / .html を出力。"
              "DOM 構造を確認してセレクタを調整してください。")

    if use_playwright:
        return strategy_c_playwright(set_no, url)

    # Strategy A
    if strategy_a_embedded(html, quiz):
        print(f"[set {set_no}] Strategy A (埋め込みデータ) で正解確定")
        return quiz.questions

    # Strategy B
    if strategy_b_grade(session, quiz):
        print(f"[set {set_no}] Strategy B (フォーム採点) で正解確定")
        return quiz.questions

    # Strategy C
    print(f"[set {set_no}] A/B 失敗 → Strategy C (Playwright) を試行")
    pw = strategy_c_playwright(set_no, url)
    if pw:
        return pw

    print(f"[set {set_no}] 警告: 正解を確定できませんでした。問題文のみ返します。",
          file=sys.stderr)
    return quiz.questions


# --------------------------------------------------------------------------- #
# JS スニペット生成
# --------------------------------------------------------------------------- #
def make_js_snippet(questions: list[Question]) -> str:
    lines = ["// driving_test_review_quiz_v4.html 追加用",
             "const menkyoKariQuestions = ["]
    for q in questions:
        topic = q.q[:20].replace("'", "\\'")
        qtext = q.q.replace("\\", "\\\\").replace("'", "\\'")
        img = f"image:'{q.image_url}', " if q.image_url else ""
        ans = "true" if q.answer else ("false" if q.answer is False else "null")
        lines.append(
            f"  {{set:{q.set}, n:{q.n}, topic:'{topic}', "
            f"q:'{qtext}', {img}answer:{ans}, explanation:''}},"
        )
    lines.append("];")
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# main
# --------------------------------------------------------------------------- #
def main() -> None:
    ap = argparse.ArgumentParser(description="menkyoblog.com 仮免問題スクレイパー")
    ap.add_argument("--sets", type=int, nargs="*", default=list(SET_URLS),
                    help="対象セット番号 (既定: 1〜10)")
    ap.add_argument("--out", default="menkyo_questions.json", help="出力 JSON パス")
    ap.add_argument("--js", action="store_true", help="quiz_snippet.js も出力")
    ap.add_argument("--playwright", action="store_true",
                    help="最初から Playwright (Strategy C) を使う")
    ap.add_argument("--debug-dump", type=int, metavar="SET",
                    help="指定セットの解析結果/HTML を dump して終了")
    args = ap.parse_args()

    session = requests.Session()
    all_questions: list[Question] = []

    targets = [args.debug_dump] if args.debug_dump else args.sets
    for set_no in targets:
        try:
            qs = scrape_set(session, set_no, args.playwright,
                            debug_dump=bool(args.debug_dump))
            all_questions.extend(qs)
        except Exception as e:  # noqa
            print(f"[set {set_no}] 失敗: {e}", file=sys.stderr)
        time.sleep(REQUEST_DELAY)

    if args.debug_dump:
        return

    out = [q.to_output() for q in all_questions]
    Path(args.out).write_text(
        json.dumps(out, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"\n✅ {len(out)}問 を {args.out} に出力")

    solved = sum(1 for q in all_questions if q.answer is not None)
    print(f"   うち正解確定: {solved}問 / 未確定: {len(out) - solved}問")

    if args.js:
        Path("quiz_snippet.js").write_text(make_js_snippet(all_questions), encoding="utf-8")
        print("   quiz_snippet.js も出力")


if __name__ == "__main__":
    main()
