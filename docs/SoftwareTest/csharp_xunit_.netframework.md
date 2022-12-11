---
tags:
  - C#
  - ソフトウェアテスト
  - xUnit
---

# .NET Framework xUnitでの単体テストの設定

xUnitで.NET Frameworkをテストする際の設定方法

## xUnit テストプロジェクトの作成

テストプロジェクト用のフォルダーを作成し、フォルダーに移動後、`dotnet new`で空のソリューションファイルを作成<br>
テストプロジェクトのフォルダ名は公式に合わせて`プロジェクト名.Tests`とした
```
mkdir <The Project name.Tests>
cd <The Project name.Tests>
dotnet new sl
```

`dotnet new`で単体テストプロジェクトを作成し、それをソリューションに追加
```
dotnet new xunit
dotnet sln add .
```

## テストプロジェクトの.csprojファイルを編集
テストプロジェクト作成時点の`.csproj`は.NET Core用になっているため<br  <ItemGroup>
    <PackageReference
        Include="Microsoft.NETFramework.ReferenceAssemblies"
        Version="1.0.0"
        Condition=" '$(TargetFrameworkIdentifier)' == '.NETFramework' ">
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
      <PrivateAssets>all</PrivateAssets>
    </PackageReference>
    <PackageReference Include="xunit" Version="2.4.1" />
    <PackageReference Include="xunit.runner.console" Version="2.4.1">
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
      <PrivateAssets>all</PrivateAssets>
    </PackageReference>
  </ItemGroup>>
対象となるフレームワークを`.NET framework`に編集する
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

</Project>
```

`.NET framework4.5.2`を対象のフレームワークとして編集<br>
( xUnitのサポート対象は`.NET framework4.5.2`以降 )
```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net452</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference
        Include="Microsoft.NETFramework.ReferenceAssemblies"
        Version="1.0.0"
        Condition=" '$(TargetFrameworkIdentifier)' == '.NETFramework' ">
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
      <PrivateAssets>all</PrivateAssets>
    </PackageReference>
    <PackageReference Include="xunit" Version="2.4.1" />
    <PackageReference Include="xunit.runner.console" Version="2.4.1">
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
      <PrivateAssets>all</PrivateAssets>
    </PackageReference>
  </ItemGroup>

</Project>
```

## テストプロジェクトのビルド実行

初期に作成される`Using.cs`の`global using Xunit;`は、今回対象のフレームワークでは使用できない<br>
```
D:\***\sampleProject.Tests\Usings.cs(1,1): error CS8370:
機能 'グローバル using ディレクティブ' は C# 7.3 では使用できません。10.0 以上の言語バージョンをお使いください 。
```
とエラーになるので削除<br>
```
rm Using.cs
```
<br>

`Using.cs`を削除後、ビルドを実行する
```
dotnet build
```

ビルドに成功すると下記のメッセージが表示される
```
MSBuild version 17.3.2+561848881 for .NET
  復元対象のプロジェクトを決定しています...
  復元対象のすべてのプロジェクトは最新です。
  sampleProject.Tests -> D:\***\sampleProject.Test
  s\bin\Debug\net452\sampleProject.Tests.dll

ビルドに成功しました。
    0 個の警告
    0 エラー

経過時間 00:00:01.33
```
## 単体テスト MSBuild ターゲットの設定

`dotnet build`を使用してテストを実行するための設定

プロジェクトファイルを編集する
```xml
<Project Sdk="Microsoft.NET.Sdk">

	<PropertyGroup>
		<TargetFramework>net452</TargetFramework>
		<XunitConsole Condition=" '$(OS)' == 'Windows_NT' ">&quot;$(XunitConsole472Path)&quot;</XunitConsole>
		<XunitConsole Condition=" '$(OS)' != 'Windows_NT' ">mono &quot;$(XunitConsole472Path)&quot;</XunitConsole>
	</PropertyGroup>

	<ItemGroup>
		<PackageReference
			Include="Microsoft.NETFramework.ReferenceAssemblies"
			Version="1.0.0"
			Condition=" '$(TargetFrameworkIdentifier)' == '.NETFramework' ">
			<IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
			<PrivateAssets>all</PrivateAssets>
		</PackageReference>
		<PackageReference Include="xunit" Version="2.4.1" />
		<PackageReference Include="xunit.runner.console" Version="2.4.1">
			<IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
			<PrivateAssets>all</PrivateAssets>
		</PackageReference>
	</ItemGroup>

	<Target Name="Test" DependsOnTargets="Build">
		<Exec
			Command="$(XunitConsole) $(TargetFileName)"
			WorkingDirectory="$(TargetDir)" />
	</Target>

</Project>
```

ビルドコマンドを実行
```
dotnet build -t:Test
```

ビルドの成功を確認できる
```
MSBuild version 17.3.2+561848881 for .NET
  復元対象のプロジェクトを決定しています...
  復元対象のすべてのプロジェクトは最新です。
  sampleProject.Tests -> D:\***\sampleProject.Tests\bin\Debug\net452\sampleProject.Tests.d
  ll
  xUnit.net Console Runner v2.4.1 (64-bit Desktop .NET 4.7.2, runtime: 4.0.30319.42000)
    Discovering: sampleProject.Tests
    Discovered:  sampleProject.Tests
    Starting:    sampleProject.Tests
    Finished:    sampleProject.Tests
  === TEST EXECUTION SUMMARY ===
     sampleProject.Tests  Total: 1, Errors: 0, Failed: 0, Skipped: 0, Time: 0.142s

ビルドに成功しました。
    0 個の警告
    0 エラー

経過時間 00:00:03.14
```

## [Fact] テスト

`[Fact]`属性の単体テスト<br>

```C#
using Xunit;

namespace MyFirstUnitTests
{
    public class UnitTest1
    {
        [Fact]
        public void PassingTest()
        {
            Assert.Equal(4, Add(2, 2));
        }

        [Fact]
        public void FailingTest()
        {
            Assert.Equal(5, Add(2, 2));
        }

        int Add(int x, int y)
        {
            return x + y;
        }
    }
}
```

ビルドコマンドを実行
```
dotnet build -t:Test
```

テストが失敗し、実行結果が表示される<br>
失敗した関数名や、スタックトレースがコンソールを確認できる
```
MSBuild version 17.3.2+561848881 for .NET
  復元対象のプロジェクトを決定しています...
  復元対象のすべてのプロジェクトは最新です。
  sampleProject.Tests -> D:\***\sampleProject.Tests\bin\Debug\net452\sampleProject.Tests.d
  ll
  xUnit.net Console Runner v2.4.1 (64-bit Desktop .NET 4.7.2, runtime: 4.0.30319.42000)
    Discovering: sampleProject.Tests
    Discovered:  sampleProject.Tests
    Starting:    sampleProject.Tests
      sampleProject.Tests.UnitTest1.FailingTest [FAIL]
        Assert.Equal() Failure
        Expected: 5
        Actual:   4
        Stack Trace:
             場所 Xunit.Assert.Equal[T](T expected, T actual, IEqualityComparer`1 comparer) 場所 C:\Dev\xunit\xunit\src\xunit.assert\Asserts\EqualityAsser
  ts.cs:行 40
             場所 sampleProject.Tests.UnitTest1.FailingTest() 場所 D:\***\sampleProject.Tests\UnitTest1.cs: 行 17
    Finished:    sampleProject.Tests
  === TEST EXECUTION SUMMARY ===
     sampleProject.Tests  Total: 2, Errors: 0, Failed: 1, Skipped: 0, Time: 0.390s
D:\***\sampleProject.Tests\sampleProject.Tests.csproj(25,3): error MSB3073: コマンド ""C:\Users\***\.nuge
t\packages\xunit.runner.console\2.4.1\build\..\tools\net472\xunit.console.exe" sampleProject.Tests.dll" はコード 1 で終了しました。

ビルドに失敗しました。

D:\***\sampleProject.Tests\sampleProject.Tests.csproj(25,3): error MSB3073: コマンド ""C:\Users\***\.nuge
t\packages\xunit.runner.console\2.4.1\build\..\tools\net472\xunit.console.exe" sampleProject.Tests.dll" はコード 1 で終了しました。
    0 個の警告
    1 エラー

経過時間 00:00:02.74
```

## [Theory] テスト

`[Theory]`属性の単体テスト<br>
複数の入力値をテストできる

```C#
[Theory]
[InlineData(3)]
[InlineData(5)]
[InlineData(6)]
public void MyFirstTheory(int value)
{
    Assert.True(IsOdd(value));
}

bool IsOdd(int value)
{
    return value % 2 == 1;
}
```

テストの実行結果<br>
`sampleProject.Tests.UnitTest1.MyFirstTheory(value: 6) [FAIL]`のように、どの入力値でテストが失敗したかを確認できる<br>
```
MSBuild version 17.3.2+561848881 for .NET
  復元対象のプロジェクトを決定しています...
  復元対象のすべてのプロジェクトは最新です。
  sampleProject.Tests -> D:\***\sampleProject.Tests\bin\Debug\net452\sampleProject.Tests.dll
  xUnit.net Console Runner v2.4.1 (64-bit Desktop .NET 4.7.2, runtime: 4.0.30319.42000)
    Discovering: sampleProject.Tests
    Discovered:  sampleProject.Tests
    Starting:    sampleProject.Tests
      sampleProject.Tests.UnitTest1.MyFirstTheory(value: 6) [FAIL]
        Assert.True() Failure
        Expected: True
        Actual:   False
        Stack Trace:
             場所 Xunit.Assert.True(Nullable`1 condition, String userMessage) 場所 C:\Dev\xunit\xunit\src\xunit.assert\Asserts\BooleanAsserts.cs:行 95
             場所 sampleProject.Tests.UnitTest1.MyFirstTheory(Int32 value) 場所 D:\***\sampleProject.Tests\UnitTest1.cs:行 14
    Finished:    sampleProject.Tests
  === TEST EXECUTION SUMMARY ===
     sampleProject.Tests  Total: 3, Errors: 0, Failed: 1, Skipped: 0, Time: 0.190s
D:\***\sampleProject.Tests\sampleProject.Tests.csproj(25,3): error MSB3073: コマンド ""C:\Users\***\.nuget\packages\xunit.runner.console\2.4.1\build\..\too
ls\net472\xunit.console.exe" sampleProject.Tests.dll" はコード 1 で終了しました。

ビルドに失敗しました。

D:\***\sampleProject.Tests\sampleProject.Tests.csproj(25,3): error MSB3073: コマンド ""C:\Users\***\.nuget\packages\xunit.runner.console\2.4.1\build\..\too
ls\net472\xunit.console.exe" sampleProject.Tests.dll" はコード 1 で終了しました。
    0 個の警告
    1 エラー

経過時間 00:00:01.52
```

## Visual Studioのテストランナーからテストを実行する

Visual Studioを使用する場合、プロジェクトファイルの`ItemGroup`に<br>
`<PackageReference Include="Microsoft.NET.Test.Sdk" Version="16.8.3" />`<br>
`<PackageReference Include="xunit.runner.visualstudio" Version="2.4.3">`<br>
を追加する

```xml
<ItemGroup>
  <PackageReference
      Include="Microsoft.NETFramework.ReferenceAssemblies"
      Version="1.0.0"
      Condition=" '$(TargetFrameworkIdentifier)' == '.NETFramework' ">
    <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    <PrivateAssets>all</PrivateAssets>
  </PackageReference>
  <PackageReference Include="Microsoft.NET.Test.Sdk" Version="16.8.3" />
  <PackageReference Include="xunit" Version="2.4.1" />
  <PackageReference Include="xunit.runner.console" Version="2.4.1" />
  <PackageReference Include="xunit.runner.visualstudio" Version="2.4.3">
    <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    <PrivateAssets>all</PrivateAssets>
  </PackageReference>
</ItemGroup>
```

## Reference
[方法: .NET Framework の旧バージョンを対象とした単体テストを構成する](https://learn.microsoft.com/ja-jp/visualstudio/test/how-to-configure-unit-tests-to-target-an-earlier-version-of-the-dotnet-framework?view=vs-2022)<br>
[dotnet new 用の .NET の既定のテンプレート](https://learn.microsoft.com/ja-jp/dotnet/core/tools/dotnet-new-sdk-templates#test)<br>
[SDK スタイルのプロジェクトでのターゲット フレームワーク](https://learn.microsoft.com/ja-jp/dotnet/standard/frameworks)<br>
[.NET アプリケーションでパッケージの依存関係を管理する](https://learn.microsoft.com/ja-jp/dotnet/core/tools/dependencies)<br>
[Getting Started with xUnit.net](https://xunit.net/docs/getting-started/netfx/cmdline)<br>
