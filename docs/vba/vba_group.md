# Excel VBA でシートの全画像をグループ化する

## Group
`Group`は、オブジェクトをグループ化するメソッド

## Usage
```VBScript
Sub sample_Group()

    Dim ws As Worksheet
    Set ws = Sheets("Sheet1")

    Dim shp As Shape
    Dim cnt As Long

    ' 画像の数を取得
     For Each shp In ws.Shapes
        If shp.Type = 13 Then ' 画像タイプで判定
            cnt = cnt + 1
        End If
    Next

    ' 画像が複数あればグループ化
    If cnt > 1 Then
        ActiveSheet.Shapes.SelectAll
        Selection.ShapeRange.Group.Name = "グループ画像"
    End If

End Sub
```
画像を一つだけグループ化しようとするとエラーになるので、サンプルでは最初に画像の数を取得している

## Reference
[Chart オブジェクト (Excel)](https://learn.microsoft.com/ja-jp/office/vba/api/excel.chart(object))<br>
[Shape オブジェクト (Excel)](https://learn.microsoft.com/ja-jp/office/vba/api/excel.shape)<br>
