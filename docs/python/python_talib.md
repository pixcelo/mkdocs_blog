---
tags:
  - Python
---

# Python TA-Libを用いた金融市場データの分析

- `TA-Lib`とは金融市場データの技術分析に使われるpythonライブラリ
- `Cython`と`Numpy`を用いることで高速化を実現している

## Install

```
pip install TA-Lib
```

## Usage
```py
import numpy
import talib

close = numpy.random.random(100)
output = talib.SMA(close)
```

## 代表的なテクニカル指標

### 単純移動平均 (Simple Moving Average)
```py
output = SMA(close, timeperiod=20) # デフォルトではcloseで計算される
output = SMA(open, timeperiod=20, price='open') # openで計算する場合
```

### ボリンジャーバンド (Bollinger Bands)
```py
upperband, middleband, lowerband = BBANDS(close, timeperiod=5, nbdevup=2, nbdevdn=2, matype=0)
```

### MACD (Moving Average Convergence/Divergence)
```py
macd, macdsignal, macdhist = MACD(close, fastperiod=12, slowperiod=26, signalperiod=9)
```

### RSI (Relative Strength Index)
```py
real = RSI(close, timeperiod=14)
```

### ATR (Average True Range)
```py
real = ATR(high, low, close, timeperiod=14)
```

## Reference
- [TA-Lib](https://mrjbq7.github.io/ta-lib/)
- [TA-Lib Documentation](https://mrjbq7.github.io/ta-lib/doc_index.html)