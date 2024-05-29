---
tags:
  - C#
  - 正規表現
---

# C#で文字列の中から一部分を取り出す

## String.Substring

`Substring(開始位置, 文字数)`

文字列から部分文字列を取得<br>
この部分文字列は、指定した文字位置から開始し、指定した文字数の文字列<br>

### Usage 1
```C#
string str = "123456789";

str.Susbstring(0, 3);
// 123
```

第2引数の文字数を省略すると、「指定した開始位置から末尾までの全ての文字列」が取得できる

```C#
string str = "123456789";

str.Susbstring(2);
// 3456789
```

文字列の長さと組み合わせることで「後ろから○文字を取得する」ことも可

### Usage 2
```cs
string str = "123456789";
int strIndex = str.Length - 3;

string result = str.Substring(strIndex);
// 789
```
[オンラインエディタ](https://paiza.io/ja/projects/new?language=csharp)等を使用して確認すると理解しやすく、実装も容易となる

### 正規表現と組み合わせる

正規表現で出現位置を指定して、`Substring`で切り出す
```cs
public string RemoveHouseNumber(string address)
{
    Match match = Regex.Match(address, @"\d");

    if (match.Value == "")
    {
        return address;
    }

    return string.IsNullOrEmpty(address)
           ? string.Empty
           : address.Substring(0, address.IndexOf(match.Value));
}
```

## Reference
[String.Substring メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.string.substring?view=net-7.0)
[String.IndexOf メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.string.indexof?view=net-7.0)<br>
