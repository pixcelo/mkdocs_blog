# Excel VBA メッセージウィンドウを出す

## MsgBox

引数に渡した文字列や変数を、ダイアログボックスに表示する<br>
ボタンつきメッセージの場合、ユーザーがどのボタンをクリックしたかを示す整数を返す

## Usage
```VBScript
Sub sample_Msgbox()

    Dim str As String
    str = "サンプルメッセージ"

    ' 文字列や変数などを表示できる
    MsgBox str

    Dim msg As Long
    msg = MsgBox("処理を開始しますか？", vbYesNo)

    If msg = vbNo Then
        Exit Sub
    Else
        ' 「はい」を選んだら処理を実行
        ' Call sample_Macro
    End If

End Sub
```

サンプルでは「いいえ」を選ぶと処理をストップ、「はい」を選ぶと処理が継続されるようになる<br>
指定できる定数の一覧は、公式ドキュメントに掲載されているので参考にしてください。

## Reference
[MsgBox 関数](https://docs.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/msgbox-function)
