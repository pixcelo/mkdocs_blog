---
tags:
  - C#
  - MVC
---

# C# クラスなどのオブジェクトのプロパティをループで取得する

## Topic

オブジェクトのプロパティに`foreach`などのループでアクセスする方法

## Usage

リフレクションを利用して、`GetType()`で取得したオブジェクトのプロパティを参照する

```cs
using System.Text;

namespace prop;

class Program
{
    class Sample
    {
        public int MyProperty { get; set; }
        public string? MyName { get; set; }
    }

    static void Main()
    {
        Sample sample = new Sample()
        {
            MyProperty = 1,
            MyName = "Tom"
        };

        var props = new Sample().GetType().GetProperties();
        var sb = new StringBuilder();

        foreach (var prop in props)
        {
            sb.Append(prop.Name + Environment.NewLine);
            sb.Append(prop.GetValue(sample, null) + Environment.NewLine);
        }

        Console.WriteLine(sb.ToString());
        Console.ReadKey();

        // MyProperty
        // 1
        // MyName
        // Tom
    }
}
```

## Eaxmple オブジェクトの配列をCSVとして出力する

```cs

```


## Reference
- [リフレクション (C#)](https://learn.microsoft.com/ja-jp/dotnet/csharp/programming-guide/concepts/reflection)
- [Object.GetType メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.object.gettype?view=net-7.0)
- [Type.GetProperties メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.type.getproperties?view=net-7.0)
- [Type.GetProperty メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.type.getproperty?view=net-7.0)
- [PropertyInfo.GetValue メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.reflection.propertyinfo.getvalue?view=net-7.0)