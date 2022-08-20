# How to check if a cell has input in a range in Excel VBA.
In Excel VBA, there are cases where you want to assign processing to cells in a specified range based on whether or not a value is entered in the cell.

For example, you may want to check for errors when you reach a row with input in a cell by looking at the rows in order from the top to the bottom.

In such a case, you can use the `CountA` function.

## CountA
CountA returns the total number of pieces of data in each item.

In other words, if there is at least one count, then some value has been entered into the cell.

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
In the sample example, we look at rows 1 through 10 in order.

If there is any input in the range of rows 2 through 5, it will go into a block in the If statement.

## Points to note
If there is an empty string input, CountA determines that there is an input even if the cell does not have an apparent input.

Note that this may cause unintended behavior.

## Reference
* [CountA](https://docs.microsoft.com/en-us/office/vba/api/excel.worksheetfunction.counta)
