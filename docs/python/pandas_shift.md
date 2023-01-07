---
tags:
  - Python
  - pandas
---

# Python pandas 時系列データ データフレームのshift

## Topic

`pandas`ライブラリで時系列データの差分を見たいときに使用する`shift()`について

## Usage

- `shift()`は指定した数だけ要素をずらすAPI
- 使用できるのはインデックスが`date` または `datetime`型の場合のみ

### diff()とshift()の違い
- `diff()`  データフレームやシリーズの各要素から、その1つ前の要素を引いた差を新しいデータフレームやシリーズとして返す
- `shift()` データフレームやシリーズの各要素を、指定した数だけずらす

### DataFrame.shift()

```py
df = pd.DataFrame({"Col1": [10, 20, 15, 30, 45],
                   "Col2": [13, 23, 18, 33, 48],
                   "Col3": [17, 27, 22, 37, 52]},
                  index=pd.date_range("2020-01-01", "2020-01-05"))

# df
            Col1	Col2	Col3
2020-01-01	10	    13  	17
2020-01-02	20	    23  	27
2020-01-03	15	    18  	22
2020-01-04	30	    33  	37
2020-01-05	45	    48  	52
```

### DataFrame.shift(periods=3)
`periods`に渡した分だけ縦方向にずれる

```py
df.shift(periods=3)

            Col1	Col2	Col3
2020-01-01	NaN	    NaN 	NaN
2020-01-02	NaN	    NaN 	NaN
2020-01-03	NaN	    NaN 	NaN
2020-01-04	10.0	13.0	17.0
2020-01-05	20.0	23.0	27.0
```

`fill_value`で`NaN`をゼロ埋めできる
```py
df.shift(periods=3, fill_value=0)

            Col1	Col2	Col3
2020-01-01	0    	0   	0
2020-01-02	0    	0   	0
2020-01-03	0    	0   	0
2020-01-04	10	  13  	17
2020-01-05	20	  23  	27
```

マイナスを引数に渡すと上側にずれる
```py
df.shift(periods=-1)

            Col1	Col2	Col3
2020-01-01	20.0	23.0	27.0
2020-01-02	15.0	18.0	22.0
2020-01-03	30.0	33.0	37.0
2020-01-04	45.0	48.0	52.0
2020-01-05	NaN	NaN	NaN
```

### DataFrame.shift(periods=1, axis="columns")
`axis="columns"`で横方向にずれる

```py
df.shift(periods=1, axis="columns")

            Col1	Col2	Col3
2020-01-01	NaN	10	13
2020-01-02	NaN	20	23
2020-01-03	NaN	15	18
2020-01-04	NaN	30	33
2020-01-05	NaN	45	48
```

### DataFrame.shift(periods=3, freq="D")
- freqDateOffsetのオプション
- freq="D"で、インデックス値をシフトして、データはそのままにする
```py
df.shift(periods=3, freq="D")

            Col1	Col2	Col3
2020-01-04	10	13	17
2020-01-05	20	23	27
2020-01-06	15	18	22
2020-01-07	30	33	37
2020-01-08	45	48	52
```

## Gist
- [shift.ipynb](https://gist.github.com/pixcelo/c948942611e82e4412f915cd5a0e032b)

## Reference
- [pandas](https://pandas.pydata.org/docs/)
- [DataFrame.shift](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.shift.html)