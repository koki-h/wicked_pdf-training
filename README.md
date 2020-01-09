# README
Rails6でwicked_pdfを使う練習

## 注意点色々
- Docker(Alpine Linux)では wkhtmltopdf-binary を gem で入れても動かない。(gemではAlpine Linux用のバイナリが入らないため)
コンテナにログインした後 `sudo apk add wkhtmltopdf` してから、 `config/initializers/wicked_pdf.rb` に以下のように書く

```
WickedPdf.config = {
  exe_path: "/usr/bin/wkhtmltopdf"
}
```

- 日本フォントを入れないと文字化けする。予めIPAexフォントなどをダウンロードし、`app/assets/fonts` 配下に入れてコンテナ側で `rails assets:precompile` する。
- 普通のWEBページのテンプレートと共用不可。PDFレンダリング時にはlayoutが適用されないためstyleseetやjavascriptのパスを自前で書いておく
- metaタグでcharsetの指定をしないと文字化けする。

## テンプレートの例
```
<!DOCTYPE html>
<html>
  <head>
    <title>Wicked PDF</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <%= wicked_pdf_stylesheet_link_tag    'application', 'data-turbolinks-track': 'reload' %>
    <%= wicked_pdf_javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>
  <body>

    aaaaaaaaaaaaaa あいうえお

  </body>
</html>
```

## IPAexフォントダウンロードページ
https://ipafont.ipa.go.jp/node193

## 参考
- https://qiita.com/tanakaworld/items/18ec7ff7c7a9fadcf0ae
- https://qiita.com/Joharu/items/8edeb9f00b6dd462f127
