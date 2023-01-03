---
tags:
  - Python
---

# Python joblibでタスクを並列化する

`joblib`は、大規模なデータを効率的に扱うためのPythonライブラリ

タスクを順次実行するのではなく、パイプラインを使用して並列実行することで高速化を実現する

## joblibの特徴

- メモリ内で処理できない大規模なデータをファイルに保存して読み込む
- 複数のコアを使用して並列処理を行う
- 処理済みの結果をキャッシュすることで、再利用する

機械学習のモデルをトレーニングする際のデータが大規模である場合、`joblib`を使用することで、データを分割して並列処理を行うことができる

処理済みの結果をキャッシュすることで、同じデータで再度トレーニングを行う場合には、処理をスキップできる

## Install

```
pip install joblib
```

## Usage
```py
import math
import time
from joblib import Parallel, delayed

t2 = time.time()
# n_jobsはCPUのコア数を指定 (-1を引数に渡すと最大限のコア数を使用する)
result = Parallel(n_jobs=2)(delayed(math.factorial)(x) for x in range(8000))
t1 = time.time()

print(t2-t1) # 5.432750225067139
```

## Reference
- [jonlib](https://joblib.readthedocs.io/en/latest/)