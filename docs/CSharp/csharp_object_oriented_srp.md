---
tags:
  - C#
  - オブジェクト指向
---

# オブジェクト指向の原則　単一責任の原則

SRP : Single Responsibility Principle
- クラスの責務は1つにする
- クラスを変更する理由は、1つ以上存在してはならない

## NGな例

受注画面クラス
- 受注データ入力
- 受注の保存
- 受注メール送信

発注画面クラス
- 発注データ入力
- 発注の保存
- 発注メール送信

ここで、メール送信の仕様に変更があった場合

### NGな実装の問題点
- 問題点1 : 画面クラスに色々な責務を持たせているため、様々な理由で変更する必要が出てしまう
- 問題点2 : 同じ修正を別々の画面クラスごとに修正しなくてはならない

ロジックを単一クラスに切り出しておけば、以下のメリットがある
- 修正箇所を最小にできる
- 修正する場所が明確になる

### 巨大クラス（単一責務になっていない実装）の問題点
- 修正箇所を探すのに時間が掛かる
- 他に影響がないことを確認する時間（テスト）が増える

## クラスは機能ごとに小さく作る
多数の小さなクラスを作り、クラスを部品として利用することで機能を実現する

修正がクラス単位になるので、プルリクのレビューも分かりやすくなる

## Reference
- [単一責任](https://learn.microsoft.com/ja-jp/dotnet/architecture/modern-web-apps-azure/architectural-principles#single-responsibilityc)
- [S (Single Responsibility: 単一責任) の原則](https://learn.microsoft.com/ja-jp/archive/msdn-magazine/2014/may/csharp-best-practices-dangers-of-violating-solid-principles-in-csharp#s-single-responsibility-%E5%8D%98%E4%B8%80%E8%B2%AC%E4%BB%BB-%E3%81%AE%E5%8E%9F%E5%89%87)