---
tags:
  - Windows
  - シェル
---

# Windows コマンドプロンプト ファイル名を変更する
Windowsのコマンドプロンプトや、`PowerShell`でファイル名を変更する

## ren

`ren`は、ファイル名を変更するコマンド

`rename`コマンドも同様

## Usage

ファイル名`aaa.txt`から`bbb.txt`へを変更する

```
ren aaa.txt bbb.txt
```

フォルダ名を`chap10`から`part10`へを変更する

```
ren chap10 part10
```

ワイルドカードで一括変更する

```
ren *.png *.jpg
```

## Reference
* [Windows のコマンド](https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/windows-commands)
* [ren](https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/ren)
