---
tags:
  - JavaScript
---

# JavaScript 連想配列を扱う

JavaScriptで連想配列(オブジェクト)を扱う方法

## 連想配列

### オブジェクトの定義

連想配列は`JavaScript`オブジェクトを用いて、データを`Key`と`Value`のペアで扱える配列

```javascript
const rabbit = {
    // key: value
    'name': 'ウサギ',
    'height': 40,
    'color': '白',
}
```

### オブジェクトの値を取得

* `Key`に対応した`Value`を取得できる
* 値の取得方法は、`.`でつなげるドット記法、`[property name]`で取得するブラケット記法の2種類
* 変数で指定する等、可変的にオプジェクトのプロパティにアクセスしたいときはブラケット記法を利用する

```javascript
console.log(rabbit.color);
// 白

console.log(rabbit["name"]);
// ウサギ
```

### オブジェクトを入れ子にする

```javascript
const zoo = {
    'rabbit':{
        'name': 'ウサギ',
        'height': 40,
        'color': '白',
    },
    'cat':{
        'name': 'ネコ',
        'height': 30,
        'color': '黒',
    }
}

console.log(zoo['cat']['name']);
// ネコ
```

連想配列の中に、さらに入れ子で連想配列を入れることも可

上記例をドット記法で取得するなら、`zoo.cat.color`となる

### 連想配列オブジェクトのループ

`for in`でオブジェクトのプロパティ`key`を取得できる

```javascript
for (const prop in rabbit) {
    console.log(prop);
}
// "name" "height" "color"
```

`value`を取得したい場合はブラケット記法でアクセスすればよい

```javascript
for (const prop in rabbit) {
    console.log(rabbit[prop]);
}
// "ウサギ" 40 "白"
```

## Reference
[Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object)<br>
[オブジェクトでの作業](https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Working_with_Objects)<br>
