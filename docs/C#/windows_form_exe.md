---
tags:
  - C#
  - Windowsフォーム
---

# C# Windowsフォームでexeファイルを作成する（ビルド）

メニューの「Debug」を「Release」に変更する

![menu](img/windows_form_menu.png)


「ビルド」→「ソリューションのリビルド」をクリック

![build](img/windows_form_build.png)


下部の「出力」に、正常終了のメッセージが表示される

![exe](img/windows_form_build_message.png)

「bin」→「Relaese」フォルダ内に、`exe`を含む各種ファイルが作成される

![exe](img/windows_form_exe.png)

`.exe`と、`.config`を渡せばOK

## Reference
[デスクトップ ガイド (Windows フォーム .NET)](https://learn.microsoft.com/ja-jp/dotnet/desktop/winforms/overview/?view=netdesktop-6.0)<br>
