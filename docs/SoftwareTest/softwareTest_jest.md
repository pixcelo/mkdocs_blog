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

`package.json`に`scripts`を追記
```json
{
  "scripts": {
    "test": "jest"
  },
  "devDependencies": {
    "jest": "^29.3.1"
  }
}
```

テストを実行
```
npm test
```

実行結果
```
% npm test

> test
> jest

 PASS  getting-started/sum.test.js
  ✓ adds 1 + 2 to equal 3 (2 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.42 s
Ran all test suites.
```

## Mathcer

`toBe()`は、厳密な等価性をテスト

```javascript
test('two plus two is four', () => {
    expect(2 + 2).toBe(4);
});
```

`toEqual()`は、オブジェクトや配列のすべての値を再起的にチェック

```javascript
test('object assignment', () => {
    const data = {one: 1};
    data['two'] = 2;
    expect(data).toEqual({one: 1, two: 2});
});


test('adding positive numbers is not zero', () => {
    for (let a = 1; a < 10; a++) {
      for (let b = 1; b < 10; b++) {
        expect(a + b).not.toBe(0);
      }
    }
});
```

## DOM操作のテスト




## Reference
* [Jest](https://jestjs.io/ja/)
* [jsdom](https://github.com/jsdom/jsdom)
