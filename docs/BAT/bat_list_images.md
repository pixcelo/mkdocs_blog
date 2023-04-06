---
tags:
  - BAT
---

# 指定したパスのフォルダ内に存在する画像枚数を出力するバッチファイル

- `.jpg`,`.png`,`.gif`に対応
- フォルダ内をサブフォルダも含めて調べる

```bat
@echo off
setlocal enabledelayedexpansion

:: 対象フォルダを設定
set "target_folder=%1"
if "%target_folder%" == "" set "target_folder=."

:: 対象フォルダとサブフォルダ内の画像数を表示
echo %target_folder%のフォルダとサブフォルダ内の画像数:

:: 各フォルダ内の画像数を表示
for /r "%target_folder%" /d %%d in (*) do (
    set "folder=%%d"
    set "count=0"
    :: 画像数をカウント
    for %%f in ("!folder!\*.jpg", "!folder!\*.png", "!folder!\*.gif") do (
        set /a count+=1
    )
    :: 結果を表示
    echo !folder! - !count! images
)
```

## Reference
- [コマンド](https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/for)
