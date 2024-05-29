---
tags:
  - SQL
  - SQLServer
  - SSMS
---

# SQLServer SSMS のバージョンを確認する

SQLServeはバージョンによって実行できないT-SQLがある（新しい文法は古いバージョンでサポートされていない）<br>
実行環境のバージョンを確認したいときに使用

 ## Usage
```sql
SELECT @@VERSION

-- Microsoft SQL Server 2019 (RTM-CU12) (KB5004524) - 15.0.4153.1 (X64)  	Jul 19 2021 15:37:34  	Copyright (C) 2019 Microsoft Corporation 	Express Edition (64-bit) on Windows 10 Pro 10.0 <X64> (Build 19045: ) (Hypervisor) 
```

データベースから新しいクエリを選択して<br>
![version](img/ssms_version.png)

`SELECT @@VERSION`を入力すると、結果が表示される<br>
![version](img/ssms_version_result.png)

## Reference
 - [SQL Server データベース エンジンのどのバージョンとエディションを実行するかを決定する](https://learn.microsoft.com/ja-jp/troubleshoot/sql/releases/find-my-sql-version)