---
tags:
  - C#
  - ソフトウェアテスト
---

# Moq

- Moqは、単体テスト用モックフレームワーク
- テスト用の代替オブジェクトを作成するための.NETライブラリ
- ネットワーク通信、データベースアクセスなど、外部依存の機能を代替するオブジェクトを作成できる

## Usage

1. Moqライブラリをプロジェクトに追加する
2. モックを作成するクラスまたはインターフェースを定義する
3. Moqを使って、モックのインスタンスを作成する
4. モックのインスタンスを使って、テスト対象のクラスやメソッドをテストする

nugetからインストール
```
dotnet add package Moq --version 4.18.2
```

```cs
using Moq;

// テスト対象のインターフェースを定義する
public interface IDataAccess
{
    int GetValue();
}

// テスト用のクラス
public class TestClass
{
    private IDataAccess dataAccess;

    public TestClass(IDataAccess dataAccess)
    {
        this.dataAccess = dataAccess;
    }

    public int TestMethod()
    {
        return dataAccess.GetValue() * 2;
    }
}

// ユニットテスト用のクラス
[TestClass]
public class Test
{
    [TestMethod]
    public void TestTestMethod()
    {
        // モックのインスタンスを作成する
        var mock = new Mock<IDataAccess>();
        // GetValueメソッドをモックする
        mock.Setup(x => x.GetValue()).Returns(10);

        // テスト対象のインスタンスを作成する
        var testClass = new TestClass(mock.Object);
        // テストを実行する
        var result = testClass.TestMethod();
        // 結果を検証する
        Assert.AreEqual(20, result);
    }
}

```

## Reference
- [Moq](https://www.nuget.org/packages/Moq/)
- [Github Moq](https://github.com/moq/moq4)
- [AdventureWorks サンプル データベース](https://learn.microsoft.com/ja-jp/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)
