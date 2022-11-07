---
tags:
  - VBA
---

# Excel VBA 他ブックのマクロを実行する

現在のブック以外から、マクロを呼び出したいケースに使用

## Application.Run

`Application.Run`を用いて、他ブックのマクロを名前を指定して実行できる<br>
引数には「ブック名.xlsm!マクロ名」と指定

## Usage

```VBScript
Sub sample_RunMacro()

    Dim wb As Workbook
    Set wb = Workbooks("sample.xlsm")

    Dim macro_name As String
    macro_name = "sample_1"

    ' sample.xlsm!sample_1 のマクロが実行される
    Application.Run wb.Name & "!" & macro_name

End Sub

```

## Reference
[Application.Run メソッド (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.application.run)
