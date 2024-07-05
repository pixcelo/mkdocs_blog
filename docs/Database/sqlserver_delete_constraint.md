---
tags:
  - SQLServer
  - SQL
---

# SQLServerで制約付きのカラムを削除する

SQL Serverでテーブルのカラムを削除する際、特にDEFAULT制約が設定されている場合は注意が必要となる

この記事では、DEFAULT制約付きカラムを安全に削除する方法をまとめる

## SELECT句で制約名を取得して、制約を削除後にカラムを削除するクエリ

カラムを削除する前に、関連する制約を先に削除する必要がある

しかし、制約名は自動生成されることが多く、直接指定するのは難しい

そこで、システムビューを利用して動的に制約名を取得し、削除するスクリプトを利用する

```sql
DECLARE
	@tableName VARCHAR(30),
	@columnName VARCHAR(30),
	@tableId VARCHAR(10),
	@columnId VARCHAR(10),
	@constraintName NVARCHAR(128)

-- 対象テーブルを指定
SET @tableName = 'TableName'

-- 対象列を指定
SET @columnName = 'ColumnName'

-- 対象テーブルの「テーブルID」を取得
SET @tableId = (SELECT id FROM sys.sysobjects WHERE xtype = 'U' AND name = @tableName)

-- 対象テーブルの「列ID」を取得
SET @columnId = (SELECT column_id FROM sys.columns WHERE object_id = @tableId AND name = @columnName)

-- 「テーブルID」と「列ID」を使用して、「制約名」を取得
SET @constraintName = (
    SELECT name
    FROM sys.sysobjects
    WHERE id = (
        SELECT constid
        FROM sys.sysconstraints
        WHERE id = @tableId AND colid = @columnId
    )
)

-- 制約が存在する場合、削除する
IF @constraintName IS NOT NULL
BEGIN
    DECLARE @sql NVARCHAR(MAX)

	-- 制約を削除
    SET @sql = 'ALTER TABLE ' + QUOTENAME(@tableName) + ' DROP CONSTRAINT ' + QUOTENAME(@constraintName)
    EXEC sp_executesql @sql

	-- カラムを削除
    SET @sql = 'ALTER TABLE ' + QUOTENAME(@tableName) + ' DROP COLUMN ' + QUOTENAME(@columnName)
    EXEC sp_executesql @sql
END
GO
```

**スクリプトの解説**

- 変数の宣言: テーブル名、カラム名、各種IDと制約名を格納するための変数を宣言
- テーブルIDの取得: sys.sysobjectsビューを使用して、指定されたテーブルのIDを取得
- カラムIDの取得: sys.columnsビューを使用して、指定されたカラムのIDを取得
- 制約名の取得: sys.sysobjectsとsys.sysconstraintsビューを組み合わせて、DEFAULT制約の名前を取得
- 制約の削除: 制約が存在する場合、動的SQLを使用して制約を削除
- カラムの削除: 最後に、指定されたカラムを削除

## Reference
- [テーブルから列を削除する](https://learn.microsoft.com/ja-jp/sql/relational-databases/tables/delete-columns-from-a-table?view=sql-server-ver16)
- [列と制約を削除する](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#b-drop-constraints-and-columns)
- [sys.sysobjects (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/relational-databases/system-compatibility-views/sys-sysobjects-transact-sql?view=sql-server-ver16)
- [sys.columns (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/relational-databases/system-catalog-views/sys-columns-transact-sql?view=sql-server-ver16)
- [sys.sysconstraints (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/relational-databases/system-compatibility-views/sys-sysconstraints-transact-sql?view=sql-server-ver16)
- [BEGIN...END (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/language-elements/begin-end-transact-sql?view=sql-server-ver16)