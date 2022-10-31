# ヒストリカルデータを取得する
ヒストリカルデータとは、金融商品の過去の相場の値動きのこと<br>
主に分析や戦略構築、バックテストに利用する<br>

## 仮想通貨のヒストリカルデータ
サイトによってcsvでダウンロードできたり、Rest APIで取得できたりと様々<br>
プログラムから読み込むとなると、RESTやwebsocketに対応したサイトからデータを取得したい

[Blockchain.com](https://www.blockchain.com/)<br>
ブロックチェーン上の様々なデータを取得できる<br>
[Blockchain.com APIs](https://www.blockchain.com/explorer/api) にAPIが充実してる

[cryptowatch](https://cryptowat.ch/ja-jp)<be>
単純にkline等、時系列データを取得するだけならcryptowatch<br>
[Market Data REST API](https://docs.cryptowat.ch/rest-api) APIドキュメントが見やすい<br>

[Cryptocurrency APIs](https://cryptocointracker.com/crypto-apis)<br>
様々な仮想通貨に関連したAPIを横断検索できるサイト<br>
[Binance Crypto Candlestick Charts](https://cryptocointracker.com/api/binance-klines)のように各画面からAPIを実際に叩くことが可能<br>
