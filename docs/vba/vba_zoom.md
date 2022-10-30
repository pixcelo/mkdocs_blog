Excel VBA で表示倍率を変更する

## ActiveWindow.Zoom

`Zoom`プロパティに数値を渡すことで、表示倍率を変更できる<br>
`100`を渡せば、100%になる

## Usage

```vb
Sub sample_Zoom()

    Dim ws As Worksheet
    Set ws = Worksheets("sheet1")

    ws.Select
    ActiveWindow.Zoom = 80

End Sub
```

Excelの仕様で、表示倍率によっては画像サイズを上手く取得できない場合がある<br>
「一度、表示倍率を100%にした後に戻す」といった使い方でエラーを回避できる<br>

## Reference
[Window.Zoom プロパティ (Excel)](https://learn.microsoft.com/ja-jp/office/vba/api/excel.window.zoom)
