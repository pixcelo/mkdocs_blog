---
tags:
  - C#
  - ML.NET
  - 機械学習
  - データサイエンス
---

# C# Visual Studio と ML.NET Model Builderで機械学習モデルを作成する

## Topic

Visual Studio とモデルビルダー機能を使って機械学習を行う

`ML.NET`は、OSS・クロスプラットフォームの .NET 用機械学習フレームワーク

- Windows
- Visual Studio

Model Builderで出来ること

- データの分類: トピック別のニュース記事の整理
- 数値の予測: 住宅価格の見積もり
- 類似した特性を持つ項目のグループ化: 顧客のセグメント化
- 項目の推奨: 推奨ムービー
- 画像の分類: コンテンツに基づく画像のタグ付け
- 画像内の被写体の検出: 交差点での歩行者と自転車の検出

## Usage

センサーデータを使用して、デバイスにメンテナンスが必要なタイミングを自動的に予測したい

### シナリオの選択

物体検出のみ、ローカルCPU環境でのサポート対象外

- データ分類: バイナリおよびマルチクラス分類…トピック別に記事を整理する
- 値の予測:	Linear regression (線形回帰)…住宅の特徴に基づいて住宅価格を予測する
- 画像分類:	画像分類 (ディープ ラーニング)…画像の内容に基づいて動物種別に画像を整理する
- 推奨:	推奨…類似ユーザーの好みに基づいてムービーを推奨する
- オブジェクトの検出: 物体検出 (ディープ ラーニング)…画像内の物理的な損傷を特定する

### データソース

以下の読み込みをサポート

- CSV、TSV
- SQLServer
- jpg・png
- ビジュアル オブジェクト タグ付けツール (VOTT) (物体検出シナリオ向け)

## Reference
- [ML.NET Model Builder を使用して、予測メンテナンスのために機械学習モデルをトレーニングする](https://learn.microsoft.com/ja-jp/training/modules/predictive-maintenance-model-builder/)
- [モデル ビルダーの概要としくみ](https://learn.microsoft.com/ja-jp/dotnet/machine-learning/automate-training-with-model-builder)