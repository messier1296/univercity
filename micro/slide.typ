#import "@preview/slydst:0.1.4": *
#import "@preview/showybox:2.0.4":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *



#set text(font:"Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
#show: codly-init.with()



#show: slides.with(
  title: "繰り返し期待値の法則", // 必須
  subtitle: none,
  date: none,
  authors: "今村隼人",
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

#v(10%)
#showybox(title: "繰り返し期待値の法則(law of iterated expectation)", frame: (
  border-color: olive,
  title-color: olive.lighten(10%),
  body-color: olive.lighten(95%),
  footer-color: olive.lighten(80%),
), footer: $(Y"の期待値") = ("全ての"X"に対する"Y"の期待値の平均")$)[
  以下の等式を繰り返し期待値の法則と呼ぶ

  $E[Y] = E[E[Y|X]]$
]

ex)

$X = $ 性別
$Y = $ 身長

$
E[E[Y|X]] &= E[P(X = "男") E[Y|X = "男"] + P(X = "女") E[Y|X = "女"]] 
\ &= E[Y]
\ &= ("標本全体の平均身長")
$

#pagebreak()


#v(10%)
#showybox(title: "繰り返し期待値の法則の証明(連続確率変数)", frame: (
  border-color: blue,
  title-color: blue.lighten(10%),
  body-color: blue.lighten(95%),
  footer-color: blue.lighten(80%),
), footer: "")[
$  
E[Y] &= integral integral y f(x ,y) d y d x
\ &= integral (integral y f(x,y) d y) d x
\ &= integral (integral y f(x,y) / (f_X (x))d y) f_X (x) d x
\ &= integral E[Y|X] f_X (x) d x
\ &= E[E[Y|X]] 
(because E[Y|X] = integral y (f(x,y)) / f_X(x) d x)
$
]

#v(10%)
#showybox(title: "繰り返し期待値の法則の証明(離散確率変数)", frame: (
  border-color: blue,
  title-color: blue.lighten(10%),
  body-color: blue.lighten(95%),
  footer-color: blue.lighten(80%),
), footer: "")[
  $ E[E[Y|X]]
  &= sum_x E[Y | X = x] P(X = x) \
  &= sum_x ( sum_y y P(Y = y | X = x) ) P(X = x) \
  &= sum_x sum_y y frac(P(X = x, Y = y), P(X = x)) P(X = x)  (because P(Y|X) = P(X,Y) / P(X) ) \ 
  &= sum_y y sum_x P(X = x, Y = y) \
  &= sum_y y P(Y = y) \
  &= E[Y] $
]

== 問題例

火災保険会社Aがある家屋の掛け金について考えている.

災害の確率から損害額の期待値を求める.

#table(
  align: right,
  columns: (14em,14em,14em),
  fill: (x, y) =>
    if x == 0 or y == 0 {
      gray.lighten(40%)
    },
  [],[10年で災害が起こる確率],[損害額の期待値(万)],
  [火災],[$0.05$],[$5000$],
  [地震],[$0.20$],[$1000$],
  [落雷],[$0.10$],[$300$],
)

#pagebreak()

$X$を災害が起こる確率,$Y$を損害額とする

$
E[Y] &= E[E[Y|X]]
\ &= 0.05 times 5000 + 0.20 times 1000 + 0.10 times 100
\ &=  480
$

10年間での損害額の期待値は$480$万円とわかった.

このように個々の事象期待値はわかるが全体の期待値がわからない場合に繰り返し期待値の法則は有効である.

== まとめ