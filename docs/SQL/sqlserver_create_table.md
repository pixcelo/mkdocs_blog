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

### テーブル作成

```sql
CREATE TABLE user_table (user_name VARCHAR(32), age INT);
```

### 主キーを設定してテーブル作成

```sql
CREATE TABLE [d_user](
	[user_id] [int] NOT NULL,
	[user_name] [varchar](20) NULL,
	CONSTRAINT PK_D_USER PRIMARY KEY ([user_id])
)
GO
```

- SQLコマンドは、大文字・小文字の区別しない
- 指定できるデータ型は、参考リンクを参照

## Reference
[データ型 (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15)
[CREATE TABLE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16)
