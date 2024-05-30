---
tags:
  - C#
  - .NET
  - データベース
---

# .NET マイグレーションを使ってコードファーストにデータベースを管理する

マイグレーション機能を用いて、テーブルの作成・変更を行う

## 環境

- .NET8
- Windows10
- SQLServer

`.NET CLI `のバージョン
```bash
dotnet --version
8.0.204
```

## 下準備
必要なパッケージの追加
```bash
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
```

追加したいテーブルをクラスで定義
```cs
namespace WebAPI.Models
{
    public class Task
    {
        public int Id { get; set; }        
        public string? Title { get; set; }
        public string? Description { get; set; }
        public int? Priority { get; set; }
        public DateTime? DueDate { get; set; }
        public int? IsCompleted { get; set; }
        public int? ProjectId { get; set; }
    }
}
```

`DbContext`を定義し、作成したクラスを登録
```cs
using Microsoft.EntityFrameworkCore;

namespace WebAPI.Models
{
    public class TaskContext : DbContext
    {
        public TaskContext(DbContextOptions<TaskContext> options) : base(options) { }

        public DbSet<Task> Tasks { get; set; }
    }
}
```

`appsettings.json`にDB接続文字列を追加
```json title="appsettings.json"
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\MSSQLLocalDB;Database=taskDb;Trusted_Connection=True;"
  },
  "AllowedHosts": "*"
}
```

`Program.cs`にデータベースコンテキストのサービスを登録
```cs
using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// データベース設定
builder.Services.AddDbContext<TaskContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

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

## マイグレーションの実行
マイグレーションを実行する
```bash
$ dotnet ef migrations add InitialCreate
```

データベースを更新
```bash
$ dotnet ef database update
```

実行ログ
```bash
$ dotnet ef migrations add InitialCreate
Build started...
Build succeeded.

$ dotnet ef database update
Build started...
Build succeeded.
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (14ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      SELECT 1
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (12ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      SELECT OBJECT_ID(N'[__EFMigrationsHistory]');
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (1ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      SELECT 1
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (4ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      CREATE TABLE [__EFMigrationsHistory] (
          [MigrationId] nvarchar(150) NOT NULL,
          [ProductVersion] nvarchar(32) NOT NULL,
      );
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (0ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      SELECT 1
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (1ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      SELECT OBJECT_ID(N'[__EFMigrationsHistory]');
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      SELECT [MigrationId], [ProductVersion]
      FROM [__EFMigrationsHistory]
      ORDER BY [MigrationId];
info: Microsoft.EntityFrameworkCore.Migrations[20402]
      Applying migration '20240529180656_InitialCreate'.
Applying migration '20240529180656_InitialCreate'.
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (7ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      CREATE TABLE [Tasks] (
          [Id] int NOT NULL IDENTITY,
          [Title] nvarchar(max) NULL,
          [Description] nvarchar(max) NULL,
          [DueDate] datetime2 NULL,
          [IsCompleted] int NULL,
          [ProjectId] int NULL,
          CONSTRAINT [PK_Tasks] PRIMARY KEY ([Id])
      );
      Executed DbCommand (4ms) [Parameters=[], CommandType='Text', CommandTimeout='30']
      INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
      VALUES (N'20240529180656_InitialCreate', N'8.0.6');
Done.
```

ここまで実行すると、設定したインスタンスにマイグレーションで適用したテーブルが作成されている

```sql
SELECT * FROM sys.objects WHERE type = 'U';

-- name	object_id	principal_id	schema_id	parent_object_id	type	type_desc	create_date	modify_date	is_ms_shipped	is_published	is_schema_published
-- Tasks	613577224	NULL	1	0	U 	USER_TABLE	2024-05-30 03:07:16.057	2024-05-30 03:07:16.057	0	0	0
```


## Reference
- [移行の管理](https://learn.microsoft.com/ja-jp/ef/core/managing-schemas/migrations/managing?tabs=dotnet-core-cli)
- [データベースプロバイダー](https://learn.microsoft.com/ja-jp/ef/core/providers/?source=recommendations&tabs=dotnet-core-cli)