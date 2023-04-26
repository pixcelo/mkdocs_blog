

```
from fredapi import Fred
import pandas as pd

# FRED APIキーをセット
api_key = 'your_api_key'
fred = Fred(api_key=api_key)

# 金利データの取得 (例: 10年米国債金利)
interest_rate_data = fred.get_series('GS10')
interest_rate_df = pd.DataFrame(interest_rate_data, columns=['Interest Rate'])

# 為替レートデータの取得 (例: 米ドル/ユーロ)
exchange_rate_data = fred.get_series('DTWEXB')
exchange_rate_df = pd.DataFrame(exchange_rate_data, columns=['Exchange Rate'])

print(interest_rate_df)
print(exchange_rate_df)

```