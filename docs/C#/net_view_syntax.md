# C# .NET Viewの記述方法の新旧まとめ

.NETにおけるViewでの変数の記述方式には

- `.aspx`    コード・ナゲット
- `.cshtml`  azor構文（Razor syntax）<br>

の新旧2種類の書き方がある<br>

業務でどちらも使うためメモとしてまとめる<br>

## 埋め込みコード ブロック
[埋め込みコードブロック](https://learn.microsoft.com/ja-jp/previous-versions/ms178135(v=vs.140))は、Viewで変数を呼び出せる
```html:title=".aspx"
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

```html:title=".cshtml"
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


## Reference
[.NET Frameworkでインライン式](https://learn.microsoft.com/ja-jp/troubleshoot/developer/webapps/aspnet/development/inline-expressions)<br>
