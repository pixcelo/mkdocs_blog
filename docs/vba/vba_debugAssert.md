---
tags:
  - VBA
---

# Excel VBA Debug.Aseertでテストメソッドを実装する

- `Debug.Aseert`でVBAの関数にテストを書けるようにする

## Usage

`Debug.Assert`は、`False`のときだけ処理が中断される

- `Sum`は足し算をするプログラム
- `Main`関数で呼び出して使用している

```VBScript
Option Explicit

' プログラムのエンドポイント
Public Sub Main()
    Dim n As Long
    n = Sum(2, 3)
    Debug.Print n
End Sub

' テスト対象のプログラム
Public Function Sum(augend As Long, addend As Long) As Long
    Sum = augend + addend
End Function
```

- `TestSum`では、`Sum`関数に引数を渡して、結果と比較している
- テストが失敗した場合のみ、テストメソッドが中断される

```VBScript
' テストメソッド
Sub TestSum()
    ' Arrange
    Dim expected As Long
    expected = 5
    
    ' Act
    Dim actual As Long
    actual = Sum(2, 3)
    
    ' Assert
    Debug.Assert actual = expected
    
    Debug.Print ("Tests Successful")
End Sub
```

## Reference
- [Assert メソッド](https://learn.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/assert-method)
- [.NET Core と .NET Standard での単体テストのベスト プラクティス](https://learn.microsoft.com/ja-jp/dotnet/core/testing/unit-testing-best-practices)