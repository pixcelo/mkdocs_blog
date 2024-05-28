---
tags:
  - SQLServer
  - SQL
---

# SQLServer ビューを作成する (CREATE VIEW)

クエリからビューを作成する

## Usage

`CREATE VIEW [ビュー名] AS [SELECT * FROM ...]`

```sql
USE db_class
GO

CREATE VIEW v_student AS

SELECT
    dbo.student.student_id,
    dbo.student.student_name,
    dbo.student.no_group
FROM
    dbo.student
LEFT JOIN dbo.m_group ON dbo.student.no_group = dbo.m_group.no_group
```

既存のビューを消して、再作成する場合は、`DROP VIEW IF EXISTS [ビュー名]`

SQLServer2016から使用できる

```sql
USE db_class
GO

DROP VIEW IF EXISTS v_student
GO

CREATE VIEW v_student AS

SELECT
    dbo.student.student_id,
    dbo.student.student_name,
    dbo.student.no_group
FROM
    dbo.student
LEFT JOIN dbo.m_group ON dbo.student.no_group = dbo.m_group.no_group
```


## Reference
- [CREATE VIEW (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-view-transact-sql?view=sql-server-ver16)