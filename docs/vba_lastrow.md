# How to get the last row cell in Excel VBA.
This section explains how to get the last row of cells in Excel VBA.

You may want to get the last row of a cell in various situations,<br>
such as operating on multiple sheets or varying row counts.

## Cells(Rows.Count, 1).End(xlUp).Row
This is how to get the last row of a cell using the End property.

```VB
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
This way you can dynamically get the last line number.
