---
tags:
  - C#
---

# C# Dictionary キー文字列の大文字・小文字の区別

デフォルトでは大文字と小文字は区別される<br>
大文字と小文字を区別するには、`StringComparer`クラスの[プロパティ](https://learn.microsoft.com/ja-jp/dotnet/api/system.stringcomparer?view=net-7.0#properties)をオプションを指定する

## Usage
デフォルトのDictionaryと`OrdinalIgnoreCase`を指定したDictionaryを検証
```C#
// 正常に動作する
var dict = new Dictionary<string, string>()
{
    {"A", "1"},
    {"a", "2"},
};

// A と a が同じキーとして扱われエラーが発生する
var dict_ignore = new Dictionary<string, string>
(StringComparer.OrdinalIgnoreCase)
{
    {"A", "1"},
    {"a", "2"},
};
```
`StringComparer.OrdinalIgnoreCase`を指定した場合、下記エラーとなる

```
Unhandled exception. System.ArgumentException: An item with the same key has already been added. Key: a
```

## Reference
[Dictionary<TKey,TValue> クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.collections.generic.dictionary-2?view=net-6.0)<br>
[Dictionary<TKey,TValue>(IEqualityComparer<TKey>)](https://learn.microsoft.com/ja-jp/dotnet/api/system.collections.generic.dictionary-2.-ctor?view=net-6.0#system-collections-generic-dictionary-2-ctor(system-collections-generic-iequalitycomparer((-0))))<br>
[StringComparer クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.stringcomparer?view=net-6.0)<br>
