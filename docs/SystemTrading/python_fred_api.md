---
tags:
  - Python
---

# PythonでFREDから10年米国債金利を取得する

```py
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

結果
```
            Interest Rate
1953-04-01           2.83
1953-05-01           3.05
1953-06-01           3.11
1953-07-01           2.93
1953-08-01           2.95

            Exchange Rate
1995-01-04        94.3497
1995-01-05        94.0717
1995-01-06        94.3577
1995-01-09        94.3348
1995-01-10        94.5032
```