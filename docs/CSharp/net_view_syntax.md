---
tags:
  - C#
  - .NET
---

# C# .NET Viewの記述方法の新旧まとめ

.NETにおけるViewでの変数の記述方式には

- `.aspx`    コード・ナゲット
- `.cshtml`  Razor構文（Razor syntax）<br>

の新旧2種類の書き方がある<br>

業務でどちらも使うためメモとしてまとめる<br>

## 埋め込みコード ブロック
[埋め込みコードブロック](https://learn.microsoft.com/ja-jp/previous-versions/ms178135(v=vs.140))は、Viewで変数を呼び出せる

`.aspx`
```html
<html>
<body>
    <form id="form1">
        <% foreach (var item in list) { %>
            <div>
                <% item %> <br/>
            </div>
        <% } %>
    </form>
</body>
</html>
```

`.cshtml`
```html
<html>
<body>
    <form id="form1">
        @foreach (var item in list) {
            <div>
                @item <br/>
            </div>
        }
    </form>
</body>
</html>
```

## 式を表示する
[式の表示](https://learn.microsoft.com/ja-jp/previous-versions/visualstudio/visual-studio-2010/6dwsdcf5(v=vs.100))<br>
Viewで変数を表示したり、関数を使用したりできる

`.aspx`
```html
<html>
    <body>
        <form id="form1">
            <%= item.ToString() %>
        </form>
    </body>
</html>
```
全般的にRazor構文の方が記述量が減るため可読性が高い<br>
`.cshtml`
```html
<html>
    <body>
        <form id="form1">
            @item.ToString()
        </form>
    </body>
</html>
```


## Reference
[.NET Frameworkでインライン式](https://learn.microsoft.com/ja-jp/troubleshoot/developer/webapps/aspnet/development/inline-expressions)<br>
