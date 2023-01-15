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

### サーバーを作成

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

## クライアントを作成

TCP接続するクライアントを作成

```html

```

```
Server has started on 127.0.0.1:13000, Waiting for a connection...
A client connected.
=====Handshaking from client=====
GET / HTTP/1.1
Host: 127.0.0.1:13000
Connection: Upgrade
Pragma: no-cache
Cache-Control: no-cache
Upgrade: websocket
Origin: null
Sec-WebSocket-Version: 13
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36
Accept-Encoding: gzip, deflate, br
Accept-Language: ja,en;q=0.9
Sec-GPC: 1
Sec-WebSocket-Key: LQIinwK+MLKnnnTo0PfZMw==
Sec-WebSocket-Extensions: permessage-deflate; client_max_window_bits


WebSocket rocks

test message
```

## Reference
- [C# で WebSocket サーバーを記述する](https://developer.mozilla.org/ja/docs/Web/API/WebSockets_API/Writing_WebSocket_server)
- [TcpListener クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.net.sockets.tcplistener?view=net-7.0)
- [TcpClient クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.net.sockets.tcpclient?view=net-7.0)