---
tags:
  - C#
---

# C# Dictionaryのkey・valueが存在するかを調べる

C# ディクショナリーにキーや値が格納されているかを調べる方法です。

## ContainsKey・ContainsValue

* `ContainsKey`    `key`が存在するかを調べる
* `ContainsValue`  `value`が存在するかを調べる

## Usage
```cs
var dict = new Dictionary<int, string>
{
    { 1 , "cat" },
    { 2 , "dog" },
    { 3 , "rabbit" },
    { 4 , "pig" },
    { 5 , "bird" }
};

if (dict.ContainsKey(1))
{
    // keyが含まれている場合の処理
}

if (dict.ContainsValue("cat"))
{
    // valueが含まれている場合の処理
}
```

## Reference
[Dictionary<TKey,TValue>.IDictionary.Contains(Object) メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.collections.generic.dictionary-2.system-collections-idictionary-contains?view=net-7.0)<br>
