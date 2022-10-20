# JavaScirpt クロージャ
JavaScript クロージャの使用例

## クロージャとは
クロージャとは、レキシカルスコープ（参照可能な外部の関数スコープ）を参照している状態のこと

## ソースコード
オン・オフを切り替えるスイッチの例
```html



```

<button id="btn" type="button">
    Add to favorites
</button>
<script>
    const btn = document.getElementById('btn');
    btn.addEventListener('click', function() { alert('clicked') } );
<script>

## Reference
[クロージャ](https://developer.mozilla.org/ja/docs/Web/JavaScript/Closures)
