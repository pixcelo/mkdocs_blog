# コマンドプロンプトでポートを開放する
Windowsのコマンドプロンプトや、Windows PoerShellを使ってポートを開放する方法

## netstat
`netstat`は、ネットワークの接続状態を確認するコマンド

## Usage
例えば、ポート番号54482を解放する場合はパイプで`findstr`を用いて指定する
```
netstat -ano | findstr 54882
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
