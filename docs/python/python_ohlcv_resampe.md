---
tags:
  - Python
---

# OHLCVデータのPythonでのリサンプリング

OHLCVデータとは、株価や暗号通貨などの金融データを表す際に使われるフォーマットの一つ

これは、

- Open（始値）
- High（高値）
- Low（安値）
- Close（終値）
- Volume（取引量）

の頭文字をとったもの

こうしたデータをリサンプリングすることで、異なる時間枠のデータセットを生成することが可能になる

例： 1分ごとのデータを日ごとのデータに変換する等

この記事では、Pythonを使用してOHLCVデータをリサンプリングする方法について詳しく解説する

## 1. データの準備

まず、pandasライブラリを使用して、データをロードする

```py
import pandas as pd

# CSVファイルからデータをロード
df = pd.read_csv('ohlcv_data.csv', index_col='Date', parse_dates=True)
print(df.head())
```

この例では、Dateをインデックスとして設定し、日付として認識させるために`parse_dates=True`を指定している

## 2. リサンプリングの基本

リサンプリングは、pandasのresampleメソッドを使用して行う

このメソッドを使用すると、データを異なる時間間隔で集約することができる


例: 1日ごとのデータを1週間ごとにリサンプリング
```py
resampled = df.resample('W').ohlc()
print(resampled.head())
```

ここでの'W'は週次を意味する<br>
他のオプションとしては、'D'（日次）、'M'（月次）、'Q'（四半期）などがある

## 3. OHLCVデータのリサンプリング

OHLCVデータをリサンプリングする際には、各カラムに適切な集約関数を適用する必要がある

- O (Open): 最初の値
- H (High): 最大値
- L (Low): 最小値
- C (Close): 最後の値
- V (Volume): 合計

以下のように実装できる


```py
resampled_ohlcv = df.resample('W').agg({
    'Open': 'first',
    'High': 'max',
    'Low': 'min',
    'Close': 'last',
    'Volume': 'sum'
})
print(resampled_ohlcv.head())
```

## 4. ビジュアル化

リサンプリングしたデータを視覚的に確認するために、matplotlibを使用してプロットすることができる

```py
import matplotlib.pyplot as plt

# リサンプリングデータのCloseカラムをプロット
resampled_ohlcv['Close'].plot(figsize=(10, 6))
plt.title('Weekly Resampled Close Price')
plt.xlabel('Date')
plt.ylabel('Close Price')
plt.show()
```

## 5. 注意点

リサンプリングは、大量のデータを高レベルの視点から分析するのに役立つが、データの細部を見落とす可能性がある

短い時間枠のデータをリサンプリングして長い時間枠のデータを作成する場合、情報の損失が発生する可能性がある

## 6. 実装例
MT5からダウンロードしたヒストリカルデータからリサンプリングするクラスの実装例

以下のクラスは、インスタンス化した時にpandasデータフレームを受け取り、指定した時間足にリサンプリングを行う

返り値は、リサンプリングした時間足を結合したデータフレーム

```py
import pandas as pd

class ResampleData:
    def __init__(self, df: pd.DataFrame, resample_period: str = '5T', prefix: str = '5min_'):
        self.df = df
        self.resample_period = resample_period
        self.prefix = prefix
        
    def resample_data(self):
        # Convert the 'time' column to datetime type and set it as the index
        self.df['time'] = pd.to_datetime(self.df['time'])
        self.df.set_index('time', inplace=True)

        df_resampled = self.df.resample(self.resample_period).agg({
            'open': 'first',
            'high': 'max',
            'low': 'min',
            'close': 'last',
            'tick_volume': 'sum'
        })
        
        # Rename columns based on the provided prefix
        df_resampled.columns = [f"{self.prefix}{col}" for col in df_resampled.columns]
        return df_resampled
    
    def fill_missing_values(self, df_merged):
        df_merged[f"{self.prefix}open"].fillna(method='ffill', inplace=True)
        df_merged[f"{self.prefix}high"].fillna(method='ffill', inplace=True)
        df_merged[f"{self.prefix}low"].fillna(method='ffill', inplace=True)
        df_merged[f"{self.prefix}close"].fillna(method='ffill', inplace=True)
        df_merged[f"{self.prefix}tick_volume"].fillna(method='ffill', inplace=True)
        return df_merged
    
    def merge_data(self):
        df_resampled = self.resample_data()
        df_merged = self.df.join(df_resampled, how='left')
        df_filled = self.fill_missing_values(df_merged)
        return df_filled
```

使用例
```py
from resampler import ResampleData

file_name = '../csv/EURUSD_1_20220801_to_20230801.csv'
df = pd.read_csv(file_name)

# クラスのインスタンス化
resampler_df = ResampleData(df)
df = resampler_df.merge_data()
```

## まとめ

OHLCVデータのリサンプリングは、異なる時間枠でのデータ解析を可能にする重要な手法である

Pythonのpandasライブラリを使用すると、簡単かつ効率的にリサンプリングを実施することができる

データの時間枠を変更することで、異なる視点からのデータ分析やビジュアル化を行うことができ、より深い洞察を得ることが期待できる

