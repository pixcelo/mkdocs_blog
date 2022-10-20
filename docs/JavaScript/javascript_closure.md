# JavaScirpt クロージャ
JavaScript クロージャの使用例

## クロージャとは
クロージャとは、レキシカルスコープ（参照可能な外部の関数スコープ）を参照している状態のこと

## ソースコード
オン・オフを切り替えるスイッチの例
```html



```
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



<script async src="//jsfiddle.net/teckk/25ht1fj8/20/embed/js,html,result/dark/"></script>

## Reference
[クロージャ](https://developer.mozilla.org/ja/docs/Web/JavaScript/Closures)
