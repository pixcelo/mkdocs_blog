---
tags:
  - Python
  - pandas
---

# Python pandasで時系列データのリサンプリング

## Topic

1分足から1時間足などの上位足を作る方法

## Resample

`DataFrame.resample()`

- 時間軸でグループ化できる
- 時間をindexとする

## Usage

- `resample`の第一引数には`rule`として時間間隔を渡す
- アップサンプリング … より高い解像度（短い周期）に変換し、データ量は増加する
- ダウンサンプリング … より低い解像度（長い周期）に変換し、データ量は減少する

```py
import pandas as pd

df = pd.DataFrame({
    'date': pd.date_range('2022-01-01', periods=10, freq='D'),
    'value': range(10)
})

# アップサンプリング
df_upsampled = df.set_index('date').resample('12H').asfreq()

# ダウンサンプリング
df_downsampled = df.set_index('date').resample('2D').mean()
```

## Reference
- [pandas](https://pandas.pydata.org/docs/)
- [Resampling](https://pandas.pydata.org/docs/reference/resampling.html)
- [cookbook Resampling](https://pandas.pydata.org/pandas-docs/stable/user_guide/cookbook.html#cookbook-resample)
- [Time series Resampling](https://pandas.pydata.org/pandas-docs/stable/user_guide/timeseries.html#resampling)
- [DataFrame.resample](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.resample.html)