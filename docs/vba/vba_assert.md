---
tags:
  - VBA
---

# Excel VBA Assertメソッドの動き

## Usage

- `Assert`は、条件が`False`の場合のみ処理を中断する
- 明示的に`Assert`を用いることで編集時のドキュメント機能の役割も担う
- 開発環境でのみ動作する

```VBScript
Option Explicit

Private blnAssert As Boolean
Private intNumber As Integer

Private Sub Command1_Click()
    blnAssert = Not blnAssert
    intNumber = IIf(intNumber <> 0, 0, 1)
    Command1.Caption = intNumber
End Sub

Private Sub Command2_Click()
    Debug.Assert blnAssert
End Sub

Private Sub Form_Load()
    Command1.Caption = intNumber
    Command2.Caption = "Assert Tester"
End Sub
```

VBEは条件つきブレークポイントがないので、代替として利用できる

## Reference
- [Assert メソッド](https://learn.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/assert-method)