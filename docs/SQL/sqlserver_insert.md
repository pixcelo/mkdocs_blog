---
tags:
  - SQLServer
  - SQL
---

# SQLでレコードを追加する(INSERT)

SQLのINSERT文の書き方

## INSERT

`INSERT INTO テーブル名  VALUES ('値1' [, '値1' ]....) ;`

データベースのテーブルに、レコードを追加する<Br>

文字列はシングルクォーテーション`'文字列'`で囲む

## Usage

列名を書かずレコードをテーブルに追加する場合

```sql
INSERT INTO user_table VALUES (1, 'Tom', '`トム');
```

列名を書いてレコードをテーブルに追加する場合<br>

全ての列名を書かなくてOK

```sql
INSERT INTO user_table(id, user_name, yomi) VALUES (1, 'Tom', 'トム');
```

格納するデータがない場合は、値に`NULL`をセット

## Reference
[INSERT (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/insert-transact-sql?view=sql-server-ver15#BasicSyntax:title)
