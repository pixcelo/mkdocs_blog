---
tags:
  - C#
---

# C# Websocketでマーケットデータを購読する

## Topic

`WebSockets`クラスのメソッドを用いて、マーケットデータを受信する

## Usage

`ConnectAsync`でWebSocketハンドシェイクを開始する

```cs
using System.Net.WebSockets;
using System.Text;

namespace websocketApp;

class Program
{
    static async Task Main()
    {
        using (var ws = new ClientWebSocket())
        {
            string streamName = "bnbbtc@trade";
            Uri uri = new Uri($"wss://stream.binance.com:9443/ws/{streamName}");
            await ws.ConnectAsync(uri, CancellationToken.None);
            ArraySegment<byte> buf = new byte[1056];

            while (ws.State == WebSocketState.Open)
            {
                var result = await ws.ReceiveAsync(buf, CancellationToken.None);

                if (result.MessageType == WebSocketMessageType.Close)
                {
                    await ws.CloseAsync(WebSocketCloseStatus.NormalClosure, null, CancellationToken.None);
                    Console.WriteLine(result.CloseStatusDescription);
                }
                else
                {
                    string message = Encoding.ASCII.GetString(buf.Array, 0, result.Count);
                    Console.WriteLine(message);
                }
            }
        }
    }
}
```

実行結果

```json
{"e":"trade","E":1673987412974,"s":"BNBBTC","t":214194757,"p":"0.01418900","q":"0.10600000","b":1622759055,"a":1622759001,"T":1673987412974,"m":false,"M":true}
{"e":"trade","E":1673987413694,"s":"BNBBTC","t":214194758,"p":"0.01418800","q":"0.27300000","b":1622758997,"a":1622759056,"T":1673987413694,"m":true,"M":true}
{"e":"trade","E":1673987425104,"s":"BNBBTC","t":214194759,"p":"0.01418800","q":"0.09900000","b":1622758997,"a":1622759068,"T":1673987425103,"m":true,"M":true}
```

各プロパティの説明は以下を参照

```json
{
  "e": "trade",     // Event type
  "E": 123456789,   // Event time
  "s": "BNBBTC",    // Symbol
  "t": 12345,       // Trade ID
  "p": "0.001",     // Price
  "q": "100",       // Quantity
  "b": 88,          // Buyer order ID
  "a": 50,          // Seller order ID
  "T": 123456785,   // Trade time
  "m": true,        // Is the buyer the market maker?
  "M": true         // Ignore
}
```

## Reference
- [WebSocket クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.net.websockets.websocket?view=net-7.0)
- [ClientWebSocket.ConnectAsync メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.net.websockets.clientwebsocket.connectasync?source=recommendations&view=net-7.0)
- [WebSocket.ReceiveAsync メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.net.websockets.websocket.receiveasync?view=net-7.0)
- [websocket-market-streams](https://binance-docs.github.io/apidocs/spot/en/#websocket-market-streams)
- [aggregate-trade-streams](https://binance-docs.github.io/apidocs/spot/en/#aggregate-trade-streams)