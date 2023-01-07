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

`resample`の第一引数には`rule`として時間間隔を渡す

```py
start, end = '2000-10-01 23:30:00', '2000-10-02 00:30:00'
rng = pd.date_range(start, end, freq='7min')
ts = pd.Series(np.arange(len(rng)) * 3, index=rng)

# ts
2000-10-01 23:30:00     0
2000-10-01 23:37:00     3
2000-10-01 23:44:00     6
2000-10-01 23:51:00     9
2000-10-01 23:58:00    12
2000-10-02 00:05:00    15
2000-10-02 00:12:00    18
2000-10-02 00:19:00    21
2000-10-02 00:26:00    24
Freq: 7T, dtype: int64
```

`resample()`
```py
ts.resample('17min').sum()

2000-10-01 23:30:00     9
2000-10-01 23:45:00    21
2000-10-02 00:00:00    33
2000-10-02 00:15:00    45
Freq: 15T, dtype: int64
```

## Reference
- [pandas](https://pandas.pydata.org/docs/)
- [Resampling](https://pandas.pydata.org/docs/reference/resampling.html)
- [cookbook Resampling](https://pandas.pydata.org/pandas-docs/stable/user_guide/cookbook.html#cookbook-resample)
- [Time series Resampling](https://pandas.pydata.org/pandas-docs/stable/user_guide/timeseries.html#resampling)
- [DataFrame.resample](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.resample.html)