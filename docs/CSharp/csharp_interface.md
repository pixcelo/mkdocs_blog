---
tags:
  - C#
---

# C# インターフェースを定義する

* インターフェースによって実装の抽象を定義する
* 継承したクラスは、定義された実装の詳細を強制される

## インターフェースの継承

* `ImplementationClass : ISampleInterface`の形式で継承
* 複数のインターフェースを継承できる

```cs
interface ISampleInterface
{
    void SampleMethod();
}

class ImplementationClass : ISampleInterface
{
    // Explicit interface member implementation:
    void ISampleInterface.SampleMethod()
    {
        // Method implementation.
    }

    static void Main()
    {
        // Declare an interface instance.
        ISampleInterface obj = new ImplementationClass();

        // Call the member.
        obj.SampleMethod();
    }
}
```

## Reference
[interface (C# リファレンス)](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/keywords/interface)<br>
[チュートリアル: .NET で依存関係の挿入を使用する](https://learn.microsoft.com/ja-jp/dotnet/core/extensions/dependency-injection-usage)<br>
