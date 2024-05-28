---
tags:
  - C#
  - Blazor
---

# C# BlazorでのWebアプリケーション開発

Blazorは、C#でクライアントサイド・サーバーサイドの両方を開発できるフレームワーク<br />
Razor構文が利用可能

- クライアントサイド：Blazor WebAssembly
- サーバーサイド：Blazor Server
- マルチプラットフォーム：Blazor MAUI

## Blazorのメリット

- C#でクライアントサイドを開発できる
- .NETライブラリを活用できる
- JavaScriptを呼び出すことも可能（逆にJavaScriptからC#の呼び出しも可）
- SAP（シングルページアプリケーション）を開発できる

## Blazor WebAssembly

WebAssembly（ウェブアセンブリ、略称Wasm）は、Webブラウザ上でネイティブ言語と同等の高速実行を実現する技術<br />
C#でWasmの開発を行うことができる<br />
クライアントだけで完結するアプリならオフラインでも動かせる

## Blazor Server

C#を用いたサーバーサイド開発<br />
SignalR（シグナルアール）によるWebsocket通信を利用する（双方向通信が可能）

## Reference
- [ASP.NET Core Blazor の基礎](https://learn.microsoft.com/ja-jp/aspnet/core/blazor/fundamentals/?view=aspnetcore-8.0)