# Excel VBA 保護・保護解除を切り替える

## Protect・Unprotect

`Protect`でワークシートを保護し、変更できないようにする<br>
パスワードは大文字と小文字が区別され、省略するとパスワードの使用なしで保護・解除できる<br>
`Unprotect`で保護を解除する<br>

## Usage
```VBScript
Sub sample_Protect()

    Dim ws As Worksheet
    Set ws = Worksheets("sheet6")

    Dim myPassword As String
    myPassword = "Y6dh!et5"

    ' 保護
    ws.Protect Password:=myPassword

     ' 保護の解除
     ' ws.Unprotect = myPassword

End Sub
```

## Reference
[Worksheet.Protect メソッド (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.worksheet.protect)<br>
[Worksheet.Unprotect メソッド (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.worksheet.unprotect)<br>
