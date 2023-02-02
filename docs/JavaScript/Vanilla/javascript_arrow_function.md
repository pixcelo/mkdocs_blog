# JavaScript関数宣言・関数式、アロー関数の違い

JavaScriptにおける関数（`Function`オブジェクト）の宣言方法とそれらの特徴についてまとめる

## 関数宣言
- 関数の巻き上げ（ホイスティング）が実行される
- 同じ名前の関数を書くと後に書いた方が優先される
- `this`は呼び出し方によって参照先が変化する

```javascript:tile=関数宣言
function foo() {
    console.log('foo');
}
```

## 関数式
- 変数や引数に入れることができる
- varで宣言してもホイスティングで関数は定義されず`undefined`がセットされる
- `let`、`const`で宣言すると重複できない

```javascript:tile=関数式
const foo = function() {
    console.log('foo');
}
```

## アロー関数
- `arguments`変数が自動で定義されない
- 引数名が重複できない
- `this`はメソッドが属するオブジェクトを指す

```javascript:tile=アロー関数
const foo = () => {
    console.log('foo');
}

// 引数が1つの場合、引数のカッコを省略できる
const foo = n => {};

// 処理が1行の場合、中カッコとreturnを省略できる
const add = n => n + 1;
```

## Reference
[MDN Function](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Function)<br>
[MDN 関数宣言](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Statements/function)<br>
[MDN 関数式](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/function)<br>
[MDN アロー関数式](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Functions/Arrow_functions)<br>
