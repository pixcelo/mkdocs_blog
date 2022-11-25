---
tags:
  - C#
---

# C# フォルダの中を再起的に捜査する

## Usage

C#を使って、画像から緯度・経度を取得するサンプル

* `Directory.GetFiles` ディレクトリ内のファイル名 (パスを含む) を返す
* `Directory.GetDirectories` ディレクトリ内のサブディレクトリ名 (パスを含む) を返す

上位階層のディレクトリから、全ファイルに何らかの処理をする際に使用する

```cs
public void SearchFiles(string path)
{
    if (Directory.Exists(path))
    {
        string[] files = Directory.GetFiles(path);
        foreach (var filePath in files)
        {
            // Do something
        }

        string[] dirs = Directory.GetDirectories(path);
        foreach (var dirPath in dirs)
        {
            SearchFiles(dirPath);
        }
    }
}
```

## Reference
* [Directory.GetFiles メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.io.directory.getfiles?view=net-7.0)
* [Directory.GetDirectories メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.io.directory.getdirectories?view=net-7.0)
