#import "@preview/slydst:0.1.4": *
#import "@preview/showybox:2.0.4": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

// フォント設定
#set text(font: "Noto Serif CJK JP")
#set page(numbering: "-1-")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))

// Codlyの初期化
#show: codly-init.with()

// スライドの初期設定
#show: slides.with(
    title: "熱中症による搬送者数の推定",
    subtitle: none,
    date: datetime.today().display("[year]年[month]月[day]日"), 
    authors: "今村隼人",
    layout: "medium",
    ratio: 16/9,
    title-color: none,
)

// --- 1枚目 ---

== 初期の回帰分析：最高気温のみ

#grid(
    columns: (1.3fr, 1fr),
    gutter: 1em,
    [
        最高気温のみを用いて搬送者数の回帰を行いました。
        しかし、結果のグラフを確認すると、以下の特徴が見られます。

        - **閾値の存在**: \
            25度程度までは搬送者数の期待値はほぼ0といってもよさそうです。
        - **非線形性**: \
            線形（直線）ではなく、気温の上昇に伴い二乗に比例して急増しているように見えます。
    ],
    [
        // 画像プレビュー用（本番は#imageを使ってください）
        #align(center)[
            /*#rect(width: 100%, height: 60%, fill: luma(240), stroke: 1pt + gray)[
                *Image: output.png* \
                (最高気温での回帰グラフ)
            ]*/
        ]
        #image("tmp.png", width: 100%)
    ]
)

// --- 2枚目 ---

== 推定モデルの改善

グラフから得られた知見をもとに、以下の2つの改善を組み合わせます。

#showybox(
    frame: (border-color: black, title-color: black, body-color: white),
    title: "改善のアプローチ",
    [
        1. **回帰に閾値を設ける** ($tau$ は閾値)
           $ z(T; tau) = max {0, T - tau} $
        2. **二乗の項を採用する**
           $ y_i = beta_0 + beta_1 x_i + beta_2 x_i ^2 $
    ]
)

#grid(
    columns: (1.1fr, 0.9fr),
    gutter: 1em, // 余白を詰めて1枚に収める
    [
        === 結果の比較 (RMSE)
        
        // 数式を少し小さくして省スペース化
        $ R M S E = sqrt(1/n sum(y_i - f(x_i))^2) $

        #table(
            columns: (auto, auto, auto),
            inset: 6pt, // 表の余白を縮小
            align: center + horizon,
            stroke: (x, y) => if y == 0 { (bottom: 1pt + black) } else { none },
            table.header([*閾値*], [*次数*], [*RMSE*]),
            [なし], [1次], [11.03],
            [なし], [2次], [8.70],
            [あり], [1次], [8.73],
            [*あり*], [*2次*], [*8.51*],
        )
        
        $arrow$ *閾値・二乗項の両方を採用することで結果が向上しました。*
    ],
    [
        #align(center + horizon)[
            /*#rect(width: 100%, height: 50%, fill: luma(240), stroke: 1pt + gray)[
                *Image: tmp_imp.png* \
                (改善後のグラフ)
            ]*/
        ]
        #image("tmp_imp.png", width: 100%)
    ]
)