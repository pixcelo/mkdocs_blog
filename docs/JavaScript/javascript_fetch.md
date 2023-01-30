---
tags:
  - JavaScript
---

# JavaScirpt fetch API

## Usage

```js
async function fetchJson() {
    try {
        const rs = await fetch('example.json');
        const data = await rs.json();
    } catch (e) {
        console.log(e);
    }
}
```

## Reference
[フェッチ API の使用 MDN](https://developer.mozilla.org/ja/docs/Web/API/Fetch_API/Using_Fetch)
[fetch-examples GitHub](https://github.com/mdn/dom-examples/tree/main/fetch)
