---
tags:
  - C#
  - .NET
---

# ASP.NET MVCモデルのビューへの値の渡し方

`ASP.NET Core`のMVCアプリケーションで、コントローラーからビューに値を渡す方法

## Usage

### 文字列

文字列をビューに代入して表示する

```cs
public IActionResult About()
{
   ViewData["Message"] = "Hello World.";

   return View();
}
```

`ViewData`に代入した値がそのまま表示される

```cs
@{
    ViewData["Title"] = "About";
}
<p>@ViewData["Message"]</p> // Hello World.
```

### プロパティ
`ViewData`のデータ型はディクショナリーとして扱われ、複数のプロパティやリストを格納してビューに渡すことができる

```cs
public IActionResult Privacy()
{
   ViewData["Product"] = new Product()
   {
      Id = 1,
      Name = "Pen",
      Price = 300,
   };

  return View();
}
```

```cs
@{
    var product = ViewData["product"] as Product;
}
@product.Name // Pen
```

### リスト

`ViewData`にリストを格納した場合の例

```cs
var nameList = new List<User>();
foreach(var data in records)
{
nameList.Add(data);
}

ViewData["Records"] = nameList;
```

リストに格納された各アイテムを`foreach`で取り出す

```cs
<ul>
 @foreach (var item in ViewData["Records"] as IList<User>)
 {
    <li>@item.Name</li>
 }
</ul>
```

## Reference
[ASP.NET Core MVC のビュー](https://learn.microsoft.com/ja-jp/aspnet/core/mvc/views/overview?view=aspnetcore-7.0&viewFallbackFrom=aspnetcore-3.1%3Atitle)<br>
