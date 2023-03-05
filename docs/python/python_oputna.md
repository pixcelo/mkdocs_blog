---
tags:
  - Python
  - 機械学習
---

# Python OptunaでLightGBMのハイパーパラメータを最適化する

- Optunaは、機械学習のハイパーパラメータの自動調整を行うライブラリ

手順

1. Optunaをインストール
2. LightGBM用の目的関数を定義(目的関数では、Optunaが提供するtrialオブジェクトからハイパーパラメータをサンプリングし、LightGBMのモデルを作成して評価)
3. Optunaのstudyオブジェクトを作成し、目的関数を渡して最適化を実行(studyオブジェクトでは、最適化回数や交差検証法などの設定ができる)
4. studyオブジェクトから最適なハイパーパラメータや評価指標などの結果を取得

## Install

```
pip install optuna
```

## Usage

```py
```

## Reference
- [optuna](https://optuna.org/)
