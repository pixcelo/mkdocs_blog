---
tags:
  - C#
  - テスト
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


## Reference
[方法: .NET Framework の旧バージョンを対象とした単体テストを構成する](https://learn.microsoft.com/ja-jp/visualstudio/test/how-to-configure-unit-tests-to-target-an-earlier-version-of-the-dotnet-framework?view=vs-2022)<br>
[dotnet new 用の .NET の既定のテンプレート](https://learn.microsoft.com/ja-jp/dotnet/core/tools/dotnet-new-sdk-templates#test)<br>
[SDK スタイルのプロジェクトでのターゲット フレームワーク](https://learn.microsoft.com/ja-jp/dotnet/standard/frameworks)<br>
[Getting Started with xUnit.net](https://xunit.net/docs/getting-started/netfx/cmdline)<br>
