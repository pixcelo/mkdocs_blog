---
tags:
  - JavaScript
---

# JavaScript URLをクリップボードにコピーする


## Usage
```javascript
const url = location.href;
navigator.clipboard.writeText(url);
```

```javascript
if (navigator.clipboard) {
    navigator.clipboard.readText()
    .then(function(text) {
        const input = document.getElementById('inputURL');
        input.value = text;
    });
}
```

## Reference
* [クリップボード API](https://developer.mozilla.org/ja/docs/Web/API/Clipboard_API)
