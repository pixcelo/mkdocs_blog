---
tags:
  - C#
  - EPPlus
---

# C# ライブラリEPPlusでセル範囲に罫線を引く

## Topic

- 指定したセル範囲に罫線を引く
- EPPlus ver 4.5.3.3

## Usage

引数に指定したセル範囲、罫線のスタイルを設定する

```cs
public void SetBorder(ExcelRange range, ExcelBorderStyle style)
{
    range.Style.Border.Top.Style = style;
    range.Style.Border.Left.Style = style;
    range.Style.Border.Right.Style = style;
    range.Style.Border.Bottom.Style = style;
}
```

関数の使い方

```cs
// セル範囲に罫線を設定
SetBorder(sheet.Cells[1, 2, 1, 2], ExcelBorderStyle.Thin);
```

## Reference
- [EPPlus SampleApp](https://github.com/JanKallman/EPPlus/tree/master/SampleApp)