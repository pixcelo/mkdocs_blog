---
tags:
  - ブログ
---

# ディープコピーとシャローコピーの違い

## Topic

ITのカタカナ英語のメモ

## ディープコピー deep copy

- 値渡し（新しくメモリ上にデータを複製する）
- 実体（データ）のコピーを行い、オブジェクトをコピーする
- オリジナルとコピーのどちらかのオブジェクトへの変更が影響されない

`C#`は、変数をそのまま代入すると値渡しになる

`Python`は、`copy`で変数に代入すると値渡しになる

```py
# 辞書型をディープコピーする
copied_dict = dict.copy()
```

`VBA`は、`Sub Func(ByVal a As String)`で値渡しを指定できる

## シャローコピー shallow copy

- 参照渡し（メモリ上の参照を代入する）
- 実体（データ）のコピーを行わないで、オブジェクトをコピーする
- オリジナルとコピーのどちらかのオブジェクトへの変更が反映される

`C#`は、`ref`や`out`で渡すと値渡しになる

`Python`は、`=`で変数に代入すると参照渡しになる

```py
# リストをシャローコピーする
copied_list = list[:]

# 辞書型をシャローコピーする
copied_dict = dict

# 数値をシャローコピーする
copied_num = num

# 文字列をシャローコピーする
copied_str = str
```

`VBA`は、`Sub Func(ByRef a As String)`で参照渡しを指定できる

## Reference
- [ref (C# リファレンス)](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/keywords/ref)
- [out パラメーター修飾子 (C# リファレンス)](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/keywords/out-parameter-modifier)
- [Python copy](https://docs.python.org/ja/3/library/copy.html?highlight=copy#module-copy)
- [引数の値渡しと参照渡し (Visual Basic)](https://learn.microsoft.com/ja-jp/dotnet/visual-basic/programming-guide/language-features/procedures/passing-arguments-by-value-and-by-reference)
- [引数の値渡しと参照渡しの違い (Visual Basic)](https://learn.microsoft.com/ja-jp/dotnet/visual-basic/programming-guide/language-features/procedures/differences-between-passing-an-argument-by-value-and-by-reference)
