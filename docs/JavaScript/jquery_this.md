---
tags:
  - jQuery
---

# jQuery $(this)で要素を取得する

## Topic

- jQueryの使い方シンプルメモ
- $(this)の活用

## Usage
```html
<button type="button" class="btn">click</button>
```

`$(this)`をコンソールに出力する

```js
$('.btn').on('click', function() {
    console.log($(this));
});
```

イベントが発生した要素を取得できる

```
jQuery.fn.init [button.btn]
button.btn
length
[[Prototype]]
Object(0)
```



## Reference
- [jQuery](https://jquery.com/)
- [API Documentation](https://api.jquery.com/)