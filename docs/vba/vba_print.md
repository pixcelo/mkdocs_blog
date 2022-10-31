# Excel VBAで縮小して全体を表示する

印刷範囲を設定しているのに点線で印刷したい範囲がズレるのは、ページ全体の拡大・縮小率が原因

## PageSetup

ワークシートを印刷するときの拡大率・縮小率 (%) を、10 ～ 400 の範囲で値を設定

## Usage
```VBScript
Worksheets("Sheet1").PageSetup.Zoom = 150
```
サンプルでは、シート 1 を印刷するときに150% に拡大している

## Reference
[PageSetup.Zoom プロパティ (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.pagesetup.zoom)<br>
