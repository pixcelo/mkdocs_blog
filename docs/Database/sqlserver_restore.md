---
tags:
  - SQL
  - SQLServer
---

# SQLServer SSMSを使わずにクエリから復元（リストア）を行う

SSMS (`SQL Server Management Studio`)を使ってGUIからポチポチと復元するのは辛いのでクエリを使用する

`RESTORE` 構文によるバッアップの復元を行う方法を扱う

## Usage

`RESTORE DATABASE database_name FROM backup_device [ WITH NORECOVERY ]`

```sql
USE master
GO

-- 1. シングルユーザーモードに切り替え
ALTER DATABASE sampleDatabase
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE
GO

-- 2. 完全バックアップを復元
RESTORE DATABASE sampleDatabase
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\Backup\sampleDatabase.bak'
WITH REPALCE
GO

-- 3. マルチユーザーモードに切り替え
ALTER DATABASE sampleDatabase
SET MULTI_USER
GO
```

メインのクエリは2番の`RESTORE DATABASE`

オプションの引数に`WITH REPALCE`をつけると、既存のデータベースを上書きする

1、2番のユーザーモードの切り替えを行わないと、下記のエラーが発生する場合がある

```
メッセージ 3101、レベル 16、状態 1、行 2
データベースは使用中なので、排他アクセスを獲得できませんでした。
メッセージ 3013、レベル 16、状態 1、行 2
RESTORE DATABASE が異常終了しています。

完了時刻: 2022-12-16T22:50:04.6172494+09:00
```

復元に成功すると、以下のメッセージが表示される

```
限定されないトランザクションをロールバック中です。推定ロールバック完了率: 0%。
限定されないトランザクションをロールバック中です。推定ロールバック完了率: 100%。
データベース 'sampleDatabase' の 25792 ページ、ファイル 1 のファイル 'sample' を処理しました。
データベース 'sampleDatabase' の 1 ページ、ファイル 1 のファイル 'sample_log' を処理しました。
RESTORE DATABASE により 25793 ページが 2.191 秒間で正常に処理されました (91.967 MB/秒)。

完了時刻: 2022-12-17T05:50:26.5394912+09:00
```

## Reference
* [データベースの全体復元 (単純復旧モデル)](https://learn.microsoft.com/ja-jp/sql/relational-databases/backup-restore/complete-database-restores-simple-recovery-model?view=sql-server-ver16)
* [RESTORE ステートメント (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/restore-statements-transact-sql?view=sql-server-ver16)
* [RESTORE ステートメントの引数 (Transact-SQL](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/restore-statements-arguments-transact-sql?view=sql-server-ver16)
* [REPLACE](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/restore-statements-arguments-transact-sql?view=sql-server-ver16#replace)
