---
tags:
  - C#
---

# C# .NET6 ロギング

.NET 6では、組み込みのロギング機能を利用してロギングを実装することが推奨されてる<br>
以下に、ベストプラクティスに沿ったロギングの実装方法を示す

## Install

プロジェクトに`Microsoft.Extensions.Logging`パッケージを追加
`Microsoft.Extensions.Logging.Console`パッケージを追加
```
dotnet add package Microsoft.Extensions.Logging
dotnet add package Microsoft.Extensions.Logging.Console
```

## Usage

- ロギングを行うクラスで、ILogger<T>インターフェースのインスタンスを取得
- Tは、ロギングを行うクラスの型

```cs
using Microsoft.Extensions.Logging;

public class MyClass
{
    private readonly ILogger<MyClass> _logger;

    public MyClass(ILogger<MyClass> logger)
    {
        _logger = logger;
    }
}
```

- ロガーを使って、ログメッセージを記録する
- LogInformation、LogWarning、LogErrorなどのメソッドを使用して、適切なログレベルでメッセージを記録できる

```cs
public void MyMethod()
{
    _logger.LogInformation("MyMethodが実行されました。");

    try
    {
        // Do something
    }
    catch (Exception ex)
    {
        _logger.LogError(ex, "MyMethodでエラーが発生しました。");
    }
}
```

- プログラムのエントリーポイントで、ILoggerFactoryを構成して、ロガーの設定を行う
- AddConsoleやAddFileなどのメソッドを使って、ログの出力先を設定できる

```cs
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Console;

public static class Program
{
    public static void Main(string[] args)
    {
        using var loggerFactory = LoggerFactory.Create(builder =>
        {
            builder
                .SetMinimumLevel(LogLevel.Information) // ログレベルの設定
                .AddConsole(); // コンソールへのログ出力
        });

        var logger = loggerFactory.CreateLogger<Program>();
        logger.LogInformation("アプリケーションが起動しました。");

        // 他のクラスのインスタンスを作成し、ロガーを渡す
        var myClass = new MyClass(loggerFactory.CreateLogger<MyClass>());
        myClass.MyMethod();

        logger.LogInformation("アプリケーションが終了しました。");
    }
}
```

## Reference
- [C# と .NET でのログ記録](https://learn.microsoft.com/ja-jp/dotnet/core/extensions/logging?tabs=command-line)  
- [.NET Core および ASP.NET Core でのログ記録](https://learn.microsoft.com/ja-jp/aspnet/core/fundamentals/logging/?view=aspnetcore-6.0)