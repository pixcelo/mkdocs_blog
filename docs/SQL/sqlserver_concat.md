---
tags:
  - SQLServer
  - SQL
---

# SQLServer 文字列を結合する(CONCAT)

## CONCAT
`CONCAT`は、2個以上の列やカラム内の文字列を連結できる<br>
`NULL`値は空文字列に暗黙的に変換される

## Usage

```sql
  SELECT CONCAT(firstName, LastName)  FROM User;
```
文字列型でないデータを連結する場合、`CONVERT`関数で文字列に変換後に結合する<br>

`+`で文字列を連結しても同じ結果になる
```sql
SELECT firstName + LastName FROM User
```

## Reference
[CONCAT (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/concat-transact-sql?view=sql-server-ver15)<br>
[CAST および CONVERT (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)
