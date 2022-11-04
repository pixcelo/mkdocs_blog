---
tags:
  - VBA
---

# Excel VBA 文字列を置換する

## Replace
`Replace(式、 find、 replace、[ start, [ count, [ compare ]])`

第１引数に渡した値の中の、第２引数の値を第３引数に置き換える<br>

`""`で置き換えると、指定した引数を削除するといった使い方も可<br>

オプションで、第４引数に開始位置、第５引数に置換する回数を指定できる<br>

引数にNull値を渡すとエラーになるので注意（空白はOK）<br>

## Usage
```VBScript
Sub sample_Replace()

    Dim str As String
    str = "1,2,3,4,5,6,7,8,9,0"

    ' すべて置き換える
    MsgBox Replace(str, ",", "") ' 1234567890

    ' 一番最初だけ置き換える
    MsgBox Replace(str, ",", "", 1, 1) ' 12,3,4,5,6,7,8,9,0

    ' ダブルクォーテーションを置き換える
    str = " ""ダブルクォーテーション"" "
    MsgBox Replace(str, """", "＠") ' ＠ダブルクォーテーション＠

    ' 全角を半角に置き換える
    str = " ""ダブルクォーテーション"" "
    MsgBox Replace(str, """", Chr(&H8168))

End Sub
```

## Reference
[Replace 関数](https://docs.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/replace-function)
