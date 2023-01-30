---
tags:
  - jQuery
---

# jQuery セレクトボックスで選択した値を取得する

## Topic

- jQueryの使い方シンプルメモ
- セレクトボックスの取得
- `change`イベント

## Usage
```html
<select class="colors" name="color">
    <option value="1">red</option>
    <option value="2">yellow</option>
    <option value="3">green</option>
</select> 
```

選択した項目の値とテキストを取得

```js
$('.colors').on('change', function() {
    const selected = $('.colors option:selected');
    console.log(selected.val(), selected.text());
})
```

## Reference
- [jQuery](https://jquery.com/)
- [API Documentation](https://api.jquery.com/)