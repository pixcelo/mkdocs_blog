# JavaScirpt クロージャとプライベート変数
JavaScript クロージャの使用例

## クロージャとは
クロージャとは、レキシカルスコープ（参照可能な外部の関数スコープ）を参照している状態のこと<br>

## ソースコード
1. ON・OFFを切り替えるスイッチ<br>
```html
<body>
    <button id="btn" type="button">
        button
    </button>

    <script>
        const fnFactory = function() {
            et flg = true;

            const fn = function () {
                flg = !flg;
                alert(flg);
            }

            return fn;
        }

        const fn = fnFactory();

        const btn = document.getElementById('btn');
        btn.addEventListener('click', function() {
            fn();
        });
    </script>
</body>
</html>
```

`fnFactory`の中で宣言された`flg`変数は`fn`関数からのみ参照される<br>
プライベートな変数として宣言されるので、他から変更されることがない

```javascript
const fnFactory = function() {
    let flg = true;

    const fn = function () {
        flg = !flg;
        alert(flg);
    }

    return fn;
}

const fn = fnFactory();
```

2. 数値を加算するカウンター<br>
1ずつ加算する関数なら、下記のように書ける<br>
```javascript
const fnFactory = function() {
    let n = 0;

    function count() {
        alert(n);
        n++;
    }

    return count;
}

const fn = fnFactory();
```

## JSFiddle
<iframe width="100%" height="300" src="//jsfiddle.net/teckk/25ht1fj8/29/embedded/js,html,result/dark/" allowfullscreen="allowfullscreen" allowpaymentrequest frameborder="0"></iframe>

<iframe width="100%" height="300" src="//jsfiddle.net/teckk/d1knL52q/1/embedded/js,html,result/dark/" allowfullscreen="allowfullscreen" allowpaymentrequest frameborder="0"></iframe>

## Reference
[クロージャ](https://developer.mozilla.org/ja/docs/Web/JavaScript/Closures)
