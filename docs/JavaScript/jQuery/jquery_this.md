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
<button type="button" id="btn-id" class="btn" value="1">click</button>
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

## 属性・値を取得する
`attr()`で要素の属性を取得する

```js
$(this).attr('id')
// 'btn-id'

$(this).attr('class')
// 'btn'
```

`val()`で要素の`value`を取得する

```js
$(this).val()
// '1'
```

## 属性・値を変更する

```js
// 値を変更
$(this).val('new-value');

// 属性を変更
$(this).attr('name', 'new-name');

// CSSを変更
$(this).css('color', 'red');

// CSSを変更（複数）
$(this).css({'color':'red', 'background-color':'brown'});

// CSSを追加
$(this).addClass('add');

// CSSを削除
$(this).removeClass('add');
```

## Reference
- [jQuery](https://jquery.com/)
- [API Documentation](https://api.jquery.com/)
- [.attr(attributeName)](https://api.jquery.com/attr/#attr-attributeName)