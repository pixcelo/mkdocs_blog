---
tags:
  - C#
---

# C# json シリアル化と逆シリアル化
C#でも他言語と同様に、jsonとオブジェクトを相互変換するためのメソッドが用意されている<br>

## System.Text.Json

`Newtonsoft.Json`と`System.Text.Json`

## Usage
### シリアル化（シリアライズ）
C#オブジェクトをjsonに変換
```C#
string jsonString = JsonSerializer.Serialize(person);
File.WriteAllText("sample.json", jsonString);
```

### 逆シリアル化（デシリアライズ）
- 事前に変換先のC#オブジェクトを用意
- jsonとオブジェクトのプロパティ名を一致させる必要がある
```C#
public class Person
{
    public string Name { get; set; }
    public int Age { get; set; }
}
```

```json
{
  "Name": "Tom",
  "Age": 21
}
```

jsonファイルを読み込み、C#オブジェクトに変換<br>
```C#
using System.Text.Json;

namespace Sample
{
  class Program
  {
    string filePath = "../sample/sample.json";
    string? json = File.ReadAllText(filePath);
    var person = JsonSerializer.Deserialize<Person>(json);
  }
}
```

## Reference
[シリアル化 (C#)](https://learn.microsoft.com/ja-jp/dotnet/csharp/programming-guide/concepts/serialization/)<br>
[.NET 内で JSON のシリアル化と逆シリアル化 (マーシャリングとマーシャリングの解除) を行う方法](https://learn.microsoft.com/ja-jp/dotnet/standard/serialization/system-text-json/how-to?pivots=dotnet-7-0)<br>
[System.Text.Json でプロパティの名前と値をカスタマイズする方法](https://learn.microsoft.com/ja-jp/dotnet/standard/serialization/system-text-json/customize-properties?pivots=dotnet-7-0#use-camel-case-for-all-json-property-names)<br>
[System.Text.Json で文字エンコードをカスタマイズする方法](https://learn.microsoft.com/ja-jp/dotnet/standard/serialization/system-text-json/character-encoding)
[Newtonsoft.Json と System.Text.Json を比較して、System.Text.Json に移行する](https://learn.microsoft.com/ja-jp/dotnet/standard/serialization/system-text-json/migrate-from-newtonsoft?pivots=dotnet-7-0)<br>
