---
tags:
  - JavaScript
  - Leaflet
  - GIS
---

# Leaflet タイルレイヤーの背景を一時的に非表示にする

背景にタイルレイヤーを設定しているアプリケーションで、一時的に背景を非表示にしたい場合の方法

## Usage

初期状態では、タイルレイヤーのオブジェクトを削除するとグレーの背景が表示される

デフォルトのCSSは、以下のようになっている

```css
.leaflet-container {
    background: #ddd;
    outline-offset: 1px;
}
```

背景色を予め、任意の設定に変更（例えば白）に設定しておくことで、タイルレイヤーを削除したときに背景を非表示にしたように見える

```css
.leaflet-container {
    background-color: #fff;
}
```

## Reference
* [Leaflet](https://leafletjs.com)
