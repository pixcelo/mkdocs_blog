---
tags:
  - Python
---

# Python jsonファイルを読み込む

## Usage
```json
{
    "key1": "AAA",
    "key2": "BBB"
}
```

```py
import json

json_open = open('./config/config.json', 'r')
json_load = json.load(json_open)

print(json_load) # {'key1': 'AAA', 'key2': 'BBB'}
print(json_load['key1']) # AAA
```

jsonが多層の場合
```json
{
    "key1":{
        "name": "Tom",
        "number": 1
    },

    "key2":{
        "name": "Bob",
        "number": 2
    }
}
```

```py
import json

json_open = open('./config/config.json', 'r')
json_load = json.load(json_open)

print(json_load['key1']['name']) # Tom
```

## Reference
- [json](https://docs.python.org/ja/3/library/json.html#module-json)
- [Python 言語リファレンス](https://docs.python.org/ja/3/reference/index.html)
