#set text(font:"Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()

== 202410178

== 今村隼人

= 課題6-1

== 1 Amazon

(a) 

- 商品
- ユーザー
- 購入のログ

(b)
- 商品の購入
- ユーザーの情報変更
- 商品の追加

== 2 Git Hub

(a)
- repository
- organization
- user

(b)
- push commit merge
- organizationのmember管理

= 課題6-2

== 1

メニューのテーブルの価格が500円のメニューIDは2

注文のテーブルのメニューIDが2のものの注文IDをすべて列挙すると(2,3)となる

== 2

注文のテーブルの時間がAMのものは注文IDが1,2,...6なのでそれらのメニューIDは(3,2,2,1,4)でメニューテーブルからこれらの価格をを参照すると
$
600 + 500 + 500 + 400 + 750 = 2750
$
となる

== 3

座席テーブルからテーブルの座席IDは(2,3)なので注文IDから座席IDが(2,3)のものをすべて列挙し各メニューIDごとに数え上げると
$
(m e n u I D:c o u n t)= (1: 1),(2: 2)(3: 0) (4: 3)
$

#pagebreak()

== 課題6-3

== 1 （ジャンルが『小説』である本の検索）

書籍テーブルのジャンルが「小説」の書籍IDは(101, 104)

書籍テーブルからこれらのタイトルと著者をすべて列挙すると (こころ: 夏目漱石), (走れメロス: 太宰治) となる

== 2 （『田中 一郎』さんが借りた本と日付の検索）

利用者テーブルの名前が「田中 一郎」の利用者IDは1

貸出テーブルの利用者IDが1のものの書籍IDと貸出日をすべて列挙すると (101: 2023-10-01), (102: 2023-10-05) となる

== 3 （『Python入門』を借りた利用者と日付の検索）

書籍テーブルのタイトルが「Python入門」の書籍IDは102

貸出テーブルの書籍IDが102のものの利用者IDと貸出日をすべて列挙すると (user_id: date) = (1: 2023-10-05), (3: 2023-10-10)

利用者テーブルからこれらの名前を参照し貸出日と合わせると (田中 一郎: 2023-10-05), (佐藤 建: 2023-10-10) となる

#let db-table(title, ..args) = {
    figure(
        table(
            stroke: 0.5pt + gray,
            fill: (x, y) => if y == 0 { gray.lighten(70%) } else { none },
            inset: 8pt,
            align: (x, y) => if x == 0 { center } else { left },
            table.header(..args.pos().slice(0, args.named().at("columns").len())),
            ..args.pos().slice(args.named().at("columns").len())
        ),
        caption: title
    )
}

= 図書館データベース

== 1. Users Table (利用者)
#table(
    columns: (auto, 1fr, auto),
    table.header([*user_id*], [*name*], [*join_date*]),
    fill: (x, y) => if y == 0 { gray.lighten(80%) },
    
    [1], [田中 一郎], [2023-04-01],
    [2], [鈴木 花子], [2023-05-15],
    [3], [佐藤 建],   [2023-06-20],
)

== 2. Books Table (書籍)
#table(
    columns: (auto, 2fr, 1fr, auto),
    table.header([*book_id*], [*title*], [*author*], [*genre*]),
    fill: (x, y) => if y == 0 { gray.lighten(80%) },

    [101], [こころ],       [夏目漱石], [小説],
    [102], [Python入門],   [山田太郎], [技術書],
    [103], [統計学の基礎], [鈴木次郎], [学術書],
    [104], [走れメロス],   [太宰治],   [小説],
)

== 3. Loans Table (貸出)
#table(
    columns: (auto, auto, auto, 1fr),
    table.header([*loan_id*], [*user_id*], [*book_id*], [*loan_date*]),
    fill: (x, y) => if y == 0 { gray.lighten(80%) },
    align: (col, row) => if col == 3 { left } else { center },

    [1], [1], [101], [2023-10-01],
    [2], [1], [102], [2023-10-05],
    [3], [2], [104], [2023-10-06],
    [4], [3], [102], [2023-10-10],
)


#pagebreak()

= 課題6-4

```py
tables()
```

```text
Done.
[('商品',), ('顧客',)]
```

```py
schema("商品")
```
#linebreak()
```text
Done.
sql
CREATE TABLE 商品(
商品番号 char(3) not null,
商品名 varchar(20),
価格 int,
primary key(商品番号)
)
```