// --- パッケージのインポート ---
#import "@preview/slydst:0.1.4"
#import "@preview/showybox:2.0.4"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

// --- 主要な関数の再エクスポート ---
// これにより、main.typで個別にimportしなくても slide や showybox が使えるようになります
#let slide = slydst.slide
#let showybox = showybox.showybox

// --- テンプレート関数の定義 ---
#let presentation(body) = {
    // 1. Codlyの初期化と設定
    show: codly-init.with()
    
    codly(
        languages: (
            r: (name: "R", color: rgb("#FF8C00")), // Rコードはオレンジ枠
            text: (name: "", color: white),        // 結果(text)は装飾なし
        ),
        number-format: none,    // 行番号を消す
        zebra-fill: none,       // シマシマ背景を消す
        fill: rgb("#1e1e1e"),   // 背景を「端末っぽい濃いグレー」にする
        stroke: 0.5pt + gray,   // 薄い枠線
        radius: 4pt,            // 角を少しだけ丸く
    )

    // 2. フォント・テキスト設定
    set text(font: "Noto Sans CJK JP", fill: white, size: 15pt)
    show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK JP"))
    
    // 太字(*...*)の部分を自動的に黄色にする
    show strong: set text(fill: rgb("#ffcc00"))
    
    // Rawテキスト（コードブロック）のサイズ調整
    show raw: set text(size: 9pt)

    // 3. 段落・リストのデザイン調整
    set par(leading: 0.8em, spacing: 1.2em)
    set list(spacing: 1.2em, marker: [--])

    // 4. ページ設定
    // slydstのデフォルトを上書きする形で設定します
    set page(numbering: "-1-", fill: navy)

    // 本文を出力
    body
}