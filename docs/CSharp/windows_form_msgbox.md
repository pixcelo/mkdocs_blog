---
tags:
  - C#
  - Windowsフォーム
---

# C# Windowsフォーム メッセージボックスを表示する

C# Windowsフォームでメッセージボックスのポップアップを表示する方法

## Usage

`MessageBox.Show(引数)`で、引数に渡した値をメッセージ ボックスに表示する

JavaScriptのalertのように利用頻度は高い

```cs
private void button1_Click(object sender, EventArgs e)
{
     MessageBox.Show("Hello world.");
}
```

`try catch`のエラー処理に利用する例

```cs
try
{
    // Do something
}
catch(Exception ex)
{
    Debug.Print(ex.Message, ex.StackTrace);

    MessageBox.Show(ex.Message,
        "Error",
        MessageBoxButtons.AbortRetryIgnore,
        MessageBoxIcon.Error);
}
```

## Reference
[MessageBox.Show メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.windows.messagebox.show?view=windowsdesktop-7.0&viewFallbackFrom=net-5.0%3Atitle)
