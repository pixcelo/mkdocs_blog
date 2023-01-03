---
tags:
  - Python
---

# Python クラスをモジュールとして呼ぶ

Pythonでクラスをモジュール化して、別のファイルから呼び出す

## Usage

### import

```py
import [クラス名]
```

```py
import [関数名]
```

```py
import [モジュール名].[関数名]
```

クラスをモジュールとして定義
```py title="person.py"
class Person:
    def __init__(self, name):
        self.name = name

    def get_name(self):
        return self.name
```

`import`した後、クラスをインスタンス化する
```py
import person

man = person.Person('Tom')
print(man.get_name())
```

### from import
```py
from [モジュール名] import [関数名]
```

## Reference
- [インポートシステム](https://docs.python.org/ja/3/reference/import.html)
- [Python 言語リファレンス](https://docs.python.org/ja/3/reference/index.html)
