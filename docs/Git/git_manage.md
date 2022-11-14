---
tags:
  - git
---

# gitでバージョン管理

チーム開発において必須となる「Git」<br>
Gitの運用方法についてまとめ

## gitの基本コマンド
Gitは、Macならターミナル、WindowsならコマンドプロンプトやPowerShellを使って操作<br>

個人開発でも、過去のバージョンに戻ることができて便利<br>
当ブログの運用を含めて、アウトプットは全てGitを使って行うようにしてる<br>

現場によっては、違うシステムでバージョン管理している場合もある<br>
e.g. svnなど

### 1.リモートリポジトリからCloneする

```
cd <The directory path>
git clone <The url>
```

最初に、cdコマンドでリポジトリを作成したいディレクトリに移動<br>
cloneコマンドでリモートリポジトリのURLを指定する<br>
すでにリポジトリ内に存在するファイルが、ローカルの作業ディレクトリ（ワークツリー）にコピーされる

### 2.ローカルリポジトリの作成
```
git init
```
initコマンドを実行すると「.git」というローカルリポジトリをディレクトリに作成される<br>

例えば、testディレクトリでgit initを実行すると、下記のようになる<br>

```
git init
Initialized empty git repository in /Users/***/Desktop/test/.git/
```

「.git」のフォルダが生成され、ステージングエリアとローカルリポジトリという作業領域が準備される<br>
対象ディレクトリをGitの管理下に置くことができた

### 3.ファイルをステージングエリア（インデックス）に登録

```
git add ファイル名
```

ステージングエリアとは、commitしたい変更ファイルを置いておく場所<br>
`git add .`とするとディレクトリ内の全ファイルを一度に登録できる

### 4.ファイルの変更をローカルリポジトリに登録

```
git commit -m "変更点、変更理由の記述"
```

commitは、ファイルをローカルリポジトリに記録するコマンドです。`-m`を忘れるとデフォルトのエディターとしてViエディターが立ち上がる<br>

一単語なら`-m`がなくても登録できる<br>

コミットメッセージ入力後に `:wq` で保存・終了<br>

### 5.リモートリポジトリにpushする

```
git remote add origin https://github.com/ユーザー名/リモートリポジトリ名.git
```

最初は、「.Gitファイル」をリモートリポジトリに関連付けする<br>

```
git push -u origin main
```

2回目以降は上記の簡略化したコマンドで、GitHub上にあるリモートリポジトリに`commit`としたファイルを`push`（アップロード）できる<br>

ちなみに「origin」とは「リモートリポジトリ」のエイリアスを指す<br>

```
git push origin main
```

pushコマンドで、GitHubのリモートリポジトリに変更ファイルをアップロードできる


## Gitの確認コマンド

次に、各コマンドに対する実行結果を確認する

### 1.Gitの現在の状況を確認

```
git status
```

Gitの様々な状況をまとめて確認できる

```
On branch main

No commits yet

Untracked files:
  (use "git add ..." to include in what will be committed)

	test.html

nothing added to commit but untracked files present (use "git add" to track)

```
### 2.commitの状況を確認

```
$ git log
```

commitの履歴を確認するコマンド

```
commit c08d7124cda5f512c7af2a3c67252f910b439bf5 (HEAD -&gt; master)
Author: ユーザ名 &lt;xxxxx@gmail.com&gt;
Date:   Sun Dec 29 10:45:34 2019 +0900

    create test.html
```

commitの回数が増えて見にくいときは、git log --oneline とすることで1行ずつのスッキリとした表示にできる

```
git log --oneline
c08d712 (HEAD -&gt; main) create test.html
```

### 3.ファイルの差分を確認

```
git diff
```

diffは、ブランチをマージする前にファイルの差分を確認するためのコマンド<br>
オプションを指定する事で様々な状態の差分を確認することができる

### 4.リモートリポジトリURLを確認

```
git remote -v
```

正常に登録されていれば、リモートリポジトリのURLを返す

## Gitの削除コマンド

```
git rm ファイル名
```

git rm でローカルリポジトリのファイルを削除できる<br>

## ブランチの運用

ブランチとは、ひとつのファイルをブランチ（枝）で分岐させて作業するための機能<br>
チーム開発において、複数人が同時並行でファイルを変更する際に役立つ<br>

以前まで「git checkout」が使われてたが、「git switch」のほうが直感的でわかりやすい

### 1.ブランチの作成
```
git switch -c ブランチ名
```
初期状態は、ブランチが「main」となっている<br>

Gitは、基本的に「mainが一番正しく、最新のものである」という状態で運用

### 2.ブランチの移動
```
git switch ブランチ名
```

switchは、ブランチを切り替えるコマンド
```
git branch
```

現在のブランチを確認することができる
```
git branch

* main
feature
```

「 * 」がついているのが現在のブランチ<br>

ブランチで作成・変更したファイルを全てcommitを完了してから、mainにマージする

```
git switch main
```

mainに対して、マージしたいブレンチ名をコマンドで入力する

```
git merge [ブランチ名]
```

マージの衝突（CONFLICT）が起きなければ、マージ完了<br>
mainが最新のものになっているか確認<br>

## Reference
[git](https://git-scm.com/doc)<br>
