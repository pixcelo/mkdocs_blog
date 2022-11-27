---
tags:
  - C#
---

# C# 単純移動平均を計算する

C# でSMA `Simple Moving Average`を計算する

## 移動平均とは

移動平均とは時系列データを平滑化するための手法

単純移動平均は、n個の期間の平均を出す

e.g.<br>
20日間移動平均の配列を作る場合、20日間ごとの平均の配列を作れば良い

## Usage

翌日の単純移動平均を求めるには、

「新たな終値を加え、一番古い終値を除く」

という操作を繰り返す

キュー構造を用いてこれを実装する

```

```

![]()

## Reference
* [Queue<T> クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.collections.generic.queue-1?view=net-7.0)
