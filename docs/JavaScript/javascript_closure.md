# JavaScirpt クロージャ
JavaScript クロージャの使用例

## クロージャとは
クロージャとは、レキシカルスコープ（参照可能な外部の関数スコープ）を参照している状態のこと

## ソースコード
オン・オフを切り替えるスイッチの例
```html
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button id="btn" type="button">
        button
    </button>

    <p id="txt"></p>

    <script>
        const fnFactory = function() {
            let flg = true;

            const fn = function () {
                flg = !flg;
                document.getElementById('txt').textContent =  flg .toString();
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

<div>
    <input if="btn" type="button" value="button">
    <p id="txt"></p>
</div>
<script>
const fnFactory = function() {
  let flg = true;

	const fn = function () {
		flg = !flg;
		document.getElementById('txt').textContent =  flg .toString();
	}

  return fn;
}

const fn = fnFactory();

const btn = document.getElementById('btn');
btn.addEventListener('click', function() {
  fn();
});

</script>

## jsfiddle
<script async src="//jsfiddle.net/teckk/25ht1fj8/22/embed/js,html,result/dark/"></script>

## Reference
[クロージャ](https://developer.mozilla.org/ja/docs/Web/JavaScript/Closures)
