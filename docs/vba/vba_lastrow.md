# Excel VBAで最終行のセルを取得する

複数シートに対して操作する場合や、行数が変動するなど<br>
様々なシーンでセルの最終行を取得したいときに使用

## Usage

`Cells(Rows.Count, 1).End(xlUp).Row`<br>

Endプロパティを利用して最終行を取得する<br>

`Cells(Rows.Count, 1)`は<br>

1列目の「エクセルの最大行」（つまり一番下）のこと<br>

`.End(xlUp).Row`は、そのオブジェクトの場所から上に飛んだセルの行番号

```VBScript
Sub get_last_row()

    Dim ws As Worksheet
    Set ws = Worksheets("sheet1")
    Dim last_row As Long

    ' e.g. Get the last row in column A
    last_row = ws.Cells(Rows.Count, 1).End(xlUp).row

    ' e.g. Get the last row in column B
    last_row = ws.Cells(Rows.Count, 2).End(xlUp).row

End Sub
```

## Reference
[Range.End](https://docs.microsoft.com/en-us/office/vba/api/excel.range.end)<br>
[Range.Rows](https://docs.microsoft.com/en-us/office/vba/api/excel.range.row)
