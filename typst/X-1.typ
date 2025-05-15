#import "@preview/physica:0.9.3": *
#set math.equation(numbering: "(1)")
#set math.mat(delim: "[")
#import "temp/temp.typ": conf
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/physica:0.9.2": *
#show: doc => conf(
  subject: [使い方],
  cdate: [2000/01/01],
  sdate: [2000/01/01],
  doc,
)

= このテンプレートについて
== このテンプレートの使用対象
このテンプレートは，電気・通信・電子・情報工学実験A・B・Cの報告書及びレポートを作成するためのものです．

== 使用上の注意
- 授業内で配布されているテンプレートはword形式ですが，このテンプレートは配布されたword形式のファイルを\LaTeX で書き直したものです．

- このテンプレートで作成したレポートを提出した場合，指定の提出フーマットと異なる部分があるため，提出を受け付けられない場合があります．利用は自己責任で行ってください．

- 再配布につきましては，個別に確認してください．

- また，テンプレートが授業で配布されたものと異なる時等に有益な改変を行った場合には，このリポジトリにプルリクエストを行ってください．

- 以上の注意を守れる方のみ，このテンプレートを使用してください．

= このテンプレートの使い方
== 全般的な注意
このテンプレートの構造は以下のようになっており，tempフォルダ内のファイルで基本的な設定を行い，そのファイルをインポートして使用します．共同実験者や実験A・B・C等を設定する場合は，tempフォルダ内のtemp.typを編集してください．
#sourcecode[```bash
  .
  └── X-1
      ├── temp
      │   ├── jikken.csl
      │   └── temp.typ
      ├── test.bib
      ├── X-1.pdf
      └── X-1.typ
  ```]
test.bibは参考文献を記載するためのファイルで，jikken.cslは参考文献のスタイルを定義するファイルです．

== 利用環境別の注意
=== Windows
　このテンプレートのデフォルトのフォントは，Mac OS Xのフォントであるヒラギノ角ゴシックを使用しています．Windows環境で使用する場合は，temp.typ内のフォント設定を変更してください．

例えば，Windows環境で使用する場合は，Hiragino Mincho ProNとしてある部分をMS Minchoに変更し，Hiragino Kaku Gothic ProNとしてある部分をMS Gothicに変更してください．

nvim等のエディタを使用している場合は，以下のコマンドを実行してください．
#sourcecode[```
  %s/Hiragino Mincho ProN/MS Mincho/g
  %s/Hiragino Kaku Gothic ProN/MS Gothic/g
  ```]
#pagebreak()
#bibliography("test.bib", style: "temp/jikken.csl")
