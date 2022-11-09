---
tags:
  - VBA
---

# Excel VBA 一定時間 待機する

Excel VBAで処理が重くなってしまうと、マクロが正常に実行されない場合がある<br>

e.g.<br>
画像を大量にコピー・ペーストを行った際に、処理が失敗してしまう<br>

このような場合に、意図的に待機時間を作る`Sleep`関数を用いる

## Sleep

`Sleep`は、引数に指定した時間だけ待機させるWindows API関数<br>

`Sleep 1000`とすると、1000ミリ秒 = 1秒 待機させる<br>

WindowsのAPI関数なので、プロジェクト内にAPI宣言が必要<br>

## Usage
```VBScript
' API宣言(※32Bit, 64Bit 両方に対応)
#If VBA7 Then
    Public Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As LongPtr)
#Else
    Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
#End If

Sub sample_Sleep()

    Dim ws As Worksheet
    Set ws = Sheets("Sheet3")

    ws.Shapes("図 3").Copy

    ' ここで1秒待機する
    Sleep 1000

    ws.Paste

End Sub
```

サンプルでは、「図３」を`Copy`したあとに1秒の待機時間を設けている<br>
