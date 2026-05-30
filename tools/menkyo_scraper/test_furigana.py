#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""ふりがな除去のテスト。  python test_furigana.py で実行。"""

from scrape_menkyo import clean_question_text, remove_furigana_heuristic


def test_known_dictionary():
    src = ("優先ゆうせん道路どうろを通行つうこうしているとき以外いがいは、"
           "自転車じてんしゃ横断おうだん帯たいの手前てまえ30メートル以内いないの"
           "場所ばしょでは、自動車じどうしゃや原動機げんどうき付つき"
           "自転車じてんしゃを追越おいこしてはならない。")
    expected = ("優先道路を通行しているとき以外は、自転車横断帯の手前30メートル"
                "以内の場所では、自動車や原動機付自転車を追越してはならない。")
    got = clean_question_text(src)
    assert got == expected, f"\n got: {got}\n exp: {expected}"


def test_image_caption():
    src = "この標識ひょうしきは、この先さきで車線しゃせん数すうが減少げんしょうしていることを示しめしている。"
    got = clean_question_text(src)
    # 辞書にある語のふりがなは消える
    assert "標識" in got and "ひょうしき" not in got
    assert "車線" in got and "しゃせん" not in got
    assert "減少" in got and "げんしょう" not in got


def test_particles_preserved_heuristic():
    # ヒューリスティック: 「道路どうろを」→「道路を」 (助詞 を を温存)
    assert remove_furigana_heuristic("道路どうろを") == "道路を"
    # 純粋な助詞の連なりは漢字直後でも温存
    assert remove_furigana_heuristic("車は") == "車は"


if __name__ == "__main__":
    failures = 0
    for name, fn in list(globals().items()):
        if name.startswith("test_") and callable(fn):
            try:
                fn()
                print(f"PASS {name}")
            except AssertionError as e:
                failures += 1
                print(f"FAIL {name}: {e}")
    raise SystemExit(failures)
