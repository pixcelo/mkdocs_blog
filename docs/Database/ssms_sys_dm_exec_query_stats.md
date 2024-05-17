---
tags:
  - SQL
  - SQLServer
  - SSMS
---

# sys.dm_exec_query_statsによるクエリパフォーマンス統計情報の表示

sys.dm_exec_query_statsは、SQL Serverの動的管理ビュー (DMV) の一つで、SQL Serverインスタンス上で実行されたクエリのパフォーマンス統計情報を提供する

クエリの実行計画に関連する統計情報を収集し、クエリのパフォーマンスの最適化やトラブルシューティングに役立つ

## 主なカラム
sys.dm_exec_query_statsビューの主なカラムは以下の通り

| カラム名                | 説明                                                             |
|-------------------------|------------------------------------------------------------------|
| sql_handle              | SQLテキストのハンドル。クエリの実際のSQLテキストを取得するために使用 |
| statement_start_offset  | SQLテキスト内のステートメントの開始位置                           |
| statement_end_offset    | SQLテキスト内のステートメントの終了位置                           |
| plan_handle             | クエリ実行計画のハンドル                                         |
| creation_time           | クエリ実行計画がキャッシュされた時間                               |
| last_execution_time     | クエリが最後に実行された時間                                      |
| execution_count         | クエリが実行された回数                                           |
| total_worker_time       | クエリの累計CPU時間 (マイクロ秒)                                 |
| total_physical_reads    | クエリの累計物理読み取り回数                                     |
| total_logical_reads     | クエリの累計論理読み取り回数                                     |
| total_logical_writes    | クエリの累計論理書き込み回数                                     |
| total_elapsed_time      | クエリの累計経過時間 (マイクロ秒)                                |

## 使用例
sys.dm_exec_query_statsを使用して、最もリソースを消費するクエリを特定する例

```sql
SELECT 
    qs.sql_handle,
    qs.plan_handle,
    qs.execution_count,
    qs.total_worker_time,
    qs.total_physical_reads,
    qs.total_logical_reads,
    qs.total_logical_writes,
    qs.total_elapsed_time,
    SUBSTRING(st.text, (qs.statement_start_offset/2) + 1,
        ((CASE qs.statement_end_offset
            WHEN -1 THEN DATALENGTH(st.text)
            ELSE qs.statement_end_offset
        END - qs.statement_start_offset)/2) + 1) AS query_text
FROM 
    sys.dm_exec_query_stats AS qs
CROSS APPLY 
    sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY 
    qs.total_worker_time DESC;
```

このクエリは、クエリごとの累計CPU時間が多い順にソートされたクエリのリストを取得する

sys.dm_exec_sql_text関数を使用して、SQLテキストを取得してる

## 注意点
sys.dm_exec_query_statsビューの情報はクエリプランキャッシュに基づいている

SQL Serverが再起動されるか、キャッシュがクリアされるとリセットされる

高頻度のクエリや長時間実行されるクエリのパフォーマンスチューニングに役立つが、すべてのクエリの完全な履歴を保持するわけではない

## まとめ
sys.dm_exec_query_statsは、SQL Serverのパフォーマンスモニタリングやトラブルシューティングのための強力なツール

クエリの効率性を分析し、改善するために頻繁に使用される

## Reference
- [sys.dm_exec_query_stats](https://learn.microsoft.com/ja-jp/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-query-stats-transact-sql?view=sql-server-ver16)