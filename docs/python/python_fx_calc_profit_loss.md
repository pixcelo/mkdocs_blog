---
tags:
  - Python
---

# FX取引の損益計算

## 基本的な計算方法
外貨同士の通貨ペア（例：ユーロドルやポンドドル）での損益計算は以下の式に基づく

取引数量(ロット) × 値幅 (pips) × 対象通貨円レート = 損益

ここで、

- 取引数量: トレードで使用する通貨の数量（例：50,000通貨）
- 値幅: エントリー時のレートとポジション決済時のレートの差
- 対象通貨円レート: 通貨ペアの右側の通貨の対円レート

**ドル円 (USD/JPY) の場合**

取引数量(ロット) × 値幅 (pips)  = 損益

## Pythonでの損益計算

Pythonを使用して上記の損益計算を行う場合のコードは以下の通り

スプレッド [ 売りレート(Bid)と買いレート(Ask)の差 ]を加味した関数で定義した

スプレッドはポイントからpipsに変換する処理を追加

```py
def calculate_pl(symbol, position, lot_size, entry_rate, exit_rate, spread_points, usd_jpy_rate=146):
    if symbol[-3:] == "JPY" or symbol[:3] == "JPY":
            spread_pips = spread_points / 100  # e.g., for pairs like USDJPY
        else:
            spread_pips = spread_points / 10000

    if position == "long":
        entry_rate_with_spread = entry_rate + spread_pips
        exit_rate_with_spread = exit_rate
        diff = exit_rate - entry_rate_with_spread
    elif position == "short":
        entry_rate_with_spread = entry_rate
        exit_rate_with_spread = exit_rate + spread_pips
        diff = entry_rate - exit_rate_with_spread
    else:
        raise ValueError("Invalid position type. Choose 'long' or 'short'.")
    
    # For pairs like EURUSD
    if symbol[-3:] != "JPY":
        return lot_size * diff * usd_jpy_rate
    
    # For pairs like USDJPY
    elif symbol[:3] == "USD":
        return lot_size * diff
    
    # For cross currency pairs like EURJPY
    else:
        return lot_size * diff * entry_rate_with_spread
```

実行例
```bash
test_eurusd = calculate_pl("EURUSD", "long", 50000, 1.02083, 1.0976, 0.0002)
test_usdjpy = calculate_pl("USDJPY", "short", 50000, 110.00, 110.20, 0.02)
print(test_eurusd, test_usdjpy)
# -421135.0000000002, -10999.999999999944
```

OANDAの[証拠金・損益シミュレーション](https://www.oanda.jp/lab-education/margin/)なども損益計算に利用できる