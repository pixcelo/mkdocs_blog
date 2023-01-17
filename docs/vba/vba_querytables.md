---
tags:
  - VBA
---

# Excel VBA QueryTablesでCSVを読み込みコピーする

## Topic

VBAでCSVファイルをまるっとそのままシートにコピーしたいときに使う

## Usage

データを読み込んだシートは、CSVとリンクした状態になる

```VBScript
Private Sub readData(csvPath As String)

    Dim ws As Worksheet
    Worksheets.Add after:=Worksheets(Worksheets.Count)
    
    Set ws = ActiveSheet
    ws.name = ("data")

    With ws.QueryTables.Add(Connection:= _
        "text;" & csvPath, Destination:=Range("$A$1"))
        .TextFilePlatform = 932 ' Shift_JIS
        .TextFileCommaDelimiter = True
        .Refresh BackgroundQuery:=False
    End With
    
    ws.Visible = False

End Sub
```

## Reference
- [QueryTables.Add メソッド (Excel)](https://learn.microsoft.com/ja-jp/office/vba/api/excel.querytables.add)
