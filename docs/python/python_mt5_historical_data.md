---
tags:
  - Python
---

# MT5とPythonの連携：ヒストリカルデータ取得

## MT5とPythonの連携で金融データ分析が可能

金融分析において、リアルタイムの市場データを用いることは非常に重要である

MT5は盛んに使われている金融取引プラットフォームだが、分析のためにPythonといったデータサイエンス向け言語と連携することで、更なる活用が期待できる

PythonからMT5にアクセスすることで、任意の期間のTICKデータを取得でき、pandasなどを使った効率的なデータ処理が実現が可能となる

Pythonの金融データ処理のメリットとMT5との連携方法についてまとめる

## MT5データをPythonで取得・加工するコード

MT5にPythonから接続し、指定した期間の価格データを取得してpandasのDataFrameに変換し、CSVファイルとして保存する処理

```py
import MetaTrader5 as mt5
import pandas as pd
from datetime import datetime, timezone
import pytz
import os

try:
    # MT5に接続
    if not mt5.initialize():
        print("initialize() failed, error code =", mt5.last_error())
        quit()

    # タイムゾーンをUTCに設定する
    symbol = "EURUSD"
    timeframe = mt5.TIMEFRAME_M1
    timezone = pytz.timezone("Etc/UTC")
    utc_from = datetime(2022, 8, 1, tzinfo=timezone)
    utc_to = datetime(2023, 8, 1, hour = 13, tzinfo=timezone)
    rates = mt5.copy_rates_range(symbol, timeframe, utc_from, utc_to)

    if rates is None:
        raise Exception("No data received, error code =", mt5.last_error())

    if len(rates) == 1:
        rates = [rates[0]]

    # DataFrameに変換
    df = pd.DataFrame(rates,
        columns=['time', 'open', 'high', 'low', 'close', 'tick_volume', 'spread', 'real_volume'])

    # タイムスタンプを変換
    df['time'] = pd.to_datetime(df['time'], unit='s')

    # CSVファイルとして保存
    csv_folder = 'csv'
    if not os.path.exists(csv_folder):
        os.makedirs(csv_folder)

    from_date_str = utc_from.strftime("%Y%m%d")
    to_date_str = utc_to.strftime("%Y%m%d")
    csv_file = os.path.join(csv_folder, f'{symbol}_{timeframe}_{from_date_str}_to_{to_date_str}.csv')
    df.to_csv(csv_file, index=False)

    print(f"{csv_file} has been saved.")

except Exception as e:
    print("An error occurred:", str(e))

finally:
    # MT5との接続を閉じる
    mt5.shutdown()
```

実行すると、以下のようなCSVファイルを取得できる

```bash
time,open,high,low,close,tick_volume,spread,real_volume
2022-08-01 00:00:00,1.02083,1.02083,1.02083,1.02083,1,183,0
2022-08-01 00:03:00,1.02083,1.02083,1.02083,1.02083,1,183,0
2022-08-01 00:05:00,1.02083,1.02111,1.02083,1.02111,5,155,0
2022-08-01 00:06:00,1.02111,1.02111,1.02111,1.02111,1,155,0
2022-08-01 00:07:00,1.02111,1.02134,1.02102,1.02134,9,68,0
```

**MT5への接続とデータ取得**

initialize()で接続し、copy_rates_range()で任意期間のTickデータを取得できる

**タイムゾーン変換**

timezoneを意識してUTCに揃えることで、時刻のずれを防ぐ

**pandasでのデータフレーム処理**

取得データをpandasのDataFrameに変換することで、柔軟なデータの扱いが可能に

**CSVでの保存**

後の再利用のためにCSVファイルで保存

<br>
<br>
このように、Pythonを使ってMT5データを扱う処理を実装できる

複数のMT5をインストールしている場合、mt5.initialize()は自動的にMT5を見つけに行く

特定のMT5を指定したい場合は、フルパスを引数に渡す

```py
file_path = "C:\\Program Files\\OANDA MetaTrader 5 Terminal\\terminal64.exe"

if not mt5.initialize(path=file_path):
    print("initialize() failed, error code =", mt5.last_error())
    quit()
```

## 金融データ分析のPython活用事例

このようにして取得したデータを使って、以下のような金融データ分析をPythonで行うことができる

**技術分析指標の計算・可視化**

移動平均線、ボリンジャーバンドなどの技術分析を実施

**機械学習による価格予測モデル**

LSTMなどの手法を用いた価格予測AIの構築

**統計的手法による異常検知**

変動の統計解析により、異常な変動を検知

**自動売買システムのバックテスト**

戦略のシミュレーションによるバックテスト

このように、MT5とPythonを連携することで、高度な金融データ分析が可能となる

## Reference
- [Pythonとの統合のためのMetaTraderモジュール](https://www.mql5.com/ja/docs/python_metatrader5)