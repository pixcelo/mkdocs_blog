---
tags:
  - Python
---

# PythonのSciPyでのピーク（極大値・極小値）の検出方法

## 1. はじめに

データ解析を行う際に、データセットのピーク（極大値や極小値）を検出したい場合がある

特に、金融や物理学の分野で、特定の時系列データの振る舞いを調査するときにこの方法が役立つ

この記事では、PythonのSciPyライブラリのfind_peaks関数を使用して、ピークの検出方法を解説する

[scipy reference](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.find_peaks.html)


## 2. find_peaks関数の基本

find_peaksは、SciPyのsignalモジュールに含まれている

この関数を使用すると、1次元のデータセットから極大値を効率的に検出することができる

基本的な使用方法は以下のようになる

```py
from scipy.signal import find_peaks

data = [1, 3, 7, 1, 2, 6, 3, 2, 1]
peaks, _ = find_peaks(data)
print(peaks)
```

出力:
```bash
[2, 5]
```

この例では、dataの3番目（インデックスは2）と6番目（インデックスは5）にピークが存在する


## 3. ピーク検出のパラメータ

find_peaks関数は、さまざまなパラメータを持っており、これらのパラメータを調整することで検出の精度を向上させることができる

主なパラメータとして以下のものがある

- height:      ピークの高さの制約を指定
- threshold:   ピークの隣接点との関係を考慮するためのしきい値を指定
- distance:    2つのピーク間の最小距離を指定
- prominence:  ピークがどれだけ顕著であるかの指標を指定