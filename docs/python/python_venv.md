---
tags:
  - Python
---

# Python venvで仮想環境の構築

- `venv`はPythonの標準機能
- pipでインストール不要

## Usage

`python3 -m venv [仮想環境名]` で仮想環境のフォルダを作成
```
python3 -m venv env
```

`source [仮想環境名]/bin/activate` で仮想環境を有効化
```
source env/bin/activate
```
- ターミナルの表示が([仮想環境名])となる
- `source`の代わりに`.`でも仮想環境を有効化できる
```
. env/bin/activate
```
<br><br>

`deactivate` で仮想環境をdeactivate無効化
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
- [virtualenv](https://www.python.jp/install/macos/virtualenv.html)
- [.gitignore](https://github.com/github/gitignore/blob/main/Global/VirtualEnv.gitignore)