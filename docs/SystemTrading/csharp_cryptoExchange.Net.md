---
tags:
  - C#
---

# C# CryptoExchange.Netライブラリで仮想通貨を自動売買する

nugetで公開されている`CryptoExchange.Net`の使い方をまとめる

`CryptoExchange.Net`をベースとした`Binance.Net`を使ってAPI通信を行うことをゴールとする

APIキーは[Binance API Management](https://www.binance.com/en/my/settings/api-management)の管理画面から取得しておく

## Usage
nugetからインストール
```
dotnet add package Binance.Net --version 8.3.0
```

REST APIクライアントのインスタンスを作成する
```cs
// APIクライアント（現物取引）
var client = new BinanceClient();
var tickersResult = client.SpotApi.ExchangeData.GetTickersAsync();

//
```



## Reference
* [Binance.Net nuget](https://www.nuget.org/packages/Binance.Net)
* [Binance.Net github](https://github.com/JKorf/Binance.Net)
* [Binance.Net Document](https://jkorf.github.io/Binance.Net/)
* [CryptoExchange.Net Document](https://jkorf.github.io/CryptoExchange.Net/)
