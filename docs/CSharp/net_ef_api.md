---
tags:
  - C#
  - .NET
  - API
---

# Web API for .NET

## HTTP 動詞


| Action | Method      | Success          | Failure           | 
| ------ | ----------- | ---------------- | ----------------- | 
| Create | POST        | 201 (Created)    | 400 (Bad Request) | 
| Read   | GET         | 200 (OK)         | 404 (Not Found)   | 
| Update | PUT / PATCH | 204 (No Content) | 404 (Not Found)   | 
| Delete | DELETE      | 204 (No Content) | 400 (Bad Request) | 

## ルーティング

https://example.com/v1.0/me

- https: →　スキーマ
- example.com → ホスト名
- v1.0/me → パス


## YouTube
- [Web APIs for Beginners](https://www.youtube.com/playlist?list=PLdo4fOcmZ0oVjOKgzsWqdFVvzGL2_d72v)

## Reference
- [HTTP のリソースと仕様書](https://developer.mozilla.org/ja/docs/Web/HTTP/Resources_and_specifications)
- [ASP.NET Core を使用した Web API](https://dotnet.microsoft.com/ja-jp/apps/aspnet/apis)
- [ASP.NET Web API 2 での属性ルーティング](https://learn.microsoft.com/ja-jp/aspnet/web-api/overview/web-api-routing-and-actions/attribute-routing-in-web-api-2#prefixes)


Web API のテストに使えるサイト？
- [math.js](https://mathjs.org/)