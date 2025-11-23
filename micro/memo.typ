#set text(font:"Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()

$
E[Y] = integral y f(y) d y 
$
$
E[Y|X] &= integral y f_(Y|X =x) (y) d y
\ &= integral y f_Y (y) d y
$

$
E[Y|X] &= integral y f_(Y|X) (y) d y
\ &= integral y (f(x,y)) / f_X(x) d x
$

$
E[Y] &= integral integral y f(x ,y) d y d x
\ &= integral (y integral f(x,y) d y) d x
\ &= integral (y integral f(x,y) / (f_X (x))d y) f_X (x) d x
\ &= integral E[Y|X] f_X (x) d x
\ &= E[E[Y|X]] 

(because E[Y|X] = integral y (f(x,y)) / f_X(x) d x)
$