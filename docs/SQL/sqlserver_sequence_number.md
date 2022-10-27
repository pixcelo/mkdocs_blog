## SQLServer シーケンス番号（連番）を振る
SQLServerで連番を振るためのクエリ

## Usage
```SQL
-- 連番を振る
SELECT
    studentId,
    studentName,
    ROW_NUMBER() OVER(ORDER BY class, studentId　ASC) num
FROM student;
 ```

```SQL
-- グループ単位で連番を振る
SELECT
    studentId,
    studentName,
    ROW_NUMBER() OVER(PARTITION BY class ORDER BY class, studentId　ASC) num
FROM student;
```

## Reference
[ROW_NUMBER (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/functions/row-number-transact-sql?view=sql-server-ver16)
