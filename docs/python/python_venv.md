---
tags:
  - Python
---

# Python venvで仮想環境の構築

- `venv`はPythonの標準機能
- pipでインストール不要

## Usage

envフォルダ作成
```
python3 -m venv env
```

env有効化
```
source venv/bin/activate
```

env無効化
```
deactivate
```

仮想環境の削除は、単純にenvフォルダを削除すればOK

## `.gitignore`の設定
```
# Virtualenv
# http://iamzed.com/2009/05/07/a-primer-on-virtualenv/
.Python
[Bb]in
[Ii]nclude
[Ll]ib
[Ll]ib64
[Ll]ocal
[Ss]cripts
pyvenv.cfg
.venv
pip-selfcheck.json
```

## Reference
- [venv](https://docs.python.org/ja/3/library/venv.html)
- [.gitignore](https://github.com/github/gitignore/blob/main/Global/VirtualEnv.gitignore)