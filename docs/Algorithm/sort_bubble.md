# バブルソート (bubble sort)
隣接する値との比較を繰り返して並び替えるアルゴリズム

## 計算量
O(n^2) <br>
先頭から順次処理されるので遅い<br>
アルゴリズムとして直感的でわかりやすい<br>

## 実装
```C#
public void BubbleSort()
{
    var list = new List<int> { 30, 10, 40, 90, 70, 20, 80 };

    for (int i = list.Count - 1; i > 0; i--)
    {
        for (int j = 0; j < i; j++)
        {
            if (list[j] > list[j + 1])
            {
                int tmp = list[j + 1];
                list[j + 1] = list[j];
                list[j] = tmp;
            }
        }
    }
}
```

## ソースコード
[GitHub](https://github.com/pixcelo/Algorithm_csharp/blob/main/Algorithms/Service/SortService.cs)
