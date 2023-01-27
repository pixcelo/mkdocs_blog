---
tags:
  - JavaScript
---

# JavaScript オブジェクトの配列を結合する (重複あり・なし)

## Topic

- オブジェクトの配列を結合
- オブジェクトの配列を重複を削除して結合

## Usage

`{id: 3, name: 'Jack'}` は重複データとして用意した

```js
const arry1 = [
    {id: 1, name: 'Tom'},
    {id: 2, name: 'Bob'},
    {id: 3, name: 'Jack'}
];

const arry2 = [
    {id: 3, name: 'Jack'},
    {id: 4, name: 'Robert'},
    {id: 5, name: 'Mary'}
];
```

## オブジェクトの配列を結合(重複あり)

`concat()`で配列を結合

```js
const arry3 = arry1.concat(arry2);

// 0: {id: 1, name: 'Tom'}
// 1: {id: 2, name: 'Bob'}
// 2: {id: 3, name: 'Jack'}
// 3: {id: 3, name: 'Jack'}　<- 重複している
// 4: {id: 4, name: 'Robert'}
// 5: {id: 5, name: 'Mary'}
```

スプレッド構文でも同じ結果になる

```js
const arry3 = [...arry1, ...arry2];
```

## オブジェクトの配列を結合(重複なし)

`reduce()`で重複を削除

```js
const arry4 = [...arry1, ...arry2]
.reduce((prev, current) => {
    prev[current.id] = current;
    return prev;
}, ['']);

const arry5 = arry4.filter(n => n);

// 0: {id: 1, name: 'Tom'}
// 1: {id: 2, name: 'Bob'}
// 2: {id: 3, name: 'Jack'}　<- 重複していない
// 3: {id: 4, name: 'Robert'}
// 4: {id: 5, name: 'Mary'}
```

## 補足

`reduce()`は配列に対して、要素の数だけ同じ処理が行える

- `previousValue`…前回までの配列の状態が入る
- `currentValue`…順番に配列の要素が渡ってくる
- `initialValue`…`previousValue`の初期値になる

`filter()`で`empty`や`""`(空文字)を削除できる

```js
arry.reduce((previousValue, currentValue) => {
    // do something...
}, initialValue);
```


## Reference
- [.reduce()](https://js.studio-kingdom.com/javascript/array/reduce)
- [Array.prototype.reduce() MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)
- [Array.prototype.filter()](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
