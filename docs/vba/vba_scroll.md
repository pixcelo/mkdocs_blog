---
tags:
  - VBA
---

# Excel VBA スクロールが動いた状態から一番左上に戻す

## ActiveWindow.ScrollRow・ActiveWindow.ScrollColumn

`ActiveWindow.ScrollRow`は行番号、`ActiveWindow.ScrollColumn`は列番号を数値で指定する<br>

それぞれに`1`を指定した場合、スクロールが`A1`、つまり左上に戻る

## Usage
```VBScript
Sub sample_Scroll()

    ' 行
    ActiveWindow.ScrollRow = 1

    ' 列
    ActiveWindow.ScrollColumn = 1

End Sub
```

VBAでシートを操作した後に、表示を戻したいときに使える

## Reference

[Window.ScrollRow プロパティ (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.window.scrollrow)<br>
[Window.ScrollColumn プロパティ (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.window.scrollcolumn)<br>
