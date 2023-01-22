---
tags:
  - Python
---

# Python 仮想通貨トレード用ライブラリ pybottersでwebsocketを購読する

## Topic

- bybitの板情報を取得する
- `pybotters`でwebsocketデータをサブスクライブする

## Install

```
pip install pybotters
```

## Usage

jsonにAPIキーを用意

```json title="apis.json"
apis = {
    "bybit_testnet": ["BYBIT_API_KEY", "BYBIT_API_SECRET"]
}
```

`pybotters.Client`の引数に`apis`を指定しない場合、Pythonの実行カレントディクレリに配置した`apis.json`を読み込む

[apis の暗黙的な読み込み](https://pybotters.readthedocs.io/ja/latest/Advanced-Usage.html#apis)

```py
import asyncio
import pybotters

test_net = 'https://api-testnet.bybit.com'

async def main():
    async with pybotters.Client(base_url=test_net) as client:
        store = pybotters.BybitUSDTDataStore()

        wstask = await client.ws_connect(
            'wss://stream.bybit.com/realtime',
            send_json={'op': 'subscribe', 'args': [
                'orderBookL2_25.BTCUSD',
            ]},
            hdlr_json=store.onmessage,
        )

        while not all([
            len(store.orderbook),
        ]):
            await store.wait()

        while True:
            orderbook = store.orderbook.find()
            print(orderbook)

if __name__ == '__main__':
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass
```

## データのアクセス方法

websocketで受信したデータは`DataStore`クラスに格納される

`store = pybotters.BybitUSDTDataStore()`

`DataStore`クラスへのアクセスは`find()`を使う

```py
# orderbookの全てを表示
print(store.orderbook.find())

# orderbookのBuyのみ表示
print(store.orderbook.find({'side': 'Buy'}))
```

`pandas`のデータフレームに入れる

```py
df = pd.DataFrame(store.orderbook.find())
print(df)

       price  symbol         id  side    size
0   22809.50  BTCUSD  228095000   Buy  241867
1   22809.00  BTCUSD  228090000   Buy  105768
2   22821.50  BTCUSD  228215000  Sell     451
3   22810.00  BTCUSD  228100000  Sell  113707
4   22804.50  BTCUSD  228045000   Buy   55545
5   22804.00  BTCUSD  228040000   Buy   52485
```

## Update

更新があれば、`--upgrade`でインストールする

```
pip install --upgrade pybotters
```

## Reference
- [pybotters](https://github.com/MtkN1/pybotters)
- [pybotters latest](https://pybotters.readthedocs.io/ja/latest/index.html)
- [pybotters wiki](https://github.com/MtkN1/pybotters/wiki)
- [pybotters PDF](https://pybotters.readthedocs.io/_/downloads/ja/latest/pdf/)
- [bybit Example](https://github.com/MtkN1/pybotters/wiki/Example)
- [bybit.py](https://github.com/MtkN1/pybotters/blob/main/pybotters/models/bybit.py)
- [BYBIT testnet](https://testnet.bybit.com/ja-JP/)
- [bybit Base endpoints](https://bybit-exchange.github.io/docs/futuresV2/linear/#t-websocketauthentication)
- [orderBookL2_25](https://bybit-exchange.github.io/docs/futuresV2/inverse/#t-publictopics)