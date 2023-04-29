---
tags:
  - Linux
  - シェル
---

# Linuxのtreeで、ディレクトリの階層構造をツリー形式で表示する

- Linuxのtreeコマンドは、ディレクトリの階層構造をツリー形式で表示するコマンド
- 第二階層までに限定して出力するには、-Lオプションを使用する
- 以下のように、tree -L 2と入力することで、現在のディレクトリの直下のファイルとディレクトリ、およびそれらのサブディレクトリの中のファイルとディレクトリが表示される

## Usage

-Lオプションには表示する階層数を指定

```
$ tree -L 2
```

また、treeコマンドは、ファイルとディレクトリの階層構造をグラフィカルに表示することもできる

以下は、tree -L 2コマンドを実行した結果の例

```
$ tree -L 2
.
├── dir1
│   ├── file1
│   └── file2
├── dir2
│   ├── file3
│   └── file4
└── file5

3 directories, 5 files
```

## Reference
* [The Tree Command For Linux Homepage](http://mama.indstate.edu/users/ice/tree/)
