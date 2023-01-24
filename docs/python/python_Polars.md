---
tags:
  - Python
---

# Python Polarsによるデータフレーム

## Topic

- `Polars`はpandasのようにデータをデータフレームとして扱えるPythonライブラリ
- Rustで書かれているため高速

## Install

```
pip install polars
```

CSVを読み込むサンプル

## Usage
```py
import polars as pl

df = pl.read_csv("https://j.mp/iriscsv")
print(df.filter(pl.col("sepal_length") > 5)
      .groupby("species", maintain_order=True)
      .agg(pl.all().sum())
)
```

C#のlinqのような書き味でフィルタリングが出来ている

```
shape: (3, 5)
┌────────────┬──────────────┬─────────────┬──────────────┬─────────────┐
│ species    ┆ sepal_length ┆ sepal_width ┆ petal_length ┆ petal_width │
│ ---        ┆ ---          ┆ ---         ┆ ---          ┆ ---         │
│ str        ┆ f64          ┆ f64         ┆ f64          ┆ f64         │
╞════════════╪══════════════╪═════════════╪══════════════╪═════════════╡
│ setosa     ┆ 116.9        ┆ 81.7        ┆ 33.2         ┆ 6.1         │
│ versicolor ┆ 281.9        ┆ 131.8       ┆ 202.9        ┆ 63.3        │
│ virginica  ┆ 324.5        ┆ 146.2       ┆ 273.1        ┆ 99.6        │
└────────────┴──────────────┴─────────────┴──────────────┴─────────────┘
```

## Reference
- [polars](https://www.pola.rs/)
- [Getting started](https://pola-rs.github.io/polars-book/user-guide/quickstart/intro.html)
- [API reference](https://pola-rs.github.io/polars/py-polars/html/reference/)