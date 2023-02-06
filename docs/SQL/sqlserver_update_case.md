---
tags:
  - SQLServer
  - SQL
---

# SQLServer 他のテーブルの値でアップデートする(UPDATE)

- 他のテーブルのカラムをアップデートの値とする
- アップデートするかどうかの場合分けを行う

## Usage

他のテーブルの値を使って、アップデートを行う

```sql
UPDATE example_table
SET example_column = other_column
FROM other_table
WHERE example_table.id = other_table.id
```

## Reference
- [UPDATE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/queries/update-transact-sql?view=sql-server-ver15)
- [CASE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/language-elements/case-transact-sql?view=sql-server-ver16)
