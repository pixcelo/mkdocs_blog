---
tags:
  - ブログ
  - リファクタリング
---

# リファクタリング

リファクタリングについてまとめ<br />
※随時更新

## リファクタリングとは
リファクタリングは、コードの振舞いを変えずに内部構造を最適化すること

## リファクタリングのコツ

- 小さく、管理しやすい単位で行う
- バージョン管理を行う
- リファクタリング用にブランチを切る
- リファクタリング前に計測を行う（パフォーマンス比較）
- リファクタリング前後にユニットテストで確認する
- リファクタリングは投資対効果が高い処理に行う（ボトルネック等、最適化の効果が最も高くなる処理）

## ボトルネック（リファクタリングの対象）になりやすい処理

- 大量のデータを扱っていて、スレッドやUIをブロックしている
- メインスレッドで複雑なコードを実行している
- 画像操作をしている
- ファイルシステムを扱っている
- データ分析をしている
- ネストされたループ

## リファクタリングの例
- 未使用のメソッドを削除する
- パフォーマンスを向上させる
- 計算を単純化する（4÷2 => 4x0.5にする等）
- 長く複雑なコードからメソッドを抽出する
- `Reflection`は重い

## リファクタリング時の計測
stopwatchクラス<br />
https://learn.microsoft.com/ja-jp/dotnet/api/system.diagnostics.stopwatch?view=net-8.0

```cs
using System;
using System.Diagnostics;
using System.Threading;

class Program
{
    static void Main(string[] args)
    {
        var sw = new Stopwatch();
        sw.Start();
        Thread.Sleep(10000);
        sw.Stop();
        
        TimeSpan ts = sw.Elapsed;
        
        string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
        Console.WriteLine("RunTime " + elapsedTime);
    }
}
```

## その他

リファクタリングを題材にしたポッドキャスト<br />
https://refactoradio.com/

## Reference
- [コードのリファクタリング](https://learn.microsoft.com/ja-jp/visualstudio/ide/refactoring-in-visual-studio?view=vs-2022)