---
tags:
  - C#
---

# C# webSoketsで双方向通信を行う

## Topic 

- C#のwebSocketクラスでリアルタイムに通信する
- チュートリアルに沿って動かしてみる

## Environment

開発環境
- Visual Studio Code
- MacOS Ventura 13.1
- .NET 6

## Usage

###  プロジェクト作成
```
dotnet new console
```

### Server.cs作成

- WebSocketはTCPプロトコルにて接続を行う
- `TcpListener`はTCPネットワーク クライアントからの接続をリッスンするクラス

```cs
using System.Net.Sockets;
using System.Net;

class Server
{
    public static void Main()
    {
        var server = new TcpListener(IPAddress.Parse("127.0.0.1"), 13000);

        server.Start();
        Console.WriteLine(
            "Server has started on 127.0.0.1:80.{0}Waiting for a connection...",
            Environment.NewLine);

        TcpClient client = server.AcceptTcpClient();

        Console.WriteLine("A client connected.");
    }
}
```

`Program.cs`は不要なので削除

この状態で`dotnet run`で実行すると例外が発生した

```
Unhandled exception. System.Net.Sockets.SocketException (13): Permission denied
   at System.Net.Sockets.Socket.DoBind(EndPoint endPointSnapshot, SocketAddress socketAddress)
   at System.Net.Sockets.Socket.Bind(EndPoint localEP)
   at System.Net.Sockets.TcpListener.Start(Int32 backlog)
   at Server.Main() in /Users/***/project/csharp/ExampleWebsocket/Server.cs:line 11
```

`server.Start()`で落ちてる

`Permission denied`とあるので、ポート番号を変えて再トライ

```
Server has started on 127.0.0.1:13000.
Waiting for a connection...
```

サーバーが起動できた


## Reference
- [C# で WebSocket サーバーを記述する](https://developer.mozilla.org/ja/docs/Web/API/WebSockets_API/Writing_WebSocket_server)
- [TcpListener クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.net.sockets.tcplistener?view=net-7.0)