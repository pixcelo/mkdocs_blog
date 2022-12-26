---
tags:
  - JavaScript
  - Leaflet
  - GIS
---

# Leaflet HTMLで作成したコントロールパネルを操作するときに地図への伝搬を防ぐ

Leaflet地図にクリックイベントを設定した状態で、`HTML`で作成したコントロールメニューを操作すると、地図のクリックイベントも発火してしまう

そのため、親要素である地図へクリックイベントの伝搬を防ぐ設定が必要となる

## Usage

`stopPropagation`は、親要素への伝搬を停止させる

`L.DomEvent.disableClickPropagation()`は、要素の'click', 'dblclick', 'contextmenu', 'mousedown', 'touchstart' イベントに`stopPropagation`を追加する

```javascript
const div = L.DomUtil.create('div', 'leaflet-tile');

if (!L.Browser.touch) {
    L.DomEvent.disableClickPropagation(div);
} else {
    L.DomEvent.on(div, 'click', L.DomEvent.stopPropagation);
}
```

## Reference
* [Leaflet](https://leafletjs.com)
* [L.DomEvent](https://leafletjs.com/reference.html#domevent)
