---
tags:
  - Python
---

# Python Pyenvdで複数のバージョンを管理する

## Topic

Pythonのバージョン管理・開発によって切り替えを行う

## 初期設定

インストール

```
brew install pyenv
```

Zshにパスを通す

```
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

## Usage

### インストールできるPythonのバージョンを確認する

```
pyenv install --list
```

### Pythonのバージョンを指定してインストールする

```
pyenv install 3.11.1
```

### pyenv経由でインストール済みのバージョンを確認する

```
pyenv versions
```

### バージョンを切り替える

```
pyenv global 3.11.1
```

## Reference
- [Pyenv](https://github.com/pyenv/pyenv)
- [Set up your shell environment for Pyenv](https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv)


