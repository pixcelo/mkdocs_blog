---
tags:
  - VBA
---

# Excel VBA 範囲内のセルに入力があるかどうかを確認する
指定した範囲のセルに対して、値が入力されたかどうかで処理を割り振りたい場合がある
<br><br>

e.g.<br>
セルに入力がある行に到達したとき、上から順番に見てエラーをチェックしたい

このようなケースにおいて`CountA`関数を使用する

## CountA
CountA は、各項目のデータの総数を返す<br>
少なくとも1つ以上カウントがあれば、そのセルに何らかの値が入力されたことを示す

```VBScript
Sub CountA()

    Dim ws As Worksheet
    Set ws = Sheets("Sheet1")
    Dim i As Long

    For i = 1 To 10
        If WorksheetFunction.CountA(ws.Range(ws.Cells(i, 2), ws.Cells(i, 5))) <> 0 Then
            ' Do something
        End If
    Next

End Sub
```
サンプルの例では、1行目から10行目までを順番に見ている<br>
2行目から5行目の範囲に入力があれば、If文のブロックに入る<br>

## 注意点
空文字列の入力がある場合、`CountA`はそのセルに見かけ上の入力がなくても 入力があると判断する<br>

そのため、意図しない動作を引き起こす可能性があることに注意<br>

## Reference
[WorksheetFunction.CountA メソッド (Excel)](https://learn.microsoft.com/ja-jp/office/vba/api/excel.worksheetfunction.counta)
