#set text(font: "Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()

#align(center)[
    = クイズ11
]

#align(right)[
    == 202410178
    == 今村隼人
]

= 問1

(1) パターン `pat` = "ACACAB" に対する `next[i]` の値は以下の通りである。

#table(
    columns: (auto, auto, auto, auto, auto, auto, auto),
    align: center,
    [*$i$*], [0], [1], [2], [3], [4], [5],
    [*`pat[i]`*], [A], [C], [A], [C], [A], [B],
    [*`next[i]`*], [0], [1], [0], [1], [0], [4]
)

(2) `text` = "AACACADBACACAB" から `pat` を探索する過程は以下の通りである。

#figure(
    kind: "code",
    supplement: "図",
    raw(lang: "txt", "
A A C A C A D B A C A C A B
A X * * * *
  A C A C A X
      * * * X * *
            X * * * * *
              X * * * * *
                A C A C A B
")
)

<解説>
- 1行目 (`i=0`): `text[0]`で一致、`text[1]`で不一致。
- 2行目 (`i=0`): シフトし、`text[1]...text[5]`("ACACA")まで一致。`text[6]`('D')と`pat[5]`('B')で不一致。
- 3行目 (`i=3`): `i`は `next[5]-1 = 3` となる。`pat[0..2]`("ACA")は一致済み扱い(`*`)。`pat[3]`('C')と`text[6]`('D')を比較し不一致。
- 4行目 (`i=0`): `i`は `next[3]-1 = 0` となる（最適化により `i=1` をスキップ）。`pat[0]`('A')と`text[6]`('D')を比較し不一致。
- 5行目 (`i=-1` -> リセット): `j`が進む。`pat[0]`('A')と`text[7]`('B')を比較し不一致。
- 6行目: 一致。