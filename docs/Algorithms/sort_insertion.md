# 挿入ソート
挿入ソートは、整列された配列に対して
追加要素を適切な場所に挿入することによって並び替えるアルゴリズム

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
