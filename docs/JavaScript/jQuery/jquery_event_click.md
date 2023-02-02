---
tags:
  - jQuery
---

# jQuery クリックイベントを設定する

## Topic

jQueryの使い方シンプルメモ

## Usage
```html
<button id="btn" type="button">click</button>
```

`click`でイベントを設定

```js
$('#btn').click(function() {
    alert('clicked');
});
```

`on`でイベントを設定

```js
$('#btn').on('click', function() {
    alert('clicked');
});
```

- `on`は複数のイベントを設定できる
- 後から追加したHTML要素にもイベントを設定できる

## Reference
- [jQuery](https://jquery.com/)
- [API Documentation](https://api.jquery.com/)