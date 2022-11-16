---
tags:
  - SQL
---

# SQLでデータベースのカラムを操作する【追加・変更・削除】

SQLでカラムを操作する方法

## Usage

### カラムの追加

`ALTER TABLE テーブル名 ADD 追加カラム名 データ型;`

```sql
ALTER TABLE zoo ADD animal_name VARCHAR(20);
```

### カラムのデータ型の変更

`ALTER TABLE テーブル名 MODIFY カラム名 新データ型;`

作成済みのカラムのデータ型を変更

```sql
ALTER TABLE zoo MODIFY animal_name VARCHAR(30);
```

### カラムのデータ名とデータ型の変更
`ALTER TABLE テーブル名 CHANGE カラム名 新カラム名 新データ型;`

作成済みのカラムの名前とデータ型を変更

```sql
ALTER TABLE zoo CHANGE animal_number animal_ID VARCHAR(10);
```

### カラムの削除
`ALTER TABLE テーブル名 DROP COLUMN カラム名;`

作成済みのカラムの名前とデータ型を変更

```sql
ALTER TABLE zoo DROP COLUMN animal_type;
```

## Reference
[ALTER TABLE (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16)<br>
