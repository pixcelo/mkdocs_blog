---
tags:
  - Python
---

# Python webSoketsで双方向通信を行う

## Topic 

PythonライブラリのwebSocketでリアルタイムに通信する

## Install

```
pip install websockets
```

## Usage

`server.py`は、クライアントから名前を受け取り、挨拶を送信する

```py title="server.py"
#!/usr/bin/env python

import asyncio
import websockets

async def hello(websocket):
    name = await websocket.recv()
    print(f"<<< {name}")

    greeting = f"Hello {name}!"

    await websocket.send(greeting)
    print(f">>> {greeting}")

async def main():
    async with websockets.serve(hello, "localhost", 8765):
        await asyncio.Future()  # run forever

if __name__ == "__main__":
    asyncio.run(main())
```

`client.py`は、サーバーに名前を送信し、挨拶を受け取る

```py title="client.py"
#!/usr/bin/env python

import asyncio
import websockets

async def hello():
    uri = "ws://localhost:8765"
    async with websockets.connect(uri) as websocket:
        name = input("What's your name? ")

        await websocket.send(name)
        print(f">>> {name}")

        greeting = await websocket.recv()
        print(f"<<< {greeting}")

if __name__ == "__main__":
    asyncio.run(hello())

```

`server.py`を起動後、`client.py`を実行すると、メッセージのやり取りができる

```
What's your name? tom 
>>> tom
<<< Hello tom!
```

## Reference
- [websockets](https://websockets.readthedocs.io/en/stable/index.html)
- [Quick start](https://websockets.readthedocs.io/en/stable/howto/quickstart.html)