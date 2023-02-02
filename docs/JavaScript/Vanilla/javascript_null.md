---
tags:
  - JavaScript
---

# JavaScript null値の数値比較

MDNの解説によると、null値は`null`というリテラル（数値や文字列を記述した定数）である

null値を変数に代入すると、存在はするが値は空ではないオブジェクトという位置付けになる

```javascript
typeof null          // "object" (歴史的な理由で "null" ではありません)
typeof undefined     // "undefined"
null === undefined   // false
null  == undefined   // true
null === null        // true
null  == null        // true
!null                // true
isNaN(1 + null)      // false
isNaN(1 + undefined) // true
```

## nullを数値と比較

null値と数値を比較すると、`true`を返す場合がある

数値と比較する可能性のある変数にnull値を入れると、バグの原因になるので注意した方が良い

```javascript
console.log("null > 0", null > 0);   // false
console.log("null >= 0", null >= 0); // true
console.log("null < 0", null < 0);   // false
console.log("null <= 0", null <= 0); // true

console.log("null > 1", null > 1);   // false
console.log("null >= 1", null >= 1); // false
console.log("null < 1", null < 1);   // true
console.log("null <= 1", null <= 1); // true
```

## Reference
* [null JavaScript MDN Web Docs](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/null)
