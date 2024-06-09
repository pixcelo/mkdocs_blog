---
tags:
  - C#
---

# C# 属性クラス

属性クラスは、`[ ]`でクラスやメソッドに情報を付与できる機能

## Usage
例えば、特定のメソッドをデバッグ時のみ実行したい場合、<br>
以下のように属性を付与する

```cs
/// <summary>
/// 属性でデバッグ時のみ処理する
/// </summary>
[Conditional("DEBUG")]
public void Message()
{
    Console.WriteLine("デバッグ時のみ実行");
}
```

## カスタム属性クラス

属性クラスは自作で定義することもできる

命名規則は、`〇〇Attribute`と`Attribute`で終わる必要がある
```cs
/// <summary>
/// メソッドの実行時間を計測するためのカスタム属性
/// </summary>
[AttributeUsage(AttributeTargets.Method, Inherited = true)]

public class MeasureExecutionTimeAttribute : Attribute
{
    public void OnMethodExecuting()
    {
        Stopwatch = Stopwatch.StartNew();
    }

    public void OnMethodExecuted()
    {
        Stopwatch?.Stop();
        Console.WriteLine($"Method execution time: {Stopwatch?.ElapsedMilliseconds} ms");
    }

    private Stopwatch? Stopwatch { get; set; }
}
```

カスタム属性を利用する場合は、以下のように実装する

メソッドに属性を付与
```cs
/// <summary>
/// カスタム属性の利用
/// </summary>
[MeasureExecutionTime]
public void LongRunningMethod()
{
    // 長時間かかる処理のシミュレーション
    Thread.Sleep(2000);
}
```

カスタム属性の情報にアクセスする
```cs
/// <summary>
/// カスタム属性のメソッドを呼び出す例
/// </summary>
static void Main(string[] args)
{
    var classA = new classA();
    classA.InvokeWithAttribute(classA, nameof(classA.LongRunningMethod));
}

public void InvokeWithAttribute(object obj, string methodName)
{
    var method = obj.GetType().GetMethod(methodName);
    var attributes = method.GetCustomAttributes(typeof(MeasureExecutionTimeAttribute), true);

    foreach (MeasureExecutionTimeAttribute attribute in attributes)
    {
        attribute.OnMethodExecuting();
        method.Invoke(obj, null);
        attribute.OnMethodExecuted();
    }
}
```

## 属性の使いどころ
既存のロジックに影響することなく、メタ情報を付与できるため、
様々なシーンで活用されている

- データ検証(validation)
- シリアル化(Serialization)
- ロギング・トレーシング
- 役割ベースのアクセス制御
- テストクラス・テストメソッド
- その他ロジックを適用するためのメタ情報付与

## Reference
- [Attribute クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.attribute?view=net-8.0)
- [カスタム属性を記述する](https://learn.microsoft.com/ja-jp/dotnet/standard/attributes/writing-custom-attributes)
- [カスタム属性の定義と読み取り](https://learn.microsoft.com/ja-jp/dotnet/csharp/advanced-topics/reflection-and-attributes/attribute-tutorial?source=recommendations)
- [リフレクションを使用して属性にアクセスする](https://learn.microsoft.com/ja-jp/dotnet/csharp/advanced-topics/reflection-and-attributes/accessing-attributes-by-using-reflection?source=recommendations)