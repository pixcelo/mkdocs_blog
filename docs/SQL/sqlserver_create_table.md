---
tags:
  - SQL
---

# SQLでテーブルを作成する(CREATE TABLE)

SQLのCREATE TABLE文の書き方

## CREATE TABLE

`CREATE TABLE テーブル名 (カラム名 データ型);`

データベースにテーブルを新規作成する

## Usage
```sql
CREATE TABLE user_table (user_name VARCHAR(32), age INT);
```

SQLコマンドは、大文字・小文字の区別しない<br>
作成したテーブルは、`SHOW TABLES`で一覧を表示できる

```spl
SHOW TABLES;
```

指定できるデータ型は、参考リンクを参照

## Reference
[データ型 (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15)
[CREATE TABLE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16)
