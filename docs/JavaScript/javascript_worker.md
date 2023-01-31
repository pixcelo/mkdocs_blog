---
tags:
  - JavaScript
---

# JavaScript ウェブワーカーによる並列処理



## Usage

- Workerはローカル環境では動作しない
- Live Server等のVSコード拡張でサーバーを立てると動作確認できる

メインスレッド
```js title="main.js"
const worker = new Worker("worker.js");

// workerへデータを送信
const obj = {id: 1, name: 'Tom'};
worker.postMessage(obj);

// workerからデータを受信
worker.onmessage = function(e) {
    console.log(e.data);
}
```

Worker
```js title="worker.js"
// メインスレッドからデータを受信
onmessage =  function(e) {

    // do something
    const msg = 'message from worker';

    // メインスレッドへデータを送信
    postMessage(msg);
}
```

- workerからDOM操作はできない

## GitHub
- [ソースコード](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker)

## Referenc
- [Worker](https://developer.mozilla.org/ja/docs/Web/API/Worker)
- [ウェブワーカーの使用](https://developer.mozilla.org/ja/docs/Web/API/Web_Workers_API/Using_web_workers)
- [ウェブワーカーが使用できる関数やクラス](https://developer.mozilla.org/ja/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers)
- [SharedArrayBuffer](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer)