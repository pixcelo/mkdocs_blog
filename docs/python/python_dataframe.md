---
tags:
  - Python
---

# Python PandasのDataFrame操作方法まとめ

## 基本操作
インポート
```py
import pandas as pd
```

### CSV読み込み
```py
df = pd.read_csv("data.csv")
```

### データ数を確認
```py
df.shape
```

### 先頭から行を表示
```py
# 引数を渡さない場合、先頭の5行が返る
df.head(10)
```

### 最後尾から行を表示
```py
# 引数を渡さない場合、最後尾の5行が返る
df.tail(10)
```

### 行数を指定して表示
```Py
# 5~10行目を表示
df[5:10]
```

### 行を取得
```py
df.loc['行名']
df.loc[['行名','行名']] # 複数行
```

### 行数を表示
```py
print(len(df))
```

### データ型の確認
```py
data = pd.read_csv('data.csv')
print(data.info())
# non-null 欠損値を確認できる
# object 文字列が存在する
```

### 欠損値の確認
```py
df.isnull() # 欠損値が含まれていればTrue
df.isnull().sum() #欠損値の数を表示する
```
※notnull()で欠損値でない数を確認

### 欠損値の行を削除
```py
df.dropna()
```

### 欠損値の補完
```py
df.fillna(0)
```

### カラムの平均値を求める
```py
df['age'].mean()
```

### Nanのデータを取り出す
```py
sample_nan_data = df[df["age"].isnull()]
```

### 基本統計量を確認する
```py
df.describe()
# count: データの個数
# mean: 平均値
# std: 標準偏差
# min: 最小値
# 25%: 第一四分位数
# 50%: 第二四分位数(中央値)
# 75%: 第三四分位数
# max: 最大値
```

### 特徴量の加工
複数カラムを抜き出す
```py
select_columns = ['age','height','weight']
print(data[select_columns])
```

## Reference
- [pandas](https://pandas.pydata.org/)
- [DataFrame](https://pandas.pydata.org/docs/reference/frame.html)