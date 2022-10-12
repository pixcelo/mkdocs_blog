# Node.js Express はじめかた
Node.jsでWebアプリを作ってみる<br>

## 実行手順
1. npm
```
npm init -y
npm install express --save
```
デフォルトのエントリーポイントは`app.js`になる<br>
違う名前（例えばindex.js）にしたい場合は`npm init`時に<br>
`entry point: (index.js)`と指定する

2. エントリーポイント(app.js)を作成
```javascript title="app.js"
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
```
3. 実行
localhost:3000にアクセスすると<br>
Hello World!と表示される
```
node app.js
```

## Reference
[Express](https://expressjs.com/)<br>
