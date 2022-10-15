# シェルソート (shell sort)
飛び飛びの列を繰り返しソートして、配列を大まかに整列された状態に近づけていくアルゴリズム

## 計算量
O(n^1.25) ave<br>
分割・挿入法を用いる<br>
与えられたデータをブロックに分割して、それぞれのブロックに対して単純挿入法を行う<br>

## C#での実装
```C#
public void ShellSort()
{
    var list = new List<int>() { 10, 3, 1, 9, 7, 6, 8, 2, 4, 5 };

    for (int step = list.Count / 2; step > 0; step = step / 2)
    {
        int j;
        for (int i = step; i < list.Count; i++)
        {
            int tmp = list[i];
            for (j = i; j >= step; j -= step)
            {
                if (list[j - step] > tmp)
                {
                    list[j] = list[j - step];
                }
                else
                {
                    break;
                }
            }
            list[j] = tmp;
        }
    }

    list.ForEach(x => Console.Write($"{x} "));
    Console.ReadKey();
}
```

## ソースコード
[GitHub](https://github.com/pixcelo/Algorithm_csharp/blob/main/Algorithms/Service/SortService.cs)
