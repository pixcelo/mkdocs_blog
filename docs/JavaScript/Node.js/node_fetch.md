# Node.js node-fetch APIでデータを取得する
node-fetchを使用する

## Usage
インストール
```
npm install node-fetch
```

実装
```javascript
import fetch from 'node-fetch';

async function fetchData () {
    const response = await fetch('https://nodejs.org/api/documentation.json');
    const body = await response.text();

    console.log(body);
}
```

TypeScriptを使う場合、`@type`を追加する
```
npm install --save @types/node-fetch
```

## Reference
[node-fetch](https://www.npmjs.com/package/node-fetch)<br>
[@types/node-fetch](https://www.npmjs.com/package/@types/node-fetch)
