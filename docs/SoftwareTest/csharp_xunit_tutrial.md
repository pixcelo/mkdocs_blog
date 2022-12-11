---
tags:
  - C#
  - ソフトウェアテスト
  - xUnit
---

# xUnit チュートリアル

xUnit調査<br>
チュートリアルをやってみる

## プロジェクト作成
テスト対象のソリューションファイルを作成する
```
dotnet new sln -o unit-testing-using-dotnet-test
cd unit-testing-using-dotnet-test
dotnet new classlib -o PrimeService
```

## クラス作成
テスト対象のクラスを作成
```C#
using System;

namespace Prime.Services
{
    public class PrimeService
    {
        public bool IsPrime(int candidate)
        {
            throw new NotImplementedException("Not implemented.");
        }
    }
}
```

## テストプロジェクト作成
```
cd unit-testing-using-dotnet-test

dotnet sln add ./PrimeService/PrimeService.csproj
dotnet new xunit -o PrimeService.Tests
```

ソリューションファイルにテストプロジェクトを追加
```
dotnet sln add ./PrimeService.Tests/PrimeService.Tests.csproj
```

PrimeService.Tests プロジェクトへの依存関係として PrimeService クラス ライブラリを追加
```
dotnet add ./PrimeService.Tests/PrimeService.Tests.csproj reference ./PrimeService/PrimeService.csproj
```

この時点での`PrimeService.Tests.csproj`<br>
テスト対象となるプロジェクトが`ProjectReference`に登録されている状態
```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net6.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>

    <IsPackable>false</IsPackable>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.1.0" />
    <PackageReference Include="xunit" Version="2.4.1" />
    <PackageReference Include="xunit.runner.visualstudio" Version="2.4.3">
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
      <PrivateAssets>all</PrivateAssets>
    </PackageReference>
    <PackageReference Include="coverlet.collector" Version="3.1.2">
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
      <PrivateAssets>all</PrivateAssets>
    </PackageReference>
  </ItemGroup>

  <ItemGroup>
    <ProjectReference Include="..\PrimeService\PrimeService.csproj" />
  </ItemGroup>

</Project>
```

## テストの作成
テスト駆動開発（TDD）のアプローチ<br>
失敗することがわかっているテストを記述する<br><br>

不要なファイルを削除
```
rm PrimeService.Tests/UnitTest1.cs
```

`PrimeService.Tests/PrimeService_IsPrimeShould.cs`を作成
```c#
using Xunit;
using Prime.Services;

namespace Prime.UnitTests.Services
{
    public class PrimeService_IsPrimeShould
    {
        [Fact]
        public void IsPrime_InputIs1_ReturnFalse()
        {
            var primeService = new PrimeService();
            bool result = primeService.IsPrime(1);

            Assert.False(result, "1 should not be prime");
        }
    }
}
```
`[Fact]` 属性でテストランナーによって実行されるテストメソッドを宣言<br>
`PrimeService.Tests`で`dotnet test`コマンドでテストランナーを起動する
```
cd PrimeService.Tests
dotnet test
```

テストが失敗する
```
  Determining projects to restore...
  Restored /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/PrimeService.Tests.csproj (in 726 ms).
  1 of 2 projects are up-to-date for restore.
  PrimeService -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService/bin/Debug/net6.0/PrimeService.dll
  PrimeService.Tests -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll
Test run for /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (.NETCoreApp,Version=v6.0)
Microsoft (R) Test Execution Command Line Tool Version 17.3.1 (x64)
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.60]     Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_InputIs1_ReturnFalse [FAIL]
  Failed Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_InputIs1_ReturnFalse [2 ms]
  Error Message:
   System.NotImplementedException : Not implemented.
  Stack Trace:
     at Prime.Services.PrimeService.IsPrime(Int32 candidate) in /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService/PrimeService.cs:line 9
   at Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_InputIs1_ReturnFalse() in /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/PrimeService_IsPrimeShould.cs:line 12

Failed!  - Failed:     1, Passed:     0, Skipped:     0, Total:     1, Duration: < 1 ms - /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (net6.0)
```

テストが合格するように`PrimeService/PrimeService.cs`の`IsPrime`メソッドを更新
```C#
public bool IsPrime(int candidate)
{
    if (candidate == 1)
    {
        return false;
    }
    throw new NotImplementedException("Not fully implemented.");
}
```

テストを実行し、テストが成功したことを確認
```
dotnet test

  Determining projects to restore...
  All projects are up-to-date for restore.
  PrimeService -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService/bin/Debug/net6.0/PrimeService.dll
  PrimeService.Tests -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll
Test run for /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (.NETCoreApp,Version=v6.0)
Microsoft (R) Test Execution Command Line Tool Version 17.3.1 (x64)
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
A total of 1 test files matched the specified pattern.

Passed!  - Failed:     0, Passed:     1, Skipped:     0, Total:     1, Duration: < 1 ms - /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (net6.0)
```

### 同じコードで違うパラメータをテストする
`IsPrime_InputIs1_ReturnFalse`を書き換える<br>
[Theory] 属性で同じコードで「異なる入力引数が含まれる一連のテスト」の実行を表す<br>
[InlineData] 属性で入力値を指定<br>
```C#
[Theory]
[InlineData(-1)]
[InlineData(0)]
[InlineData(1)]
public void IsPrime_ValuesLessThan2_ReturnFalse(int value)
{
    var result = _primeService.IsPrime(value);

    Assert.False(result, $"{value} should not be prime");
}
```

`PrimeService_IsPrimeShould`を更新
```C#
public class PrimeService_IsPrimeShould
{
    private readonly PrimeService _primeService;

    public PrimeService_IsPrimeShould()
    {
        _primeService = new PrimeService();
    }

    [Theory]
    [InlineData(-1)]
    [InlineData(0)]
    [InlineData(1)]
    public void IsPrime_ValuesLessThan2_ReturnFalse(int value)
    {
        var result = _primeService.IsPrime(value);

        Assert.False(result, $"{value} should not be prime");
    }
}
```

テストを実行して、失敗することを確認
```
dotnet test
  Determining projects to restore...
  All projects are up-to-date for restore.
  PrimeService -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService/bin/Debug/net6.0/PrimeService.dll
  PrimeService.Tests -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll
Test run for /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (.NETCoreApp,Version=v6.0)
Microsoft (R) Test Execution Command Line Tool Version 17.3.1 (x64)
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.67]     Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_ValuesLessThan2_ReturnFalse(value: 0) [FAIL]
[xUnit.net 00:00:00.67]     Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_ValuesLessThan2_ReturnFalse(value: -1) [FAIL]
  Failed Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_ValuesLessThan2_ReturnFalse(value: 0) [< 1 ms]
  Error Message:
   System.NotImplementedException : Not fully implemented.
  Stack Trace:
     at Prime.Services.PrimeService.IsPrime(Int32 candidate) in /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService/PrimeService.cs:line 13
   at Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_ValuesLessThan2_ReturnFalse(Int32 value) in /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/PrimeService_IsPrimeShould.cs:line 21
  Failed Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_ValuesLessThan2_ReturnFalse(value: -1) [< 1 ms]
  Error Message:
   System.NotImplementedException : Not fully implemented.
  Stack Trace:
     at Prime.Services.PrimeService.IsPrime(Int32 candidate) in /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService/PrimeService.cs:line 13
   at Prime.UnitTests.Services.PrimeService_IsPrimeShould.IsPrime_ValuesLessThan2_ReturnFalse(Int32 value) in /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/PrimeService_IsPrimeShould.cs:line 21

Failed!  - Failed:     2, Passed:     1, Skipped:     0, Total:     3, Duration: 25 ms - /Users/tetsu/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (net6.0)
```

テストが合格するように`PrimeService/PrimeService.cs`の`IsPrime`メソッドを更新
```C#
public bool IsPrime(int candidate)
{
    if (candidate < 2)
    {
        return false;
    }
    throw new NotImplementedException("Not fully implemented.");
}
```

テストランナーを実行して、テストの合格を確認
```
dotnet test

  Determining projects to restore...
  All projects are up-to-date for restore.
  PrimeService -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService/bin/Debug/net6.0/PrimeService.dll
  PrimeService.Tests -> /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll
Test run for /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (.NETCoreApp,Version=v6.0)
Microsoft (R) Test Execution Command Line Tool Version 17.3.1 (x64)
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
A total of 1 test files matched the specified pattern.

Passed!  - Failed:     0, Passed:     3, Skipped:     0, Total:     3, Duration: 4 ms - /Users/***/project/csharp/dotnet_core_xunit/unit-testing-using-dotnet-test/PrimeService.Tests/bin/Debug/net6.0/PrimeService.Tests.dll (net6.0)
```

## Reference

[dotnet テストと xUnit を使用した .NET Core での単体テスト C#](https://learn.microsoft.com/ja-jp/dotnet/core/testing/unit-testing-with-dotnet-test)<br>
[dotnet add reference](https://learn.microsoft.com/ja-jp/dotnet/core/tools/dotnet-add-reference)<br>
[dotnet test](https://learn.microsoft.com/ja-jp/dotnet/core/tools/dotnet-test)<br>
[xUnit](https://xunit.net/)<br>
[dotnet/sample](https://github.com/dotnet/samples/blob/main/core/getting-started/unit-testing-using-dotnet-test/PrimeService.Tests/PrimeService_IsPrimeShould.cs)<br>
[PrimeServie](https://github.com/dotnet/samples/blob/main/core/getting-started/unit-testing-using-dotnet-test/PrimeService/PrimeService.cs)<br>
