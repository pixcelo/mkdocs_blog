---
tags:
  - Windows
  - シェル
---

# Windows コマンドプロンプト ポートを開放する
Windowsのコマンドプロンプトや、`PowerShell`でポートを開放する方法

## netstat
`netstat`は、ネットワークの接続状態を確認するコマンド

## Usage

ポート番号`54482`を解放する場合はパイプで`findstr`を用いて指定する

```
netstat -ano | findstr 54482
```

ポート番号に設定されているPID(プロセスID)の一覧が表示される

```
TCP         127.0.0.1:54482        0.0.0.0:0              LISTENING       11436
TCP         [::1]:54482            [::]:0                 LISTENING       11436
```

PIDを指定して、`taskkill`コマンドで開放する

```
taskkill /F /PID 11436
```

## Reference
* [Windows のコマンド](https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/windows-commands)
* [netstat](https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/netstat)
* [findstr](https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/findstr)
* [taskkill](https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/taskkill)
