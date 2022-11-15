---
tags:
  - C#
---

# C#で読み込んだCSVファイルを変数に格納する

## StreamReader
 `StreamReader`のインスタンスを使用して、ファイルからテキストを読み取る

## Usage
```C#
public List<string> GetCsvData()
{
    string filePath = @"/Users/***/Projects/samples/csv/kinki.csv";
    var csvlist = new List<string>();

    var reader = new StreamReader(filePath);
    {
        while (!reader.EndOfStream)
        {
            string line = reader.ReadLine();
            string[] values = line.Split(",");

            csvlist.AddRange(values);
        }
    }
    return csvlist;
}
```

## Reference
[StreamReader クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.io.streamreader?view=net-7.0&viewFallbackFrom=net-5.0%3Atitle)<br>
[List<T>.AddRange(IEnumerable<T>) メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.collections.generic.list-1.addrange?view=net-7.0)<br>
