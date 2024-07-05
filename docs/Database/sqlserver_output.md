---
tags:
  - SQLServer
  - SQL
---

# SQLServerのOUTPUT句：実務での活用例と利点

SQL ServerのOUTPUT句は、データ操作言語（DML）ステートメントの実行結果を取得するための機能

この記事では、OUTPUT句の基本的な使い方と、実務で役立つ具体的な使用例を紹介する

## OUTPUT句の基本

OUTPUT句は、INSERT、UPDATE、DELETE、MERGEステートメントと共に使用でき、影響を受けた行のデータを返す

基本的な構文は以下の通り
```sql
<DML文> OUTPUT <出力列リスト> INTO <テーブルまたは変数>
```

## Usage

実務での使用例
1. 削除された行のログ記録
顧客データを削除する際に、削除された情報を監査テーブルに記録する例：
```sql
DECLARE @DeletedCustomers TABLE (
    CustomerID INT,
    Name NVARCHAR(100),
    DeletedDate DATETIME
)

DELETE FROM Customers
OUTPUT 
    deleted.CustomerID,
    deleted.Name,
    GETDATE() AS DeletedDate
INTO @DeletedCustomers
WHERE LastPurchaseDate < DATEADD(YEAR, -5, GETDATE())

-- 削除された顧客の情報を監査テーブルに挿入
INSERT INTO CustomerDeletionLog (CustomerID, Name, DeletedDate)
SELECT CustomerID, Name, DeletedDate FROM @DeletedCustomers
```
この例では、5年以上購入のない顧客を削除し、その情報を一時テーブル変数に格納した後、監査テーブルに挿入している
<br />


2. 更新前後の値の比較
製品価格を更新する際に、更新前後の価格を記録する例：
```sql
DECLARE @PriceChanges TABLE (
    ProductID INT,
    OldPrice DECIMAL(10,2),
    NewPrice DECIMAL(10,2),
    ChangeDate DATETIME
)

UPDATE Products
SET Price = Price * 1.10  -- 10%値上げ
OUTPUT 
    inserted.ProductID,
    deleted.Price AS OldPrice,
    inserted.Price AS NewPrice,
    GETDATE() AS ChangeDate
INTO @PriceChanges
WHERE CategoryID = 5  -- 特定のカテゴリの製品のみ

-- 価格変更ログを記録
INSERT INTO PriceChangeLog (ProductID, OldPrice, NewPrice, ChangeDate)
SELECT ProductID, OldPrice, NewPrice, ChangeDate FROM @PriceChanges
```
この例では、特定カテゴリの製品価格を10%上げ、変更前後の価格を記録している
<br />

3. 一括挿入時の生成されたIDの取得
新規注文とその詳細を同時に挿入し、生成された注文IDを取得する例：
```sql
DECLARE @NewOrders TABLE (OrderID INT)

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
OUTPUT inserted.OrderID INTO @NewOrders
VALUES (1001, GETDATE(), 500.00)

DECLARE @NewOrderID INT
SELECT @NewOrderID = OrderID FROM @NewOrders

-- 注文詳細の挿入
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
    (@NewOrderID, 101, 2, 150.00),
    (@NewOrderID, 102, 1, 200.00)
```
この例では、新しい注文を挿入し、自動生成された注文IDを取得して、それを使って注文詳細を挿入している

## OUTPUT句の利点

- パフォーマンス向上: 別の SELECT ステートメントを実行する必要がなく、一度の操作で結果を取得できる
- 整合性の確保: トランザクション内で操作と結果の取得が行われるため、データの整合性が保たれる
- コードの簡略化: 複数のステートメントを1つにまとめることができ、コードがシンプルになる
- エラー処理の改善: 操作の結果をすぐに確認できるため、エラー処理が容易になる

例に挙げたOUTPUT句を実際にテストするための環境はGistにアップした

https://gist.github.com/pixcelo/dcd579d179987c4c9bbcbf9979e44086

## Reference
- [OUTPUT 句 (Transact-SQL)](https://learn.microsoft.com/ja-jp/sql/t-sql/queries/output-clause-transact-sql?view=sql-server-ver16)