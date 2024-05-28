---
tags:
  - SQLServer
  - SQL
---

# SQLServer 連続した番号を採番する ROW_NUMBER
SQLServerでシーケンス番号（連番）を振るためのクエリ

## ROW_NUMBER
すべての行に番号を付ける

## Usage
```sql
-- 連番を振る
SELECT
    studentId,
    studentName,
    ROW_NUMBER() OVER(ORDER BY class, studentId　ASC) num
FROM student;
```

```sql
-- グループ単位で連番を振る
SELECT
    studentId,
    studentName,
    ROW_NUMBER() OVER(PARTITION BY class ORDER BY class, studentId　ASC) num
FROM student;
```

```sql
-- SELECTした結果から連番を振るアップデート
UPDATE student
SET studentNumber = A.RowNum
FROM student,
(
SELECT
    studentId,
    studentName,
    ROW_NUMBER() OVER(PARTITION BY studentNumber ORDER BY studentId, studentName　ASC) RowNum
FROM student
) A
WHERE student.studentId = A.studentId
AND student.studentName = A.studentName
```


## Reference
[ROW_NUMBER (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/functions/row-number-transact-sql?view=sql-server-ver16)
