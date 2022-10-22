# JavaScriptで指定した要素だけを印刷する
例えば、指定したidを持つHTML要素だけを印刷したいときの方法

## Usage
1. 印刷しない要素に`display:none;`を付与する<br>
2. 印刷するための場所に印刷対象を移動
3. 印刷前の状態に戻す

非表示にするだけだと表示が崩れる場合があるので<br>
HTML要素自体を操作するアプローチをとった<br>
```html
<body>
    <div id="print-area"></div>
    <div id="container">
        <p>Test image</p>
        <div id="print-content">
            <img src="imac.png" alt="pc" width="100" height="100">
        </div>
        <div id="print-position"></div>
        <p id="sample-txt">Sample text</p>
        <input type="button" id="btn" value="print">
    </div>
    <script>
        const btn = document.getElementById('btn');
        btn.addEventListener('click', function () {
            const container = document.getElementById('container');
            const content = document.getElementById('print-content');
            const sampleTxt = document.getElementById('sample-txt');
            const printArea = document.getElementById('print-area');
            const printPosition = document.getElementById('print-position');

            container.style.display = 'none';
            printArea.appendChild(content);
            window.print();
            container.insertBefore(content, printPosition);
            container.style.display = 'block';
        });
    </script>
</body>
```
今回は試してはいないが、`z-index`を操作して白い背景と表示したい要素だけを前面に出しても面白いかもしれない<br>
WEBページの作りによっては、HTML要素をループして、印刷したい要素以外を非表示にすればOKの場合もある<br><br>

ちなみに`insertBefore`で間違った指定の仕方をすると、下記のようなエラーが出る
```
Uncaught DOMException: Failed to execute 'insertBefore' on 'Node': The node before which the new node is to be inserted is not a child of this node.
```
通常は、親子関係でない指定をしている場合に出るエラーだが<br>
idが重複しているHTML要素に対して`insertBefore`をしようとして、意図した要素を取得できずハマったことがある

## ソースコード
[Gist](https://gist.github.com/pixcelo/0ed0cae70b020be80ac36046e1d1203c)

## Reference
[Window.print()](https://developer.mozilla.org/ja/docs/Web/API/Window/print)<br>
[Node.insertBefore](https://developer.mozilla.org/ja/docs/Web/API/Node/insertBefore)
