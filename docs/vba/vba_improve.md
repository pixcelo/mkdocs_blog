---
tags:
  - VBA
---

# Excel VBA 処理を高速化する

各種を要所で組み合わせて使用する

## Application.ScreenUpdating

マクロの速度を向上させるため、画面を更新しないようにする<br>
マクロが終了した後は`ScreenUpdating`を`True`に戻す

## Usage
```VBScript
Application.ScreenUpdating = False

' do something

Application.ScreenUpdating = True
```

## Application.Calculation

計算モードの設定を扱い、自動計算のオン・オフを切り替える<br>

シートに数式が多いとセルの値が変更されるごとに数式が自動計算され、処理スピードが落ちてしまう<br>

最後に`True`に切り替えてまとめて計算させることで、高速化が期待できる<br>

```VBScript
Application.Calculation = xlCalculationManual

' do something

Application.Calculation = xlCalculationAutomatic
```

- `xlCalculationAutomatic` 自動計算（オン）
- `xlCalculationManual`    手動計算（オフ）

## Application.EnableEvents

セルの変更で実行されるWorkSheetイベントを設定している場合、他マクロの実行中にオフにすることで処理速度の向上が期待できる

```VBScript
Application.EnableEvents= False

' do something

Application.EnableEvents= True
```

## Reference
[Application.ScreenUpdating プロパティ (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.application.screenupdating)<br>
[Application.Calculation プロパティ (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.application.calculation)<br>
[Application.EnableEvents プロパティ (Excel)](https://docs.microsoft.com/ja-jp/office/vba/api/excel.application.enableevents)<br>
