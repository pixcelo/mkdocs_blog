---
tags:
  - VBA
---

# Excel VBA でフォルダの画像を挿入する

Excel VBAで指定したフォルダの画像をシートにコピーする方法です。

## Pictures.Insert
引数に渡したパスのファイルをシートに挿入することができる<br>
Widthを指定して渡すと、縦横比率を保ったまま画像サイズを調整の調整が可能

## Usage
```VBScript
Sub sample_PasteImg()

    Dim ws As Worksheet
    Set ws = Worksheets("sheet3")

    Dim imgPath As String
    imgPath = ThisWorkbook.Path & "\img\picture.png"

    With ws.Pictures.Insert(imgPath)
        .Top = Range("A1").Top
        .Left = Range("A1").Left
        .Width = 300 ' サイズも指定できる
        .Cut
    End With

    ' 指定したセル範囲にペースト
    ws.Range("B2:D5").Select
    ws.Pictures.Paste

End Sub
```
画像のサイズを指定するときは、`.Width = Range("A1:D5").Width`“とセルを基準にすることもできる
