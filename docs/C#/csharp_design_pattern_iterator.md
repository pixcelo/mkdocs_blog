---
tags:
  - C#
  - デザインパターン
---

# C# イテレーターパターン

デザインパターンの一つである、イテレーターパターンについて

## 概要

- Iterator（繰り返す）
- ふるまいに関するパターン
- 配列やコレクションなど、データの集合から要素を一つずつ取り出す

## 目的

コレクションに対して反復処理を行う

- Iterator、Aggregate（コレクションから取り出す
- Cursor
- Enumerator

foreach, IEnumerable, IEnumerator

C#のリストは、IEnumerableを実装する

var enumerator = SomeList.GetEnumerator();

while (enumerator.MoveNext())
{
  var item = enumerator.Current;

}

## Reference
- [IEnumerable<T> インターフェイス](https://learn.microsoft.com/ja-jp/dotnet/api/system.collections.generic.ienumerable-1?view=net-8.0)