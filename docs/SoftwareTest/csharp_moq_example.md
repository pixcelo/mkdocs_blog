---
tags:
  - C#
  - ソフトウェアテスト
---

# C# xUnitとMoqライブラリを使用した単体テスト例

C#での単体テストにおいて、外部依存関係を模倣（モック）することは、テストの分離と集中を実現する上で非常に重要となる

Moqライブラリは、インターフェースや抽象クラスをモックし、テスト対象のコードが期待通りに動作するかを検証するための強力なツールを提供する

この記事では、TimerLogServiceTests.csテストクラスを事例に、Moqライブラリの基本的な使用方法を紹介する

## Moqのセットアップ

Moqを使用するには、まずプロジェクトにNuGetパッケージとしてMoqを追加する必要がある

これは、Visual StudioのNuGetパッケージマネージャーまたはコマンドラインツールを使用して行うことができる
```bash
Install-Package Moq
```

## モックの作成
Moqを使用してモックを作成するには、`Mock<T>`クラスのインスタンスを作成する

ここで`T`はモックしたい型（インターフェースまたは抽象クラス）

例えば、`IUsersRepository`インターフェースのモックを作成するには、以下のようにする

```cs
var mockUsersRepository = new Mock<IUsersRepository>();
```

## メソッドの振る舞いの設定
モックオブジェクトに対して、特定のメソッドが呼び出されたときの振る舞いを設定することができる

これは`Setup`メソッドを使用して行う

例えば、Getメソッドが呼び出されたときに特定のユーザーリストを返すように設定するには、以下のようにする

```cs
mockUsersRepository.Setup(s => s.Get()).Returns(new List<M_Users>());
```

## メソッドの呼び出しの検証
テストの最後に、モックオブジェクトの特定のメソッドが期待通りに呼び出されたかどうかを検証することができる

これは`Verify`メソッドを使用して行う

例えば、Insertメソッドが正確に1回呼び出されたことを検証するには、以下のようにする

```cs
mockUsersRepository.Verify(s => s.Insert(It.IsAny<M_Users>()), Times.Once);
```

## 実際のテストケース

`UsersServiceTests.cs`では、`UsersService`クラスの各メソッド（Get, Insert, Update, Delete）の等の単体テストを行っている

各テストケースでは、`IUsersRepository`のモックを設定し、`UsersService`のメソッドが期待通りに動作するかを検証している

```cs
using Moq;
using TimerLog.WebAPI.Models;
using TimerLog.WebAPI.Repositoriers;
using TimerLog.WebAPI.Services;

namespace TimerLog.Tests.Services
{
    public class UsersServiceTests
    {
        private readonly Mock<IUsersRepository> mockUsersRepository;
        private readonly UsersService service;

        public UsersServiceTests()
        {
            this.mockUsersRepository = new Mock<IUsersRepository>();
            this.service = new UsersService(this.mockUsersRepository.Object);
        }

        /// <summary>
        /// 正常系
        /// </summary>
        [Fact]
        public void OkGet()
        {
            // Arrange
            var expected = new List<M_Users>()
            {
                new M_Users { Id = 1, Name = "Tom" },
                new M_Users { Id = 2, Name = "Ken" },
            };

            mockUsersRepository.Setup(s => s.Get()).Returns(expected);

            // Act
            var actual = service.Get();

            // Assert
            Assert.Equal(expected, actual);
        }

        /// <summary>
        /// 正常系
        /// </summary>
        [Fact]
        public void OkInsert()
        {
            // Arrange
            var newUser = new M_Users { Name = "Mary" };
            var expected = 10;

            mockUsersRepository.Setup(s => s.Insert(newUser)).Returns(expected);

            // Act
            var actual = service.Insert(newUser);

            // Assert
            Assert.Equal(expected, actual);
            mockUsersRepository.Verify(s => s.Insert(newUser), Times.Once);
        }

        /// <summary>
        /// 正常系
        /// </summary>
        [Fact]
        public void OkUpdate()
        {
            // Arrange
            var existingUser = new M_Users { Id = 5, Name = "更新対象ユーザー" };

            mockUsersRepository.Setup(s => s.Update(existingUser)).Returns(1);

            // Act
            var actual = service.Update(existingUser);

            // Assert
            Assert.Equal(1, actual);
            mockUsersRepository.Verify(s => s.Update(existingUser), Times.Once);
        }

        /// <summary>
        /// 正常系
        /// </summary>
        [Fact]
        public void OkDelete()
        {
            // Arrange
            var targetId = 123;

            mockUsersRepository.Setup(s => s.Delete(targetId)).Returns(1);

            // Act
            var actual = service.Delete(targetId);

            // Assert
            Assert.Equal(1, actual);
            mockUsersRepository.Verify(s => s.Delete(targetId), Times.Once);
        }

        /// <summary>
        /// 正常系_例外を発生させるテスト
        /// </summary>
        [Fact]
        public void OkThrowException()
        {
            // Arrange
            var mockUsersRepository = new Mock<IUsersRepository>();

            mockUsersRepository
                .Setup(s => s.Get())
                .Throws(new InvalidOperationException("connection error"));

            // Act
            var service = new UsersService(mockUsersRepository.Object);

            // Assert
            Assert.Throws<InvalidOperationException>(() => service.Get());
        }

    }
}
```

## Reference
- [Moq](https://www.nuget.org/packages/Moq/)
- [Github Moq](https://github.com/moq/moq4)