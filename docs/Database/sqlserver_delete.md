---
tags:
  - SQLServer
  - SQL
---

# SQLでレコードを削除する(DELETE・TRUNCATE)

SQLのDELETE文、TRUNCATE文の書き方

## DELETE・TRUNCATE
全レコードの削除

`DELETE FROM テーブル名;`

`TRUNCATE テーブル名;`

指定レコードの削除

`DELETE FROM テーブル名 WHERE 条件;`

テーブルからレコードを削除

レコードを指定しない場合、全件削除になる

## Usage

DELETE文で`user_table`でレコードを全件削除

```sql
DELETE FROM user_table;
```

TRUNCATE文の場合、テーブル・レコードを全件削除し、テーブルは再作成される<br>

（DELETE文よりも高速に処理される）

## Note
DELETE文を実行する前に、SELECT文で正しく条件を指定できているかを確認するとミスが減らせる

## Reference
[DELETE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/delete-transact-sql?view=sql-server-ver16)<br>
[TRUNCATE TABLE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/truncate-table-transact-sql?view=sql-server-ver16)<br>
