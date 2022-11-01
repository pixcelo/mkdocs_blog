# Excel VBA で変数を宣言したときの初期値

Excel VBA で変数を宣言したときの初期値は何が入っているか？<br>
変数を宣言したときの初期値は、以下の通り

```VBScript
Sub sample()

Dim num As Long ' 0
Dim str As String ' "" (空白）
Dim ws As Worksheet ' Nothing

End Sub
```

変数の宣言後に値を代入するまでは「それぞれに決められた初期値が入っていること」を押さえておくと良い<br>
初期値を把握しておくと、値を代入していない場合の挙動を理解できるので<br>
プログラムの処理結果に対する理由がわかる<br>

## Reference
[変数を宣言する](https://learn.microsoft.com/ja-jp/office/vba/language/concepts/getting-started/declaring-variables)<br>
[データ型の概要](https://learn.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/data-type-summary)<br>
[変数と定数のキーワード サマリー](https://learn.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/variables-and-constants-keyword-summary)<br>
