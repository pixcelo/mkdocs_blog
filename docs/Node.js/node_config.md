# Node.js 設定ファイルを作成する
設定ファイルをjsonファイルに持つ方法
npmの`config`を使用する

## Usage
インストール
```
npm install config
```
## 実装
```json title="default.json"
{
  "User": {
    "firstName": "Tom",
    "lastName": "Smith"
  }
}
```

jsonファイルを読み行む
```javascript
import config from 'config';

const firstName = config.get('User.firstName');
console.log(firstName);
```

TypeScriptを使う場合<br>
```
npm install --save @types/config
```

## Reference
[config](https://www.npmjs.com/package/config)
[@types/config](https://www.npmjs.com/package/@types/config)
