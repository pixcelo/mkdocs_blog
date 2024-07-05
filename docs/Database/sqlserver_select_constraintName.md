---
tags:
  - SQLServer
  - SQL
---

# SQLServerで制約名を取得する

この記事では、特定のテーブルとカラムに対する制約名を効率的に取得する方法を解説する

## システムビューで制約名を取得するクエリ

システムビューを利用して動的に制約名を取得する

```sql
DECLARE
	@tableName VARCHAR(30),
	@columnName VARCHAR(30),
	@tableId VARCHAR(10),
	@columnId VARCHAR(10)

--対象テーブルを指定
SET @tableName = 'TableName'

--対象列を指定
SET @columnName = 'ColumnName'

--対象テーブルの「テーブルID」を取得
SET @tableId = (SELECT id FROM sys.sysobjects WHERE xtype = 'U' AND name = @tableName)

--対象テーブルの「列ID」を取得
SET @columnId = (SELECT column_id FROM sys.columns WHERE object_id = @tableId AND name = @columnName)

--「テーブルID」と「列ID」を使用して、「制約名」を取得
SELECT
	name AS '制約名'
FROM 
	sys.sysobjects 
WHERE id = (SELECT constid FROM sys.sysconstraints WHERE id = @tableId AND colid = @columnId)
```

**スクリプトの解説**

- @tableName: 対象テーブルの名前
- @columnName: 対象カラムの名前
- @tableId: テーブルのシステムID
- @columnId: カラムのシステムID

<br />

- テーブルIDの取得：sys.sysobjectsビューを使用して、指定されたテーブル名に対応するIDを取得。xtype = 'U'は、ユーザー定義テーブルを示す
- カラムIDの取得：sys.columnsビューを使用して、指定されたカラム名に対応するIDを取得
- デフォルト制約名の取得：sys.sysobjectsとsys.sysconstraintsビューを組み合わせて、デフォルト制約の名前を取得

## Reference
- [sys.sysobjects (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/relational-databases/system-compatibility-views/sys-sysobjects-transact-sql?view=sql-server-ver16)
- [sys.columns (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/relational-databases/system-catalog-views/sys-columns-transact-sql?view=sql-server-ver16)
- [sys.sysconstraints (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/relational-databases/system-compatibility-views/sys-sysconstraints-transact-sql?view=sql-server-ver16)