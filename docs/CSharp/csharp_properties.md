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

以下の例では、`Sample`クラスのListをファイルに書き出してCSVとして保存している

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

    public static void Main()
    {
        var list = new List<Sample>();
        list.Add(new Sample { MyProperty = 1, MyName = "Tom" });
        list.Add(new Sample { MyProperty = 2, MyName = "Bob" });
        list.Add(new Sample { MyProperty = 3, MyName = "Jack" });

        string filePath = Path.Combine(Environment.CurrentDirectory, "sample.csv");
        WriteCsv(filePath, list);
    }

    private static void WriteCsv(string filePath, List<Sample> list)
    {
        using (var sw = new StreamWriter(filePath, false, Encoding.GetEncoding("UTF-8")))
        {
            var props = new Sample().GetType().GetProperties();
            var sb = new StringBuilder();

            // カラム書き込み
            foreach (var column in props)
            {
                sb.Append(column.Name);
                sb.Append(",");
            }
            sb.Length -= 1;
            sw.WriteLine(sb.ToString());
            sb.Clear();

            // データ書き込み
            foreach (var data in list)
            {
                foreach (var column in props)
                {
                    sb.Append(column.GetValue(data, null));
                    sb.Append(",");
                }
                sb.Length -= 1;
                sb.Append(Environment.NewLine);
            }
            sw.Write(sb.ToString());
        }
    }
}
```

出力結果

```csv
MyProperty,MyName
1,Tom
2,Bob
3,Jack
```


## Reference
- [リフレクション (C#)](https://learn.microsoft.com/ja-jp/dotnet/csharp/programming-guide/concepts/reflection)
- [Object.GetType メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.object.gettype?view=net-7.0)
- [Type.GetProperties メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.type.getproperties?view=net-7.0)
- [Type.GetProperty メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.type.getproperty?view=net-7.0)
- [PropertyInfo.GetValue メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.reflection.propertyinfo.getvalue?view=net-7.0)