---
tags:
  - C#
  - EPPlus
---

# C# ライブラリEPPlusで画像を貼り付ける

## Topic

- 既存のExcelを読み込み、指定したセルに画像を貼り付ける

## Usage

- `ExcelWorksheet.Drawings.AddPicture()`でシートに画像を追加する
- `ExcelPicture.SetPosition()`で場所を調整
- `ExcelPicture.SetSize()`で画像のサイズを指定する

```cs
ExcelWorksheet ws = package.Workbook.Worksheets["sheet1"];

using (Image image = Image.FromFile("sample.jpg"))
{
    var pic = ws.Drawings.AddPicture("fileName", image);
    pic.SetPosition(5, 0, 5, 0);
    pic.SetSize(100, 100);
}
```

## Reference
- [EPPlus SampleApp](https://github.com/JanKallman/EPPlus/tree/master/SampleApp)