---
tags:
  - jQuery
---

# jQuery チェックボックスでチェックした値を取得する

## Topic
- jQueryの使い方シンプルメモ
- チェックボックスの取得
- changeイベント

## Usage

```html
<input type="checkbox" class="colors" name="colors" value="1" checked>
<label for="red">red</label>

<input type="checkbox" class="colors" name="colors" value="2">
<label for="green">green</label>
```

- `checked`はチェック済みの要素を全て取得する
- `each`でチェック済みのものを一つずつ取得できる

```js
$('.colors').on('change', function() {
    const checked = $('.colors:checked');
    checked.each(function() {
        console.log($(this).val());
    });
});
```

## Reference
- [jQuery](https://jquery.com/)
- [API Documentation](https://api.jquery.com/)
- [checked selector](https://api.jquery.com/checked-selector/#checked1)
- [each(function)](https://api.jquery.com/each/#each-function)