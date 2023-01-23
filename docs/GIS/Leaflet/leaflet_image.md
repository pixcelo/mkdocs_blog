---
tags:
  - JavaScript
  - Leaflet
  - GIS
---

# Leaflet 地図を画像としてキャプチャするライブラリ leaflet-image

## Topic

- 地図を画像としてキャプチャするプラグイン
- Leaflet.markerclusterと併用はできない（画像として出力されない）

## Usage

- `leafletImage`のコールバック関数にて、画像を生成してHTMLとして追加する
- circleMarkerを表示する場合、mapに`preferCanvas: true`が必要

```js
const map = L.mapbox.map('map', 'YOUR.MAPID').setView([38.9, -77.03], 14);

leafletImage(map, function(err, canvas) {
    // now you have canvas
    // example thing to do with that canvas:
    const img = document.createElement('img');
    const dimensions = map.getSize();
    img.width = dimensions.x;
    img.height = dimensions.y;
    img.src = canvas.toDataURL();
    document.getElementById('images').innerHTML = '';
    document.getElementById('images').appendChild(img);
});
```
画像は`img`の`src`にBase64形式で保存される

`'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAJYCAYAAA....`

`canvas`なので`blob`オブジェクトを扱うこともできる

```js
canvas.toBlob(function(blob) {
  var newImg = document.createElement("img"),
      url = URL.createObjectURL(blob);

  newImg.src = url;
  document.body.appendChild(newImg);
});
```

`FormData`に入れてPOSTすれば、サーバーサイドでバイナリをファイルとして保存できる

```js
const formData = new FormData();
formData.append("image", canvas.toDataURL());
```

## Reference
- [Leaflet Plugins](https://leafletjs.com/plugins.html)
- [leaflet-image](https://github.com/mapbox/leaflet-image)
- [HTMLCanvasElement.toDataURL()](https://developer.mozilla.org/ja/docs/Web/API/HTMLCanvasElement/toDataURL)