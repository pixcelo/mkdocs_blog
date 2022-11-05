---
tags:
  - VBA
---

# Excel VBA 現在時刻を表示する

## Now
現在の日付と時刻を指定するVariant (Date) を返す

## Usage
```VBScript
Sub sample_now()

    Dim savePath As String
    savePath = ThisWorkbook.Path & "\" & ThisWorkbook.Name & "_" & _
                        Format(Now, "yyyy年mm月dd日hh時mm分ss秒")

    MsgBox savePath

End Sub
```

サンプルでは「ファイル名 + 日付時間」をパスとして取得している<br>
バックアップのファイル名を作成するシーンを想定

## Reference
[Now 関数](https://docs.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/now-function)
