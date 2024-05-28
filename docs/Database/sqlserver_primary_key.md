---
tags:
  - SQLServer
  - SQL
---

# SQLServer 主キーの設定

## テーブル作成時に主キーを設定　

主キーを設定
```sql
CREATE TABLE [zoo](
	[animal] [varchar](20) NOT NULL,
	[age] [int] NOT NULL,
PRIMARY KEY [animal])
```

複合キーを設定`()`で囲む
```sql
CREATE TABLE [zoo](
	[animal] [varchar](20) NOT NULL,
	[age] [int] NOT NULL,
PRIMARY KEY
([animal], [age])
)
```

## 既存テーブルに主キーを設定
既存カラムに主キー（制約）を設定
```sql
ALTER TABLE [zoo] ADD PRIMARY KEY ([animal_ID])
ALTER TABLE [zoo] ADD PK_zoo PRIMARY KEY ([animal_ID])
```

## 主キー（制約）の削除
```sql
ALTER TABLE [zoo] DROP CONSTRAINT PK_zoo
```

## Reference
[主キーの作成](https://learn.microsoft.com/ja-jp/sql/relational-databases/tables/create-primary-keys?view=sql-server-ver16)<br>
[CREATE TABLE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16)<br>
