---
tags:
  - SQLServer
  - SQL
---

# SQLでレコードを表示する(SELECT)

SQLのSELECT文の書き方

## SELECT
レコードの全カラムを表示

`SELECT * FROM テーブル名;`

`*`(アスタリスク)を指定すると、レコードから全てのカラムのデータを取り出す

## Usage
```SQL
SELECT * FROM user_table;
```

レコードの指定カラムの表示

`SELECT カラム名 FROM テーブル名;`

`カラム名`を指定すると、レコードから指定したカラムのデータのみ取り出す

```SQL
SELECT user_name, age FROM user_table;
```

条件を指定したレコードの表示

`SELECT * FROM テーブル名 WHERE 条件;`

指定した条件のレコードを表示

```SQL
SELECT * FROM user_table WHERE age > 20;
```

レコードの表示数の制限

`SELECT * FROM テーブル名 LIMIT 数値;`

`LIMIT`は指定した数値の件数だけ、レコードを表示<br>

e.g.<br>
レコード数が大量になったり、トップ10を表示したい等、表示数量を制限したいときに使用

```SQL
SELECT * FROM user_table LIMIT 10;
```

SELECTステートメントは、以下の順序で処理される<br>

- FROM
- ON
- JOIN
- WHERE
- GROUP BY
- WITH CUBE または WITH ROLLUP
- HAVING
- SELECT
- DISTINCT
- ORDER BY
- TOP

# Reference
[SELECT (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/queries/select-transact-sql?view=sql-server-ver16)<br>
[SELECT 句 (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/queries/select-clause-transact-sql?view=sql-server-ver16)<br>
