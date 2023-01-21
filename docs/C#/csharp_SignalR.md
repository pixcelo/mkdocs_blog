---
tags:
  - C#
---

# C# SignalRによるリアルタイム通信

## Topic 

`SignalR`を使ってリアルタイム通信を行う

## OverView

`SignalR`とは、リアルタイムWeb機能を提供するライブラリ

- 複数のプラットフォームに対応
- サーバーとクライアント間のトランスポート方法を自動的に最適化
- OSS

### サーバー

- サーバーは、SignalR エンドポイントを公開する役割を担う
- エンドポイントは、Hub または Hub<T> サブクラスにマップされる
- クライアントから呼び出すことができるハブメソッドと、クライアントが購読できるイベントの両方を公開する (リモート プロシージャと見なされる)

### ハブ

- クライアントとサーバーの間の通信のために使用される
- クライアントとサーバーが相互にメソッドを呼び出すことができるようにする高レベルのパイプライン
- すべての接続済みクライアントとサーバーとの間のプロキシの役割

### プロトコル

- JSON に基づくテキスト プロトコル (既定)
- MessagePack に基づくバイナリ プロトコル (JSON より小さいメッセージを生成)

## Usage

visual studio でASP.NET Core Webアプリケーションのプロジェクト作成

ライブラリ マネージャー (LibMan) 


## Reference
- [ASP.NET Core の概要SignalR](https://learn.microsoft.com/ja-jp/aspnet/core/signalr/introduction?view=aspnetcore-7.0)
- [チュートリアル: ASP.NET Core SignalR の概要](https://learn.microsoft.com/ja-jp/aspnet/core/tutorials/signalr?view=aspnetcore-7.0&tabs=visual-studio)
- [nuget SignalR](https://www.nuget.org/packages/Microsoft.AspNetCore.SignalR)
- [GitHub SignalR](https://github.com/dotnet/AspNetCore/tree/main/src/SignalR)
- [LibMan を使用した ASP.NET Core でのクライアント側ライブラリの取得](https://learn.microsoft.com/ja-jp/aspnet/core/client-side/libman/?view=aspnetcore-7.0)