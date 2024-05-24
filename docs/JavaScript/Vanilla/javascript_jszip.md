---
tags:
  - JavaScript
---

# JavaScript JSZipライブラリでZipファイルの中のファイルを読み込む

## Topic

- JSZipはZipファイルを扱うライブラリ
- クライアント側からZipファイルの中身を読み込む
- Node.js、chromeなどに対応しており使い勝手が良い

## Usage

Zipファイルの中にあるjsonファイルを読み込むサンプル

```html
<script src="jszip-utils.js"></script>
<script src="jszip.js"></script>
```

```js
const path = 'test.zip';

// ZIP読み込み
JSZipUtils.getBinaryContent(path, function(err, data) {
    if (err) {
        throw err;
    }

    // JSON読み込み
    JSZip.loadAsync(data)
        .then(function(zip) {

            // ファイル指定
            zip.file('example.json').async('string')
                .then(function(json) {
                    console.log(eval(json));
                });

        });
});
```

JSZipはデュアルライセンスであり、MITライセンスとして使用できる

## Referenc
- [JSZip](https://stuk.github.io/jszip/)
- [jszip-utils](https://github.com/stuk/jszip-utils)
- [Promise MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Promise)