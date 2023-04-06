---
tags:
  - Python
  - 環境構築
---

# Python venvで仮想環境の構築

- `venv`はPythonの標準機能
- pipでインストール不要

## Usage

### 仮想環境の作成
`python3 -m venv [仮想環境名]` で仮想環境のフォルダを作成
```
python3 -m venv env
```

実行すると仮想環境名のフォルダが作成される
```
env
├── bin
├── include
└── lib
    └── python3.9
```

`pyvenv.cfg`というファイルに実行するインタープリターの情報が入る
```cfg title="pyvenv.cfg"
home = /Library/Frameworks/Python.framework/Versions/3.9/bin
include-system-site-packages = false
version = 3.9.3
```

### 仮想環境の有効化
`source [仮想環境名]/bin/activate` で仮想環境を有効化
```
source env/bin/activate
```
- ターミナルの表示が([仮想環境名])となる
- `source`の代わりに`.`でも仮想環境を有効化できる
```
. env/bin/activate
```

### 仮想環境の無効化
`deactivate` で仮想環境をdeactivate無効化
```
deactivate
```

仮想環境の削除は、単純にenvフォルダを削除すればOK

## `.gitignore`の設定

仮想環境フォルダを`git`管理から除外する設定

```git
# Created by https://www.toptal.com/developers/gitignore/api/venv
# Edit at https://www.toptal.com/developers/gitignore?templates=venv

### venv ###
# Virtualenv
# http://iamzed.com/2009/05/07/a-primer-on-virtualenv/
.Python
[Bb]in
[Ii]nclude
[Ll]ib
[Ll]ib64
[Ll]ocal
pyvenv.cfg
[Ss]cripts
.venv
pip-selfcheck.json

# End of https://www.toptal.com/developers/gitignore/api/venv
```

## Reference
- [venv](https://docs.python.org/ja/3/library/venv.html)
- [.gitignore](https://www.toptal.com/developers/gitignore/api/venv)