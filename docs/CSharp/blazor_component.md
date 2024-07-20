---
tags:
  - C#
  - .NET
  - Blazor
---

# Blazor コンポーネント

コンポーネントは、`.razor`ファイルとして定義される

ファイル名は大文字を先頭にする

例

```cs title="Counter.razor"
@page "/counter"
@rendermode InteractiveServer

<PageTitle>Counter</PageTitle>

<h1>Counter</h1>

<p role="status">Current count: @currentCount</p>

<button class="btn btn-primary" @onclick="IncrementCount">Click me</button>

@code {
    private int currentCount = 0;

    [Parameter]
    public int IncrementAmount { get; set; } = 1;

    private void IncrementCount()
    {
        currentCount += IncrementAmount;
    }
}
```

呼び出し側

`<Counter />`で呼び出す

```cs
@page "/"

<PageTitle>Home</PageTitle>

<h1>Hello, world!</h1>

Welcome to your new app.

<Counter />
```


`<Counter IncrementAmount="10" />`で呼び出すと、`IncrementAmount`の初期値を変更できる<br>
※呼び出し側ごとにパラメータを変えてコンポーネントが使える

```cs
@page "/"

<PageTitle>Home</PageTitle>

<h1>Hello, world!</h1>

Welcome to your new app.

<Counter IncrementAmount="10" />
```

## `@pabe` ディレクティブ
Blazor へのルート テンプレートを提供する<br />
`@page "/example"` とすると https://domain.com/example にルーティングされる

## `@code` ディレクティブ
次のブロック内のテキストが C# コードであることを宣言する

## メンバー アクセス ディレクティブ
レンダリング ロジックにメンバーの値を含める場合は、@ 記号の後に、メンバーの名前などの C# 式を指定<br />
つまり、`@code`ディレクティブ内に記述したプライベート変数をレンダリングできる

## Reference
- [ASP.NET Core Razor コンポーネント](https://learn.microsoft.com/ja-jp/aspnet/core/blazor/components/?view=aspnetcore-8.0&source=recommendations)
- [MicrosoftDocs / mslearn-interact-with-data-blazor-web-apps](https://github.com/MicrosoftDocs/mslearn-interact-with-data-blazor-web-apps)