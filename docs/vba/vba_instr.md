---
tags:
  - VBA
---
# Excel VBA で文字列が含まれているかを調べる

Excel VBAで指定した文字列が、検索対象に含まれているかを調べる方法

## Instr

ある文字列が、別の文字列の中で最初に現れる位置を数値で返す<br>

戻り値は見つからなければ「0」<br>
見つかった場合は見つかった場所を返すので、「0以上の数値」になる<br>

## Usage
```VBScript
Sub sample_Instr()

    If InStr(Cells(2, 2).Value, "@") <> 0 Then
        MsgBox "記号が含まれています。"
    Else
        MsgBox "記号は含まれていません。"
    End If

End Sub
```

サンプルでは、`<> 0`とすることで、見つかった場合のみ`True`になる

## Reference
[InStr 関数](https://docs.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/instr-function)
