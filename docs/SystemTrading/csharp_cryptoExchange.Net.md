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

REST APIクライアントのインスタンスを作成
```cs
var binanceClient = new BinanceClient(new BinanceClientOptions()
{
    ApiCredentials = new ApiCredentials("API-KEY", "API-SECRET"),
    SpotApiOptions = new BinanceApiClientOptions
    {
        BaseAddress = "ADDRESS",
        RateLimitingBehaviour = RateLimitingBehaviour.Fail
    },
    UsdFuturesApiOptions = new BinanceApiClientOptions
    {
        ApiCredentials = new ApiCredentials("OTHER-API-KEY-FOR-FUTURES", "OTHER-API-SECRET-FOR-FUTURES")
    }
});
```
クライアントのインスタンスから、保持するエンドポイントやオプションを確認できる

![binanceClient](img/binacen.net_client.png)


市場データを入手する
```cs
var spotSymbolData = await binanceClient.SpotApi.ExchangeData.GetExchangeInfoAsync();
```

`CryptoExchange.Net`の[Document](https://jkorf.github.io/CryptoExchange.Net/Clients.html#processing-request-responses)にあるように、API通信のレスポンスは``

## Reference
* [Binance.Net nuget](https://www.nuget.org/packages/Binance.Net)
* [Binance.Net github](https://github.com/JKorf/Binance.Net)
* [Binance.Net Document](https://jkorf.github.io/Binance.Net/)
* [CryptoExchange.Net Document](https://jkorf.github.io/CryptoExchange.Net/)
