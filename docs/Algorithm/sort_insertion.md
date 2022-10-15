# 挿入ソート (insertion sort)
整列された配列に対して、追加要素を適切な場所に挿入することによって並び替えるアルゴリズム

## 計算量
O(n^2) <br>
小さな配列に対しては高速<br>
入力値が増えれば増えるほど遅い（バブルソートよりはマシ<br>

## C#での実装
```C#
public void InsertionSort()
{
    var list = new List<int>() { 7, 2, 6, 9, 5 };

    for (int i = 1; i < list.Count; i++)
    {
        int tmp = list[i];
        int j;

        for (j = i - 1; j >= 0; j--)
        {
            if (list[j] > tmp)
            {
                list[j + 1] = list[j];
            }
            else
            {
                break;
            }
        }
        list[j + 1] = tmp;
    }

    foreach (var item in list)
    {
        Console.WriteLine(item);
    }

    Console.ReadKey();
}
```

## ソースコード
[GitHub](https://github.com/pixcelo/Algorithm_csharp/blob/main/Algorithms/Service/SortService.cs)

## Reference
[VISUALGO](https://visualgo.net/en)
