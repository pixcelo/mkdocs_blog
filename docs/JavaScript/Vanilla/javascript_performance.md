# JavaScript パフォーマンスを計測する

`window.performance`オブジェクトで処理を計測する

## Topic

- 実行時間を計測する
- ボトルネック調査

## Usage

`performance.now()`

```js
const t0 = performance.now();
doSomething();
const t1 = performance.now();
console.log(`Call to doSomething took ${t1 - t0} milliseconds.`);

function doSomething() {
    let x;
    for (let i = 0; i < 10000000; i++) {
        x += i;
    }
}
```

ミリ秒 (milli second) = 1,000分の1秒

## Reference
- [performance.now() MDN](https://developer.mozilla.org/ja/docs/Web/API/Performance/now)
- [The Performance interface](https://www.w3.org/TR/hr-time/#sec-performance)