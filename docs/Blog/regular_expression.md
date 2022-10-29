# 正規表現

正規表現についてのメモ<br>
正規表現をチェックするサイトについては[こちら](https://pixcelo.github.io/whakamarie/JavaScript/javascript_regex/)でまとめた

## メタ文字
```c
. ドット == 改行を除く任意の一文字
```
![dot](img/regex_dot.png)


## エスケープ
メタ文字をエスケープして、リテラルとして検索する<br>
バックスラッシュは `option + ¥`
```c
\ バックスラッシュ == 次の文字をエスケープする
```
![dot](img/regex_backslash.png)

## Reference
[MDN 正規表現](https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions)<br>
