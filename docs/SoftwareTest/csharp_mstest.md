---
tags:
  - C#
  - ソフトウェアテスト
  - MSTest
---

# C# MSTest 自動テスト
- MSTestはMicrosoftが提供するテストフレームワーク
- 設定要らずでテストが書き始められるのが強み
- `.NET framework 4.5.2` 以前のversionで自動テストしたいときにも使いやすい

## プロジェクト作成手順
1. テストプロジェクト作成
2. 既存プロジェクト追加
3. 既存プロジェクトをテストプロジェクトの参照に追加
4. テストコード実装
5. テスト実行

## テストコード

- `[TestClass]`属性クラスの`[TestMethod]`属性メソッドがテスト実行される
- 属性がないとエラーにすらならないので注意

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

## デモコード

```cs title="BankAccount.cs"
using System;

namespace BankAccountNS
{
    /// <summary>
    /// Bank account demo class.
    /// </summary>
    public class BankAccount
    {
        private readonly string m_customerName;
        private double m_balance;

        private BankAccount() { }

        public BankAccount(string customerName, double balance)
        {
            m_customerName = customerName;
            m_balance = balance;
        }

        public string CustomerName
        {
            get { return m_customerName; }
        }

        public double Balance
        {
            get { return m_balance; }
        }

        public void Debit(double amount)
        {
            if (amount > m_balance)
            {
                throw new ArgumentOutOfRangeException("amount");
            }

            if (amount < 0)
            {
                throw new ArgumentOutOfRangeException("amount");
            }

            m_balance += amount; // intentionally incorrect code
        }

        public void Credit(double amount)
        {
            if (amount < 0)
            {
                throw new ArgumentOutOfRangeException("amount");
            }

            m_balance += amount;
        }

        public static void Main()
        {
            BankAccount ba = new BankAccount("Mr. Bryan Walton", 11.99);

            ba.Credit(5.77);
            ba.Debit(11.22);
            Console.WriteLine("Current balance is ${0}", ba.Balance);
        }
    }
}
```

## Reference
- [チュートリアル: マネージド コードの単体テストを作成し、実行する](https://learn.microsoft.com/ja-jp/visualstudio/test/walkthrough-creating-and-running-unit-tests-for-managed-code?view=vs-2022)
- [MSTest と .NET による単体テスト C#](https://learn.microsoft.com/ja-jp/dotnet/core/testing/unit-testing-with-mstest)
- [.NET Core と .NET Standard での単体テストのベスト プラクティス](https://learn.microsoft.com/ja-jp/dotnet/core/testing/unit-testing-best-practices)
