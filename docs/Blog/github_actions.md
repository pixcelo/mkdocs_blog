
---
tags:
  - ブログ
  - CI/CD
---

# GitHub Actions によるCI/CD

メモ
- 継続的インテグレーション
- 継続的デプロイ

## ワークフロー構文の要素

mkdocsのGitHub Actionsは、何をやっているか？

```yml
# ワークフローの名前。 省略可能ではあるものの、推奨される項目
name: ci

# ワークフローをトリガーするイベントまたはイベントの一覧
on:
  push:
    branches:
      - main

# 実行するジョブの一覧。 ワークフローには 1 つ以上のジョブを含めることができる
jobs:
  deploy:
    # どのランナーを使用するかをアクションに指示（ランナーとは、GitHub Actions ワークフローを実行するコンピューティング リソース）
    runs-on: ubuntu-latest
    # ジョブのステップの一覧です。 1 つのジョブ内のステップは、同じランナー上で実行される
    steps:
      # どの定義済みアクションを取得する必要があるかをアクションに指示
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: 3.x
      # ランナー上でコマンドを実行するようにジョブに指示
      - run: pip install mkdocs-material
      - run: mkdocs gh-deploy --force
```

[ワークフローをトリガーするイベント](https://docs.github.com/ja/actions/using-workflows/events-that-trigger-workflows)のページで、どんなイベントを`on:`でトリガーできるかを確認できる

ワークフローに複数のジョブが含まれている場合は、並列で実行される（`needs`で依存関係を定義すると、「ジョブAが終わるのを待機してからジョブBを実行」のような指定も可能

## 学習用リソース

https://github.com/skills/hello-github-actions

https://docs.github.com/ja/actions/quickstart

## Reference
- [GitHub Actions ドキュメント](https://docs.github.com/ja/actions)
- [ワークフロー構文](https://docs.github.com/ja/actions/using-workflows/workflow-syntax-for-github-actions)