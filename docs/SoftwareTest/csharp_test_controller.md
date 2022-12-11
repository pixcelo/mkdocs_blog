---
tags:
  - C#
  - ソフトウェアテスト
  - xUnit
---

# C# ASP.NET Core Controllerの単体テスト
xUnitの調査<br>
「ASP.NET Core でコントローラーのロジックの単体テストを行う」のチュートリアル

## サンプルプロジェクトをダウンロード
[リンク先](https://github.com/dotnet/AspNetCore.Docs/tree/main/aspnetcore/mvc/controllers/testing/samples/)から落とす

## テスト対象のコントローラ
`Task<IActionResult> Index`メソッドをテスト対象とする<br>
テスト対象は`_sessionRepository`（DIされたモック）のメソッドを実行する
```C#
public class HomeController : Controller
{
    private readonly IBrainstormSessionRepository _sessionRepository;

    // 依存関係の注入 (DI)
    public HomeController(IBrainstormSessionRepository sessionRepository)
    {
        _sessionRepository = sessionRepository;
    }

    public async Task<IActionResult> Index()
    {
        var sessionList = await _sessionRepository.ListAsync();

        var model = sessionList.Select(session => new StormSessionViewModel()
        {
            Id = session.Id,
            DateCreated = session.DateCreated,
            Name = session.Name,
            IdeaCount = session.Ideas.Count
        });

        return View(model);
    }

    public class NewSessionModel
    {
        [Required]
        public string SessionName { get; set; }
    }

    [HttpPost]
    public async Task<IActionResult> Index(NewSessionModel model)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }
        else
        {
            await _sessionRepository.AddAsync(new BrainstormSession()
            {
                DateCreated = DateTimeOffset.Now,
                Name = model.SessionName
            });
        }

        return RedirectToAction(actionName: nameof(Index));
    }
}
```

テストランナーの実行には`.NET SDK 3.0.100`が必要<br>
実行環境にSDKがインストールされていないと下記が表示される
```
Install the [3.0.100] .NET SDK or update [/Users/***/project/csharp/TestingControllersSample/tests/global.json] to match an installed SDK.
```

実行環境にインストールされているSDKをリストアップするコマンド
```
dotnet --list-sdks
```

SDKは[こちら](https://dotnet.microsoft.com/ja-jp/download/dotnet)からダウンロードする

## テストメソッド

`IBrainstormSessionRepository`のモックを生成

```C#
[Fact]
public async Task Index_ReturnsAViewResult_WithAListOfBrainstormSessions()
{
    // Arrange
    var mockRepo = new Mock<IBrainstormSessionRepository>();
    mockRepo.Setup(repo => repo.ListAsync())
        .ReturnsAsync(GetTestSessions());
    var controller = new HomeController(mockRepo.Object);

    // Act
    var result = await controller.Index();

    // Assert
    var viewResult = Assert.IsType<ViewResult>(result);
    var model = Assert.IsAssignableFrom<IEnumerable<StormSessionViewModel>>(
        viewResult.ViewData.Model);
    Assert.Equal(2, model.Count());
}
```


## テスト実行

```
dotnet test

Test run for /Users/***/project/csharp/TestingControllersSample/tests/TestingControllersSample.Tests/bin/Debug/netcoreapp3.0/TestingControllersSample.Tests.dll(.NETCoreApp,Version=v3.0)
Microsoft (R) Test Execution Command Line Tool Version 16.3.0
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...

A total of 1 test files matched the specified pattern.

Test Run Successful.
Total tests: 16
     Passed: 16
 Total time: 2.6566 Seconds
```


## Reference
[ASP.NET Core でコントローラーのロジックの単体テストを行う](https://github.com/dotnet/AspNetCore.Docs/tree/main/aspnetcore/mvc/controllers/testing/samples/)<br>
[dotnet/AspNetCore.Docs](https://github.com/dotnet/AspNetCore.Docs/tree/main/aspnetcore/mvc/controllers/testing/samples/)<br>
[.NETダウンロード](https://dotnet.microsoft.com/ja-jp/download/dotnet)<br>
[Moq](https://www.nuget.org/packages/Moq/)<br>
