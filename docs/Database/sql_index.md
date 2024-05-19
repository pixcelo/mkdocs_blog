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

## 付加列インデックスとは
付加列インデックスは、クエリにおいてインデックス列の値を検索する際に、その値を持つ行が含まれていることが分かるようなインデックスのこと

付加列インデックスを使用すると、インデックスをキーとして迅速にデータにアクセスできる

これにより、クエリのパフォーマンスが向上し、検索速度が向上する

```sql
CREATE INDEX index1 ON schema1.table1 (column1) INCLUDE (column2, column3);
```
この例では、column1 に対するインデックスが作成され、column2 と column3 が付加されている

column1 をキーとしてデータを迅速に検索でき、同時に column2 と column3 の値も取得できる

## インデックス設計のポイント

### インデックス設計の流れ
- クエリを実行後、実行プランを確認
- ボトルネックを見つける
- インデックスを作成した後、実行プランを確認して効果を検証する

- 良いselectivityが得られる最小カラム構成
- SELECT句でしか使わないカラムは基本、付加列にする
- できるだけ少ないインデックスで、クエリの最適化をはかる

## インデックスの設計タイミング

### テーブルが追加される場合
- 実行を想定されるクエリをすべて作成してリストアップ
- 各クエリに対して、最適なインデックスを設計する（個別最適）
- 個別最適されたインデックスをまとめる（全体最適）

### 既存クエリをチューニングする場合
- チューニングしたいクエリ（ボトルネック）に最適なインデックスを設計（個別最適）
- 既存インデックスとまとめらえるインデックスをまとめる（全体最適）

インデックスが効かないケースに注意
- 暗黙の型変換が行われる場合 => 文字列はきちんと`'`で囲むべき
- カラムが加工されている場合
- LIKE句で%から始まる場合

## Reference
- [インデックス](https://learn.microsoft.com/ja-jp/sql/relational-databases/indexes/indexes?view=sql-server-ver16&source=recommendations)
- [付加列インデックスの作成](https://learn.microsoft.com/ja-jp/sql/relational-databases/indexes/create-indexes-with-included-columns?view=sql-server-ver16)
- [クラスター化インデックス](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-index-transact-sql?view=sql-server-ver16#clustered-indexes)
- [CREATE INDEX (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/statements/create-index-transact-sql?view=sql-server-ver16)
- [SQL Server と Azure SQL のインデックスのアーキテクチャとデザイン ガイド](https://learn.microsoft.com/ja-jp/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16)