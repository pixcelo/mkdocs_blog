---
tags:
  - SQLServer
  - SQL
---

# SQLServer データ型を変換する(CONVERT)

## CONVERT

- `CONVERT`は、あるデータ型の式を別のデータ型に変換する
- CONVERT([データ型], [カラム]) 

## Usage

`INT`型に変換

`0001`などの文字列の頭のゼロを消して、`1`と表示したいときあるデータ型の式を別のデータ型に変換しにも使える

```sql
SELECT CONVERT(INT, sample_column) FROM sample_table
```


`VARCHAR`型に変換

```sql
SELECT CONVERT(VARCHAR(10), sample_column) FROM sample_table
```

## Reference
- [CAST および CONVERT (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16)
