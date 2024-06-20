---
tags:
  - SQL
  - SQLServer
---

# SQLServerでキャッシュをクリアする

クエリを実行するとメモリにキャッシュされるため、2回目以降は実行速度が向上する

本来の実行速度を確認したい場合、キャッシュをクリアして検証する必要がある

## DBCC DROPCLEANBUFFERS

`DBCC DROPCLEANBUFFERS` コマンドは、SQL Server のバッファープールからすべてのクリーンバッファを削除する

バッファープールとは、頻繁にアクセスされるデータページを一時的に格納するメモリ領域のこと

クリーンバッファとは、バッファープール内にある未使用のデータページを指す

```sql
DBCC DROPCLEANBUFFERS
```

## DBCC FREEPROCCACHE

`DBCC FREEPROCCACHE` コマンドは、SQL Server のプランキャッシュからすべてのコンパイル済み実行プランを削除する

プランキャッシュとは、過去に実行されたクエリの最適化された実行プランを格納するメモリ領域のこと

```sql
DBCC FREEPROCCACHE
```

## 使用例

両方のコマンドを組み合わせて実行することで、バッファキャッシュとプランキャッシュを同時にクリアすることができる

```sql
DBCC DROPCLEANBUFFERS
DBCC FREEPROCCACHE

SELECT * FROM Students
```

## Reference
- [DBCC DROPCLEANBUFFERS (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/database-console-commands/dbcc-dropcleanbuffers-transact-sql?view=sql-server-ver16)
- [DBCC FREEPROCCACHE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/database-console-commands/dbcc-freeproccache-transact-sql?view=sql-server-ver16)