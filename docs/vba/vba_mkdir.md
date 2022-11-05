---
tags:
  - VBA
---

# Excel VBA でフォルダを作成する

## MkDir

引数にパスを渡すことでフォルダを作成できる

## Usage
```VBScript
Sub sample_mkdir()

    Dim testPath As String
    testPath = ThisWorkbook.Path & "\TEST"

    MkDir testPath

End Sub
```
サンプルではブックと同じ階層に「TEST」フォルダが作成される

## Reference
[MkDir ステートメント](https://docs.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/mkdir-statement)
