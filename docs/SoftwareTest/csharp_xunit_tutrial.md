---
tags:
  - C#
  - テスト
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
```C#:title="PrimeService.cs"
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


[dotnet テストと xUnit を使用した .NET Core での単体テスト C#](https://learn.microsoft.com/ja-jp/dotnet/core/testing/unit-testing-with-dotnet-test)
