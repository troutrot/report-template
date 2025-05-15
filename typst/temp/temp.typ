#let conf(
  subject: none,
  cdate: none,
  sdate: none,
  doc,
) = {
  set text(
    lang: "ja",
    font: "Hiragino Mincho ProN",
    size: 10.5pt,
  )

  set page(
    paper: "a4",
    margin: (x: 20mm, y: 20mm),
    columns: 1,
  )
  set par(leading: 1.5em)
  set heading(numbering: "\u{25AA} 1.1. ")
  show heading.where(level: 1): it => [
    #set text(lang: "ja", font: "Hiragino Kaku Gothic ProN", size: 12pt)
    #set par(first-line-indent: 0em)
    #if it.numbering != none [
      #counter(heading).display(it.numbering); #it.body
    ] else [
      \u{25AA}#h(0.5em)＜#it.body＞
    ]
    #v(0.5em)
  ]
  show heading.where(level: 2): it => [
    #set text(lang: "ja", font: "Hiragino Kaku Gothic ProN", size: 10.5pt)
    #set par(first-line-indent: 0em)
    #counter(heading).display(it.numbering)
    #it.body
    #v(0.5em)
  ]

  show "、": "，"
  show "。": "．"

  let max = (..values) => {
    if (len(values) == 0) {
      error("max: No values provided")
    }
    let result = values[0]
    for value in values {
      if value > result {
        result = value
      }
    }
    result
  }

  let zstack(..args) = {
    let width = 0pt
    let height = 0pt
    for item in args.pos() {
      let size = measure(item, styles)
      width = calc.max(width, size.width)
      height = calc.max(height, size.height)
    }
    box(
      width: width,
      height: height,
      {
        for item in args.pos() {
          place(item)
        }
      },
    )
  }

  let done = {
    context {
      let size = measure("\u{25A1}")
      let width = size.width
      let height = size.height
      box(
        width: width,
        height: height,
        {
          place("\u{25A1}")
          place("\u{2713}", dx: 0pt, dy: 1pt)
        },
      )
    }
  }

  let undone = {
    context {
      let size = measure("\u{25A1}")
      let width = size.width
      let height = size.height
      box(
        width: width,
        height: height,
        {
          place("\u{25A1}")
        },
      )
    }
  }

  align(center)[#text(16pt)[学生実験X　レポート]]
  v(1.5em)
  box(width: 1fr, stroke: (bottom: 0.5pt), height: 10.5pt, [実験題目: #h(1fr) #subject #h(1fr)])
  linebreak()
  v(1.5em)
  box(width: 1fr, stroke: (bottom: 0.5pt), height: 10.5pt, [学籍番号: #h(1fr) CXTB2000 #h(1fr)])
  h(1em)
  box(width: 1fr, stroke: (bottom: 0.5pt), height: 10.5pt, [氏名: #h(1fr) XXXX #h(1fr)])
  linebreak()
  v(1.5em)
  box(width: 13em, stroke: (bottom: 0.5pt), height: 10.5pt, [#h(1fr) XX #h(1fr) コース])
  h(1em)
  box(width: 4em, stroke: (bottom: 0.5pt), height: 10.5pt, [#h(1em) X #h(1fr) 班])
  h(1em)
  box(width: 1fr, stroke: (bottom: 0.5pt), height: 10.5pt, [実験日: #h(1fr) #cdate #h(1fr)])
  h(1em)
  box(width: 1fr, stroke: (bottom: 0.5pt), height: 10.5pt, [提出日: #h(1fr) #sdate #h(1fr)])
  linebreak()
  v(1.5em)
  box(
    width: 1fr,
    stroke: (bottom: 0.5pt),
    height: 10.5pt,
    [共同実験者: #h(1fr) XXXX #h(1fr) XXXX #h(1fr) XXXX #h(1fr) XXXX #h(1fr)],
  )
  linebreak()
  v(1.5em)
  box(
    width: 1fr,
    stroke: (bottom: 0.5pt),
    height: 10.5pt,
    [共同実験者: #h(1fr) XXXX #h(1fr) XXXX #h(1fr) XXXX #h(1fr) XXXX #h(1fr)],
  )
  linebreak()
  v(1.5em)

  set par(leading: 1em, justify: true)
  align(center)[#text(
      lang: "ja",
      font: "Hiragino Kaku Gothic ProN",
      size: 10.5pt,
    )[チェックリスト（チェックした項目の#undone を#done に変えながら，確認すること）]]
  text(lang: "ja", font: "Hiragino Kaku Gothic ProN", size: 10.5pt)[書　式]
  linebreak()
  text[#done　レポートは左綴じになっているか．]
  linebreak()
  text[#done　実験計画書，目的，概要(原理・方法)，結果，考察，まとめ，参考文献の順にまとめているか．]
  linebreak()
  text[#done　実験指針を丸写ししていないか．]
  linebreak()
  text[#done　実験結果，および考察（検討）は過去形で記してあるか．また，普遍的な内容は現在形で記してあるか．]
  linebreak()
  text[#done　実験指針に記載されている考察の項目にすべて回答しているか．]
  linebreak()
  text[#done　引用箇所を明示し，参考文献リストと対応づけているか．]
  linebreak()
  text[#done　参考文献リストは，以下のフォーマットで記してあるか．]
  linebreak()
  text(lang: "ja", font: "Hiragino Mincho ProN", size: 10pt)[#h(2.5em)\u{25EF}論文誌などを引用する場合：]
  linebreak()
  text(
    lang: "ja",
    font: "Hiragino Mincho ProN",
    size: 9pt,
  )[#h(2.5em)#h(2em) [1] 著者名，"標題，"雑誌名，巻，(号,) pp.を付けて始め－終りのページ，月年．]
  linebreak()
  text(lang: "ja", font: "Hiragino Mincho ProN", size: 10pt)[#h(2.5em)\u{25EF}著書，編書を引用する場合：]
  linebreak()
  text(lang: "ja", font: "Hiragino Mincho ProN", size: 9pt)[#h(2.5em)#h(2em) [2] 著者名，書名，編者名，発行所，発行年．]
  linebreak()
  text(lang: "ja", font: "Hiragino Mincho ProN", size: 10pt)[#h(2.5em)\u{25EF}著書の一部を引用する場合：]
  linebreak()
  text(
    lang: "ja",
    font: "Hiragino Mincho ProN",
    size: 9pt,
  )[#h(2.5em)#h(2em) [3] 著者名，"標題，" 書名，編者名，章番号またはpp.を付けて始め－終りのページ，発行所，発行年．]
  linebreak()
  text(lang: "ja", font: "Hiragino Mincho ProN", size: 10pt)[#h(2.5em)\u{25EF}Webページを引用する場合：]
  linebreak()
  text(
    lang: "ja",
    font: "Hiragino Mincho ProN",
    size: 9pt,
  )[#h(2.5em)#h(2em) [4] "Webページのタイトル"，URLアドレス，アクセスした日付．]
  linebreak()
  text(lang: "ja", font: "Hiragino Kaku Gothic ProN", size: 10.5pt)[図 ･ 表]
  linebreak()
  text[#done　グラフには横軸、縦軸のラベル（変数名と単位）を記しているか．]
  linebreak()
  text[#done　横向きのグラフがある場合，グラフの上側が綴じしろ側になるように描いているか．]
  linebreak()
  text[#done　図や表には，図１，表１のような番号づけをしているか．]
  linebreak()
  text[#done　「単位」が正しく記載されているか．]
  linebreak()
  text[#done　図の説明文は図の下側に，表の説明文は表の上側に記しているか．]
  linebreak()
  text[#par(
      hanging-indent: 1.5em,
    )[#done　グラフの表現方法は適切か（不適切な曲線補間をしていないか，グラフと記録条件の対応がわかるようにしてあるか等）．]]
  text[#done　本文で図や表について説明をしているか．]
  linebreak()
  linebreak()
  set par(first-line-indent: 1em)
  set par(leading: 1em)
  doc
}
