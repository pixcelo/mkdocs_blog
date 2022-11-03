# Excel VBA でブックを開く

他ブックを開いて、変数に格納するなど他ブックを操作したい場合に使用する

## Workbooks.open

引数に開きたいブックのパスを指定する

## Usage
```VBScript
Sub sample_OpenBook()

    Dim wb As Workbook
    Dim bookPath As String
    bookPath = "D:\user\samples\sample.xlsm"

    Workbooks.Open (bookPath)

    ' 読み取り専用で開く
    ' Workbooks.Open (bookPath), ReadOnly:=True

End Sub
```

`ReadOnly:=True`で読み取り専用として開く、などオプションを指定することができる<br>
開いたブックを閉じる操作の`Workbooks.Close`とセットで用いられる

## Reference
[Workbooks オブジェクト (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.workbooks)<br>
[Workbooks.Open メソッド (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.workbooks.open)<br>
[Workbooks.Close メソッド (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.workbooks.close)<br>
