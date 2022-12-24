---
tags:
  - C#
---

# C# 浮動小数点数値型 decimalの既定値と値の比較

各浮動小数点型の既定値はゼロ`0`

高精度の小数点による計算が求められる場合に`decimal`型が推奨される

逆に精度よりパフォーマンスを重視する場合は`double`を用いる

## Usage
`GetValueOrDefault`（nullであれば既定値を返す）で`0`を返す

```cs
// 既定値
decimal? a = null;

Console.WriteLine(a.GetValueOrDefault()); // 0
```

`m` or `M` のサフィックスを付与することで`Decimal`型を指定できる

```cs
// 実数リテラルのサフィックス
var a = 1m;
var b = 2M;

Console.WriteLine(a.GetType()); // System.Decimal
Console.WriteLine(b.GetType()); // System.Decimal
```

`Decimal`

## Reference
* [浮動小数点数値型 (C# リファレンス)](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types)
* [Decimal 構造体](https://learn.microsoft.com/ja-jp/dotnet/api/system.decimal?view=net-7.0)
* [組み込みの数値変換 (C# リファレンス)](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/builtin-types/numeric-conversions)
* [型テスト演算子とキャスト式 - is、as、typeof、casts型テスト演算子とキャスト式 - is、as、typeof、casts](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/operators/type-testing-and-cast#cast-expression)
