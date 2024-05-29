---
tags:
  - C#
  - ASP.NET
  - Error
---

# C# error: 要求の長さの最大値を超えました【ASP.NET】

## Topic

- Errorの解決方法
- 大容量ファイルをアップロードした場合に発生するエラー

## 解決方法

このエラーは、ASP.NETが受け入れる最大要求長を超えたために発生する<br />
ASP.NETには、リクエストの最大サイズを制限するための設定がある

このエラーが発生すると、ASP.NETはリクエストを中止し、エラーメッセージを表示する

このエラーを修正するには、Web.configファイルのsystem.webセクションで、maxRequestLength属性を設定する必要がある<br />
この属性は、KB単位でリクエストの最大サイズを指定する

たとえば、`web.config`を次のように設定する

```web.config
<system.web>
   <httpRuntime maxRequestLength="10240" />
</system.web>
```

この例では、最大リクエストサイズは10MBに設定している<br />
適切な値は、アプリケーションが処理できる最大のリクエストサイズに基づいて決定する必要がある

## Reference
- [ASP.NET Web リソース 一覧](https://learn.microsoft.com/ja-jp/aspnet/web-pages/)