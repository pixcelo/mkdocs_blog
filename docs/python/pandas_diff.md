---
tags:
  - Python
  - pandas
---

# Python pandas データフレームのdiff

## Topic

`pandas`ライブラリでデータフレームの差分を見たいときに使用する`diff()`について

## Usage

- `diff()`は差分を計算して返すAPI
- `difference`の意

```py
df = pd.DataFrame({'a': [1, 2, 3, 4, 5, 6],
                   'b': [1, 1, 2, 3, 5, 8],
                   'c': [1, 4, 9, 16, 25, 36]})

# df
	a	b	c
0	1	1	1
1	2	1	4
2	3	2	9
3	4	3	16
4	5	5	25
5	6	8	36
```

### DataFrame.diff()
前のインデックス（一つ上の行）との差分が表示される

```py
df.diff()

    a	b	c
0	NaN	NaN	NaN
1	1.0	0.0	3.0
2	1.0	1.0	5.0
3	1.0	1.0	7.0
4	1.0	2.0	9.0
5	1.0	3.0	11.0
```

### DataFrame.diff(axis=1)
- 前列(一つ左の列)との差分が表示される
- `axis`の数値を指定する

```py
df.diff(axis=1)

	a	b	c
0	NaN	0	0
1	NaN	-1	3
2	NaN	-1	7
3	NaN	-1	13
4	NaN	0	20
5	NaN	2	28
```

### DataFrame.diff(periods=3)
- 指定した数だけ前の行との差分が表示される
- `periods`の数値を指定する

```py
df.diff(periods=3)

    a	b	c
0	NaN	NaN	NaN
1	NaN	NaN	NaN
2	NaN	NaN	NaN
3	3.0	2.0	15.0
4	3.0	4.0	21.0
5	3.0	6.0	27.0
```

#### 補足 変化率はpct_change

差分ではなく、変化率をみたい場合は`pct_change()`を使う

## Gist
- [diff.ipynb](https://gist.github.com/pixcelo/28263e36ae349ea69f36e9522bf100f2)

## Reference
- [pandas](https://pandas.pydata.org/docs/)
- [DataFrame.diff](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.diff.html#pandas.DataFrame.diff)
- [DataFrame.pct_change](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.pct_change.html)