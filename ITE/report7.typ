#set text(font:"Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()


== 202410178

== 今村隼人

= 課題7-1

集合を$ A = {a,d,e}$,$ B = {a,b,c}$,$ C = {a,c,d}$とすする

$
A union B = {a,b,c,d,e}
$

$
A  inter C = {a,d}
$
$
A - (B union C) = {e}
$
$
A union nothing = {a,d,e}
$
$
A - nothing = {a,d,e}
$
$
2^ A = {nothing,{a},{d},{e},{a,d},{a,e},{d,e},{a,d,e}}
$


= 課題7-2

$D_1 = {A,B}$ ,$D_2 = {0,1}$,$D_3 = {x,y,z}$とする.

タプルの例,$(A,0,x)$,$(B,1,y)$,$(A,1,z)$

リレーションの例,$R_1 = {(A,0),(B,1)}$,$R_2 = {(A,0),(A,1),(B,1)}$,

$R_3 = {(A,0),(A,1),(B,1),(B,0)}$

次元:3

リレーションの濃度の最大数:12

1以上の濃度をもつリレーションの総数:2^12 - 1 = 4095

= 課題7-3

学生(学籍番号、氏名)

科目(科目コード、科目名、単位数)

履修(科目コード、学籍番号、成績)

(a) 

== 科目と履修のスキーマに関してスーパーキーと候補キーを全列挙せよ

科目、スーパーキー: (科目コード),(科目名),(科目コード,科目名)

科目、候補キー: (科目コード),(科目名)

履修、スーパーキー: (科目コード,学籍番号)

履修、候補キー: (科目コード,学籍番号)

(b) 

== 外部キーを全列挙せよ

履修の属性 科目コードは科目の主キー科目コードを参照する外部キーである

履修の属性 学籍番号は学生の主キー学籍番号を参照する外部キーである

(c)

== 科目名、単位数、成績についてドメインはどのようなものであるべきか

科目名:string

単位数:float

成績:string

= 課題7-4

```text

a. 商品名 like 'コピー用紙%'

b. 商品名 like 'コピー用紙A_'

c. 商品名 like 'コピー用紙A_%'

d 商品名 not like 'コピー用紙A_'

```

```text
1 コピー用紙
2 コピー用紙A4
3 コピー用紙B5
4 コピー用紙A4用紙10パックセット
```

a: 1,2,3,4

b: 2,4

c: 2,3,4

d: 1,4

= 課題7-5

== Step1

#image("image.png")

== Step2

#image("image2.png")


== Step3

#image("image3.png")

== Step4

#image("image4.png")

