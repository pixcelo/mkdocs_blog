---
tags:
  - C#
  - テスト
  - MSTest
---

# C# MSTest 自動テスト
MSTestはMicrosoftが提供するテストフレームワーク<br>
設定要らずでテストが書き始められるのが強み<br>
`.NET framework 4.5.2` 以前のversionで自動テストしたいときにも使いやすい

## プロジェクト作成手順
1. テストプロジェクト作成
2. 既存プロジェクト追加
3. 既存プロジェクトをテストプロジェクトの参照に追加
4. テストコード実装
5. テスト実行

## テストコード

`[TestClass]`属性クラスの`[TestMethod]`属性メソッドがテスト実行される<br>
属性がないとエラーにすらならないので注意
```C#
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Prime.Services;

namespace Prime.UnitTests.Services
{
    [TestClass]
    public class PrimeService_IsPrimeShould
    {
        private readonly PrimeService _primeService;

        public PrimeService_IsPrimeShould()
        {
            _primeService = new PrimeService();
        }

        [TestMethod]
        public void IsPrime_InputIs1_ReturnFalse()
        {
            bool result = _primeService.IsPrime(1);

            Assert.IsFalse(result, "1 should not be prime");
        }
    }
}
```

## Reference
[MSTest と .NET による単体テスト C#](https://learn.microsoft.com/ja-jp/dotnet/core/testing/unit-testing-with-mstest)<br>
[.NET Core と .NET Standard での単体テストのベスト プラクティス](https://learn.microsoft.com/ja-jp/dotnet/core/testing/unit-testing-best-practices)<br>
