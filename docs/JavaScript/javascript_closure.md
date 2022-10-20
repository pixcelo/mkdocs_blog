# JavaScirpt クロージャ
JavaScript クロージャの使用例

## クロージャとは
クロージャとは、レキシカルスコープ（参照可能な外部の関数スコープ）を参照している状態のこと<br>

## ソースコード
1. ON・OFFを切り替えるスイッチ
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

## jsfiddle
<iframe width="100%" height="300" src="//jsfiddle.net/teckk/25ht1fj8/29/embedded/js,html,result/dark/" allowfullscreen="allowfullscreen" allowpaymentrequest frameborder="0"></iframe>

2. 数値を加算するカウンター
```html
```

## Reference
[クロージャ](https://developer.mozilla.org/ja/docs/Web/JavaScript/Closures)
