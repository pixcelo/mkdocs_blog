---
tags:
  - C#
  - WindowsForm
  - Error
---

# C# error: System.ArgumentOutOfRangeException: ''0001/01/01 0:00:00' の値は 'Value' に対して有効ではありません。'Value' は 'MinDate' と 'MaxDate' の間でなければなりません。 

## Topic

エラー発生

「 System.ArgumentOutOfRangeException: ''0001/01/01 0:00:00' の値は 'Value' に対して有効ではありません。'Value' は 'MinDate' と 'MaxDate' の間でなければなりません。 Arg_ParamName_Name
ArgumentOutOfRange_ActualValue'」

## 解決方法

DatetimePickerにDateTime型を初期化せずにバインドするとエラーが再現できる

プロパティを`DateTime.Now`で初期化してから渡しておく

## Reference
- [DateTimePicker クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.windows.forms.datetimepicker?view=windowsdesktop-8.0)
- [ArgumentOutOfRangeException クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.argumentoutofrangeexception?view=net-8.0)