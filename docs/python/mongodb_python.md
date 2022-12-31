---
tags:
  - Python
---

# Pythonでmongodbを使用する

## python用クライアントのインストール
    pip3 install pymongo

## データベースに接続する
    from pymongo import MongoClient
    client = MongoClient('127.0.0.1', 27017)
    collection = client.test_db.stock
`collection = client.db名.collection名`

## コレクションの値を取得する
    for data in collection.find():
        print(data)

    {'_id': ObjectId('626cc5bcaf27256be7e8a516'), 'Date': '202204010700', 'open_bid': '14918.5', 'high_bid': '14918.5', 'low_bid': '14910.4', 'close_bid': '14911.1', 'open_ask': '14919', 'high_ask': '14919', 'low_ask': '14911.7', 'close_ask': '14912.9'}
    ...
MongoDBのクエリと同じようにpythonで問い合わせができる

## pandasのデータフレームに格納する
    df = pd.DataFrame(collection.find())
    print(df.head())
