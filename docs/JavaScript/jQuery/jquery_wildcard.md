---
tags:
  - jQuery
---

# jQuery 「文字列を含む」でセレクタを指定する(ワイルドカード)

## Topic

- jQueryの使い方シンプルメモ
- セレクタのあいまい指定

## Usage
```html
<div class="div-1" >one</div>
<div class="div-2" >two</div>
<div class="div-3" >three</div>
```

`div-`で始まる`class`を全て指定

```js
$("[class^=div-]").each(function() {
  console.log($(this).text());
});
```

## Reference
- [jQuery](https://jquery.com/)
- [API Documentation](https://api.jquery.com/)