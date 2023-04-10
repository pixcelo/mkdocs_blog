---
tags:
  - ブログ
---

# Stable Diffusionの使い方

- `Stable Diffusion`とはテキストから画像を生成するAIサービス
- 自然言語によるテキストでの指示（プロンプト）を使用して画像を生成する
- 無料・商用利用が可能

他にも競合サービスとして、他にも以下のものがある
- [DALL・E2](https://openai.com/product/dall-e-2)
- [Midjourney](https://www.midjourney.com/home/?callbackUrl=%2Fapp%2F)
- [nightcafe](https://nightcafe.studio/)

## 環境

以下のSPECのMacBookで作業を進める

- プロセッサ：2 GHz クアッドコアIntel Core i5
- グラフィックス：Intel Iris Plus Graphics 1536 MB 
- メモリ：16 GB 3733 MHz LPDDR4X

## Usage

### Web環境

[Stable Diffusion Playground](https://stablediffusionweb.com/#demo)でWebUIから使える

## ローカル環境

当PCのSPECでは、VRAMが要件を満たしていないので割愛

## プロンプト

- 思い通りの画像を生成するには、プロントにも工夫が必要
- プロンプトを検索するサービス[Lexica](https://lexica.art/)などを利用する

### プロンプトのコツ

左側にあるものほど優先される
重みづけ`()`で囲む
ポジティブプロンプト
ネガティブプロンプト
モデルデータ

## Reference
- [Stable Diffusion](https://github.com/CompVis/stable-diffusion)
- [Stable Diffusion Online](https://stablediffusionweb.com/)
- [Docker](https://github.com/fboulnois/stable-diffusion-docker)