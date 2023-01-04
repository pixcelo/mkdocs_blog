---
tags:
  - Python
---

# Python numbaを用いたPythonの高速化

- `numba`は、関数を最適化し、高速化することができるPythonライブラリ
- LLVMコンパイラライブラリを用いて、Python関数を実行時に最適化されたマシンコードに変換する

## Install

```py
pip install numba
```

## Usage

高速化したい関数に `@jit` デコレータを付ける

```py
import numba

@numba.jit
def func(x):
    return x**2
```

### 2つのコンパイルモード
- `@jit`
- `@jit(nopython=True)`

`@jit`デコレータを指定して`Python`無しモードでのコンパイルに失敗した場合、オブジェクトモードで再度関数をコンパイルする（遅くなる）

`@jit(nopython=True)`でコンパイルに失敗した場合は、例外が発生する

## 高速化されないケース

- リスト内包表記やジェネレータ式
- 任意の長さの文字列を扱う文字列メソッド
- 高階関数 (map、filter、reduce)
- yield 文を含むジェネレータ

- 関数内で import 文を使用している場合
- 関数内で exec 文を使用している場合
- 関数内で eval 関数を使用している場合
- 関数内で __import__ 関数を使用している場合
- 関数内で sys.exit() を使用している場合

## Reference
- [numba](https://numba.pydata.org/)
- [A ~5 minute guide to Numba](https://numba.pydata.org/numba-doc/latest/user/5minguide.html)
- [Performance Tips](https://numba.pydata.org/numba-doc/latest/user/performance-tips.html#performance-tips)
- [Numpy Support in numba](https://numba.pydata.org/numba-doc/0.14/numpy_support.html)