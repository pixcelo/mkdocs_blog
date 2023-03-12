---
tags:
  - VBA
---

# Excel VBA クラスを定義する

- VBAでクラスを定義し、使用する方法

## Usage

クラスモジュールを作るには、挿入 -> クラスモジュールを選択

![class module](img/vba_cls.png)

クラスを呼び出し、使用する

```VBScript
Option Explicit

Public Sub Class_Initialize()
    With Application
        .ScreenUpdating = False
    End With
End Sub

Public Sub Class_Terminate()
    With Application
        .ScreenUpdating = True
    End With
End Sub
```

## Reference
- [宣言されている VBA プロジェクトの外部からクラス (オブジェクト) を使用する方法](https://learn.microsoft.com/ja-jp/previous-versions/office/troubleshoot/office-developer/set-up-vb-project-using-class)