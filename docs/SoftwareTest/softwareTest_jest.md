---
tags:
  - ソフトウェアテスト
---

# Jest JavaScriptでユニットテストを実装する

`Jest`は、`Node.js`で実行する`JavaScript`のテストフレームワーク

## Usage

npmでインストール
```
npm install --save-dev jest
```

テストする関数を実装
```javascript title="sum.js"
function sum(a, b) {
  return a + b;
}
module.exports = sum;
```

テストを実装
```javascript title="sum.test.js"
const sum = require('./sum');

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3);
});
```


## Reference
* [Jest](https://jestjs.io/ja/)
