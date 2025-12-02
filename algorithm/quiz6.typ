#set text(font:"Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()


== 202410178

== 今村隼人

= 問題1

(1)

#image("heap2.png" ,width: 30%)

= 問題2

$1 -> 4 -> 6 -> 7 -> 9$の順で挿入したとき

$9$は最大値なので最も深い位置に置くためには新しく挿入される$n o d e$が常に右の子に配置される必要がある。よって昇順で挿入すればよい

#pagebreak()

= 問題3

(1)

#image("avl1.png", width:30%)

(2)

#image("avl2.png",width:30%)

