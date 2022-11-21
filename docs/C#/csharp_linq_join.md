---
tags:
  - C#
---

# C# linq join 複数テーブルを結合する

C#のlinqでjoinをつかってテーブルを結合する方法

結合された要素を、テーブルの要素としてセレクトする直感的にわかりやすい書き方

SQLのクエリを書くように記述できる

## テーブル
サンプルテーブルを用意

|USERS_TABLE|
|-------|
|USER_ID|
|USER _NAME|
|TYPE_ID|

`USERS_TABLE`と`TYPE_TABLE`は、`TYPE_ID`を使って紐付ける

|TYPE_TABLE|
|-------|
|TYPE_ID|
|TYPE_NAME|

## Usage

```cs
public Dictionary<string, string> GetUserType()
{
    var dict = new Dictionary<string, string>();

    var items = from users_table in _context.USERS_TABLE
                join type_table in _context.TYPE_TABLE
                on users_table.TYPE_ID equals type_table.TYPE_ID
                orderby users_table.TYPE_ID, users_table.USER_ID
                select new
                {
                    USER_ID = users_table.USER_ID,
                    USER_NAME = users_table.USER_NAME,
                    TYPE_ID = users_table.TYPE_ID,
                    TYPE_NAME = type_table.TYPE_NAME
                };

    foreach (var item in items)
    {
        dict.Add(item.USER_ID, item.TYPE_NAME);
    }

    return dict;
}
```

2つのテーブルをIDをもとに結合し、1つのテーブルとして変数に格納している

## Reference
[join 句 (C# リファレンス)](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/keywords/join-clause)<br>
[Join 演算 (C#)](https://learn.microsoft.com/ja-jp/dotnet/csharp/programming-guide/concepts/linq/join-operations)<br>
