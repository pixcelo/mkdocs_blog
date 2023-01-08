---
tags:
  - Python
---

# Python iniファイル

## Topic

iniファイルで外部に設定ファイルを作成する

## Usage

設定ファイルをプログラムから作成する
```py
import configparser
config = configparser.ConfigParser()
config['DEFAULT'] = {'ServerAliveInterval': '45',
                     'Compression': 'yes',
                     'CompressionLevel': '9'}
config['bitbucket.org'] = {}
config['bitbucket.org']['User'] = 'hg'
config['topsecret.server.com'] = {}
topsecret = config['topsecret.server.com']
topsecret['Port'] = '50022'     # mutates the parser
topsecret['ForwardX11'] = 'no'  # same here
config['DEFAULT']['ForwardX11'] = 'yes'
with open('example.ini', 'w') as configfile:
  config.write(configfile)
```

作成された設定ファイル
```ini title="example.ini"
[DEFAULT]
ServerAliveInterval = 45
Compression = yes
CompressionLevel = 9
ForwardX11 = yes

[bitbucket.org]
User = hg

[topsecret.server.com]
Port = 50022
ForwardX11 = no
```

設定ファイルを読み込む
```py
import configparser
config = configparser.ConfigParser()
config.sections()

config.read('example.ini')

config.sections()

'bitbucket.org' in config

'bytebong.com' in config

config['bitbucket.org']['User']

config['DEFAULT']['Compression']

topsecret = config['topsecret.server.com']
topsecret['ForwardX11']

topsecret['Port']

for key in config['bitbucket.org']:  
    print(key)

config['bitbucket.org']['ForwardX11']
```

- `ini`ファイルへのアクセスは、辞書型のように行う
- セクション内の各キーは大文字小文字を区別せず、全て小文字で保存されていることにも注意する

## Reference
- [configparser --- 設定ファイルのパーサー](https://docs.python.org/ja/3/library/configparser.html)
- [Python 言語リファレンス](https://docs.python.org/ja/3/reference/index.html)