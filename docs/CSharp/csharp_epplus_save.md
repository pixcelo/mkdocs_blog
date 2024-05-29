---
tags:
  - C#
  - EPPlus
---

# C# ライブラリEPPlusでExcelを保存する

## Topic

- Excelの保存方法
- EPPlus ver 4.5.3.3

## Usage

- 新規にExcelを作成して保存する

```cs
using (var package = new ExcelPackage())
{
    ExcelWorksheet ws = package.Workbook.Worksheets.Add("new_sheet");
    ws.Cells["A1"].Value = "Hello World";

    package.SaveAs(new FileInfo("new_file_name.xlsx"));
}
```

- 既存のExcelを開いて上書き保存する

```cs
var file = new FileInfo("sample.xlsx");

using (var package = new ExcelPackage(file))
{
    ExcelWorksheet ws = package.Workbook.Worksheets["sheet1"];
    ws.Cells["A1"].Value = "Hello World";

    package.Save();
}
```

- Byte配列として返却する

```cs
using (var package = new ExcelPackage())
{
    var ws = package.Workbook.Worksheets.Add("sheet1");
    ws.Cells["A1"].Value = "Hello World";

    byte[] bytes = package.GetAsByteArray();
}
```

## Reference
- [EPPlus SampleApp](https://github.com/JanKallman/EPPlus/tree/master/SampleApp)