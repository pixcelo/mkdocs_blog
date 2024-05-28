---
tags:
  - SQL
  - SQLServer
  - SSMS
---

# SSMS SQLServerのパフォーマンスチューニング

## Topic

SQLServerのパフォーマンスチューニングの方法
- 個別最適：特定クエリの実行時間、CPU使用時間の削減
- 全体最適：全クエリの実行時間の合計値、またはCPU使用時間の合計値の削減

## 
`SET STATISTICS TIME`をONにすると、CPU使用時間・実行時間等をミリ秒単位で表示できる
```sql
USE AdventureWorks2022;
GO

SET STATISTICS TIME ON;
GO

SELECT ProductID, StartDate, EndDate, StandardCost
FROM Production.ProductCostHistory
WHERE StandardCost < 500.00;
GO

SET STATISTICS TIME OFF;
GO
```

## Reference
- [SET STATISTICS TIME (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/set-statistics-time-transact-sql?view=sql-server-ver16)
- [SET STATISTICS IO (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/set-statistics-io-transact-sql?view=sql-server-ver16)