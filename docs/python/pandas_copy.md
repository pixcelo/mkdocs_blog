---
tags:
  - Python
  - pandas
---

# Python pandas データフレームのコピー

## Topic

`pandas`ライブラリでデータフレームのコピーについて

## Usage

- `copy()`はオブジェクトのインデックスとデータのコピーを作成するAPI
- `copy(deep=true)`  値渡し（新しいオブジェクトへの変更は、元のオブジェクトに反映されない）※デフォルト
- `copy(deep=false)` 値渡し（新しいオブジェクトへの変更は、元のオブジェクトにも反映される）

```py

```


## Gist
- [diff.ipynb](https://gist.github.com/pixcelo/28263e36ae349ea69f36e9522bf100f2)

## Reference
- [pandas](https://pandas.pydata.org/docs/)
- [DataFrame.copy](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.copy.html)