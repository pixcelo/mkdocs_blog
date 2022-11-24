---
tags:
  - VBA
---

# Excel VBA シートをコピーする

## Worksheets("SheetName").Copy
`Worksheets` オブジェクトをコピーする

オプションの`Before`、`After`でコピー位置を指定

## Usage
```VBScript
Sub sample_Copy()

Worksheets("sheet1").Copy After:=Worksheets(Worksheets.Count)

End Sub
```

`Sheet1`のコピーが、一番最後のシートの後ろに作成される

## Reference
* [Worksheets.Copy メソッド (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.worksheets.copy)
