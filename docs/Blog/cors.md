---
tags:
  - ブログ
  - .NET
---

# CORSとは

CORS（Cross-Origin Resource Sharing）は、Webブラウザがリソースを他のオリジン（ドメイン、プロトコル、ポートの組み合わせ）から安全にリクエストする方法を定義する仕組み

具体的には、あるウェブサイトが別のオリジンに存在するリソース（例えば、APIエンドポイント）にアクセスする際のセキュリティ制約を緩和するための手段である

## 基本概念
オリジン：オリジンとは、URLのスキーム（プロトコル）、ホスト（ドメイン）、およびポートの組み合わせを指す

例： https://example.com:8080

- 同一オリジンポリシー：ブラウザのセキュリティ機能で、異なるオリジン間でのリソースの共有を制限する
- 同一オリジンポリシーにより、スクリプトは自身がロードされたオリジンと同じオリジンのリソースにしかアクセスできない

異なるオリジンからのリクエストがあった場合、以下のようにエラーが発生する
```bash
localhost/:1  Access to fetch at 'https://localhost:7148/weatherforecast' from origin 'http://localhost:5173' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
```

## .NETでCORSをミドルウェア経由で有効にする
規定のポリシーによるミドルウェアのCORS有効化
```cs
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// CORSの有効化
builder.Services.AddCors(opsions =>
{
    opsions.AddDefaultPolicy(
        policy =>
        {
            policy.WithOrigins("http://localhost:5173");
        });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors();

app.UseAuthorization();

app.MapControllers();

app.Run();
```

ミドルウェアによって、CORSを追加する処理
```cs
// CORSの有効化
builder.Services.AddCors(opsions =>
{
    opsions.AddDefaultPolicy(
        policy =>
        {
            policy.WithOrigins("http://localhost:5173");
        });
});
```

`app.Run()`する前に、`app.UseCors()`を宣言する
```cs
app.UseCors();
```

## Reference
- [オリジン間リソース共有 (CORS)](https://developer.mozilla.org/ja/docs/Web/HTTP/CORS)
- [ASP.NET Core でクロスオリジン要求 (CORS) を有効にする](https://learn.microsoft.com/ja-jp/aspnet/core/security/cors?view=aspnetcore-8.0)