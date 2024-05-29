---
tags:
  - C#
---

# C# プログラムのパフォーマンスを計測する
パフォーマンスチューニングのためには、まず現状を把握することが必要となる

計測するためには`Stopwatch`クラスが標準で用意されている

## Usage

`Stopwatch`クラスのインスタンスを呼び、計測したい処理の前後で`Start()`と`Stop()`でサンドイッチする

```cs
using System.Diagnostics;

var stopWatch = new Stopwatch();

stopWatch.Start();
Thread.Sleep(10000); // 計測したい処理に置き換える
stopWatch.Stop();

TimeSpan ts = stopWatch.Elapsed;

string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);

Console.WriteLine("RunTime " + elapsedTime); // RunTime 00:00:10.00
```

## Reference
* [Stopwatch クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.diagnostics.stopwatch?view=net-7.0)
* [Stopwatch.Elapsed プロパティ](https://learn.microsoft.com/ja-jp/dotnet/api/system.diagnostics.stopwatch.elapsed?source=recommendations&view=net-7.0)
