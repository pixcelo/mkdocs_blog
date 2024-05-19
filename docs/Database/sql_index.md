---
tags:
  - SQL
  - SQLServer
---

# データベースのインデックス

SQLServerを題材に、SQLのインデックスについてまとめる

## インデックスとは

データベースにおけるインデックスとは、辞書にある索引のようなイメージ

インデックスを付与すると、インデックスをキーとしたクエリを実行した際に効率的な検索が可能となる

## CREATE INDEX
テーブルまたはビューに非クラスター化インデックスを作成する構文
```sql
CREATE INDEX index1 ON schema1.table1 (column1);
```

Employees テーブルに DepartmentID 列に対するインデックスを追加する例
```sql
CREATE INDEX IDX_Employees_DepartmentID ON Employees (DepartmentID);
```

インデックスに指定するカラムは、できる限り要素が少ない（重複しない）ものが良い

YouTubeで[SQL を速くするインデックス入門 : B-Tree や複合インデックスが理解できる](https://www.youtube.com/live/OsIxUT7D728?si=bp3CErlbZT29q2uw)が分かりやすくて良かった

## Reference
- [インデックス](https://learn.microsoft.com/ja-jp/sql/relational-databases/indexes/indexes?view=sql-server-ver16&source=recommendations)
- [クラスター化インデックス](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-index-transact-sql?view=sql-server-ver16#clustered-indexes)
- [CREATE INDEX (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-index-transact-sql?view=sql-server-ver16)
- [SQL Server と Azure SQL のインデックスのアーキテクチャとデザイン ガイド](https://learn.microsoft.com/ja-jp/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16)