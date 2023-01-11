---
tags:
  - ブログ
  - ネットワーク
---

# WebSocket（ウェブソケット）とは

## Topic

WebSocket（ウェブソケット）について調べた

## Overview
- 双方向通信を可能にする通信プロトコル
- リアルタイムに情報を取得する
- 通信はGETメソッドで始まる
- クライアントとサーバ間でハンドシェイクをして接続が確立する
- `ws:`、`wss:`

http通信だと実現できない
- クライアントからしかリクエストできない
- 1つのコネクションで1つのリクエストしか送れない
- 通信効率が悪い

## 通信の流れ

1. ハンドシェイク
 クライアントからupgradeヘッダーを含むGETリクエストを送る
 upgradeはプロトコルの変更を行う（http -> WebSocket)

## ライブラリ
Python
- [websockets](https://websockets.readthedocs.io/en/stable/index.html#)

## Reference
- [WebSockets Standard](https://websockets.spec.whatwg.org/)
- [WebSocket Protocol 翻訳](https://triple-underscore.github.io/RFC6455-ja.html)
- [WebSocket API (WebSockets) MDN](https://developer.mozilla.org/ja/docs/Web/API/WebSockets_API)
- [The WebSocket Protocol](https://datatracker.ietf.org/doc/html/rfc6455)