# Node.js Redisの使い方
node-redisを使用する

## Usage
インストール
```
npm i redis
```

### 実装
```javascript
import { createClient } from 'redis';

const client = createClient();

client.on('error', (err) => console.log('Redis Client Error', err));

await client.connect();

await client.set('key', 'value');
const value = await client.get('key');
```

上記のコードで簡単にインサートができる
```
127.0.0.1:6379> get key
"value"
```
デフォルトで接続されるポート番号は`6379`<br>
違うポートに接続するには、インスタンス作成時にポート番号を指定する<br>
`redis[s]://[[username][:password]@][host][:port][/db-number]:`
```javascript
createClient({
    url: 'redis://alice:foobared@awesome.redis.server:6380'
});
```

## RedisでJSONを扱う
RedisにJSONを格納するには、RedisサーバーにRedisJSON（Redisモジュール）をロードする<br>
https://github.com/RedisJSON/RedisJSON
```c
redis-server --loadmodule ./target/release/librejson.dylib
```

モジュールを読み込んだ状態で`node-redis`から呼び出す
```javascript
import { createClient } from 'redis';

const client = createClient();

client.on('error', (err) => console.log('Redis Client Error', err));

await client.connect();

await client.json.set('noderedis:jsondata', '$', {
    name: 'Roberta McDonald',
    pets: [
      {
        name: 'Rex',
        species: 'dog',
        age: 3,
        isMammal: true
      },
      {
        name: 'Goldie',
        species: 'fish',
        age: 2,
        isMammal: false
      }
    ]
});

const results = await client.json.get('noderedis:jsondata', {
    path: [
      '.pets[1].name',
      '.pets[1].age'
    ]
});

console.log(results);
// { '.pets[1].name': 'Goldie', '.pets[1].age': 2 }
```

## Reference
[node-redis](https://www.npmjs.com/package/redis)<br>
[GitHub node-redis](https://github.com/redis/node-redis)<br>

[RedisJSON](https://redis.io/docs/stack/json/)<br>
[GitHub RedisJSON](https://github.com/RedisJSON/RedisJSON)<br>

[Redis modules](https://redis.com/blog/redis-as-a-json-store/)<br>
[How to cache JSON data in Redis with Node.js](https://developer.redis.com/howtos/redisjson/using-nodejs/)<br>
