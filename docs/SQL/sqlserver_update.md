---
tags:
  - SQLServer
  - SQL
---

# SQLでレコードを変更する(UPDATE)

SQLのUPDATE文の書き方

## UPDATE

`UPDATE テーブル名 SET カラム名 = '値';`

データベースのテーブルのレコードを変更する

文字列はシングルクォーテーションで`'文字列'`で囲む

## Usage

ひとつのカラムのデータを変更する場合

```sql
UPDATE user_table SET user_name = 'Tom' WHERE user_name = 'Bob';
```

複数のカラムのデータを変更する場合

```sql
UPDATE user_table SET user_name = 'Tom', age = 20 WHERE user_name = 'Bob';
```

条件を指定せずにカラムのデータを変更する場合

```sql
UPDATE user_table SET age = age + 1;
```
全てのレコードのカラム`age`の数値が1つ大きくなる

## Reference
[UPDATE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/queries/update-transact-sql?view=sql-server-ver15)<br>
