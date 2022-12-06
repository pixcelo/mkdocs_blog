---
tags:
  - JavaScript
---

# JavaScript URLをクリップボードにコピーする

## Usage
`writeText`を使用すると、ブラウザからクリップボード使用の可否について確認メッセージが表示される

URLをコピー
```javascript
const url = location.href;
navigator.clipboard.writeText(url);
```

URLをペースト `promise`が返る
```javascript
if (navigator.clipboard) {
    navigator.clipboard.readText()
    .then(function(text) {
        const input = document.getElementById('inputURL');
        input.value = text;
    });
}
```

基本的には`https`環境での使用となる（社内サーバーでは下記のエラーとなった）
```
Uncaught TypeError: Cannot read properties of undefined (reading 'writeText')
```

## Reference
* [クリップボード API](https://developer.mozilla.org/ja/docs/Web/API/Clipboard_API)
