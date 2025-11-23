#set text(font:"Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()


問題1

示されているコードでは探索する値以上のインデックスを返す。
つまり$40$を探索すると$A[l] >= 40$以上の最小のインデックスが$l$になる。

1 $46$

2 $97$

問題2

(1)
$f(n)$のreturn呼び出し回数を$F(n)$と表す
$
F(0) = 1
$
$
F(1) = 1
$
$
F(2) &= F(1) + F(0)
\ &= 2
$
$
F(3) &= F(2) + F(1)
\ &= 3
$
$
F(4) &= F(3) + F(2)
\ &= 5
$
$
F(5) &= F(4) + F(3)
\ &= 8
$
$
F(6) &= F(5) + F(4)
\ &= 13
$

よって$f(3)$の場合3回$f(6)$の場合13回呼ばれることがわかる

問題3

1 $f(x) = n + 10000$

2 $f(x) = n ^ 2 + 10n + 100$

3 $f(x) = n + n ^ 2 + n!$

4 $f(x) = n root(3,n)$

1 $O(N)$ ,2 $O(n^2)$ , 3 $O(n!)$ 4 $O(n^(4/3))$


問題4

以下のようなPythonコードを実行する
```Python
n,m = map(int,input().split())

if n < m:
    n,m = m,n

while m != 0:
    r = n % m
    print(r)
    n = m
    m = r
```

(1)
```text
root@notepc0928:~/university/algorithm# python3 test.py
12345 678
141
114
27
6
3
0
```

(2)
```text
root@notepc0928:~/university/algorithm# python3 test.py
2025 1006
13
5
3
2
1
0
```
