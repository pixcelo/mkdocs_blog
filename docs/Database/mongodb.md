---
tags:
  - MongoDB
---

# MongDB

- MongDBをmacにインストールしてから実行するまでのまとめ
- MongoDBの公式にMongoDB大学という学習用のサイトも参考にできる

https://university.mongodb.com

## 実行環境
* macOS Big Sur
* バージョン11.4

## インストール
    brew tap mongodb/brew
    brew install mongodb-community

## バージョン確認
    mongod --version

    db version v5.0.7
    Build Info: {
        "version": "5.0.7",
        "gitVersion": "b977129dc70eed766cbee7e412d901ee213acbda",
        "modules": [],
        "allocator": "system",
        "environment": {
            "distarch": "x86_64",
            "target_arch": "x86_64"
        }
    }

## 起動
    brew services start mongodb-community

    ==> Successfully started `mongodb-community` (label: homebrew.mxcl.mongodb-community)

## 停止
    brew services stop mongodb-community

    Stopping `mongodb-community`... (might take a while)

## サービスの状態を確認
    brew services list

    Name              Status     User  File
    mongodb-community started    xxxxx ~/Library/LaunchAgents/homebrew.mxcl.mongodb-community.plist
`Status`が`none`から`started`に変わっていれば、サービスが起動している

&nbsp;

# データベースの操作

## 接続
    > mongo
mongoシェルに接続される

## データベースの作成
    > use test_example_db

    switched to db test_example_db

## 接続中のデータベース名の確認
    > db

    est_example_db

## 接続中のデータベースの状態を確認
    > db.stats()
    {
        "db" : "test_example_db",
        "collections" : 0,
        "views" : 0,
        "objects" : 0,
        "avgObjSize" : 0,
        "dataSize" : 0,
        "storageSize" : 0,
        "totalSize" : 0,
        "indexes" : 0,
        "indexSize" : 0,
        "scaleFactor" : 1,
        "fileSize" : 0,
        "fsUsedSize" : 0,
        "fsTotalSize" : 0,
        "ok" : 1
    }
`collections`はRDBMSでいうテーブルに相当する<br/>
コレクションの中にドキュメント（RDBMSでいうレコード）を追加する

## ドキュメントの追加
    > db.stock.insert({date:202204280700, bid:13190.6, ask:13188.2});

    WriteResult({ "nInserted" : 1 })
INSERT文は、`db.コレクション名.コマンド名(オプション)`<br/>
`stock`コレクションに1件のドキュメントが追加される

 ## コレクションの参照
    > db.stock.find()
    { "_id" : ObjectId("626c53dd63c99ebcb415effa"), "date" : 202204280700, "bid" : 13190.6, "ask" : 13188.2 }
SELECT文は、`db.コレクション名.find()`<br/>
`_id`、`date`、`bid`、`ask`等のカラムをフィールドと呼ぶ<br/>
`_id` (主キー)は自動付与

## クエリセレクタ
    > db.stock.find({date:202204280700})
`find(条件)`で、コレクションの参照に条件を指定できる<br/>
複数条件は、`find(条件1, 条件2)`と指定する

## ドキュメントの更新
    > db.stock.update({date:202204280700}, {$set:{bid:12000.1}})

    WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
`db.コレクション名.update({フィールド名:条件}, {$set{フィールド名:更新する値}})`

## ドキュメントの削除
    > db.stock.remove({date:202204280700})

    WriteResult({ "nRemoved" : 1 })
DELETE文は、`db.コレクション名.remove(条件)`<br/>

# データのインポート
    mongoimport -db fd –collection test_example_db –type csv –file USTEC.csv –headerline
json、csv、tsv等のファイル形式をインポートできる

### 指定するオプション
* –db DB名
* –collection コレクション名
* –type 入力ファイル形式
* –file 入力ファイル名
* –headerline ヘッダ行の無視

## GUIツール
* [MongoDB Compass](https://www.mongodb.com/products/compass)
* [Robo 3T](https://robomongo.org/)

## Reference
- [MongoDB](https://www.mongodb.com/ja-jp)