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

`pybotters.Client`の引数に`apis`を指定しない場合、実行ファイルと同じディレクトリにある`apis.json`を読み込む

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
            await store.orderbook.wait()

if __name__ == '__main__':
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass
```

## Update

更新があれば、`--upgrade`でインストールする

```
pip install --upgrade pybotters
```

## Reference
- [pybotters](https://github.com/MtkN1/pybotters)
- [pybotters wiki](https://github.com/MtkN1/pybotters/wiki)
- [pybotters PDF](https://pybotters.readthedocs.io/_/downloads/ja/latest/pdf/)
- [bybit Example](https://github.com/MtkN1/pybotters/wiki/Example)
- [bybit.py](https://github.com/MtkN1/pybotters/blob/main/pybotters/models/bybit.py)
- [BYBIT testnet](https://testnet.bybit.com/ja-JP/)
- [orderBookL2_25](https://bybit-exchange.github.io/docs/futuresV2/inverse/#t-publictopics)