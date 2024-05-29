---
tags:
  - C#
  - ClosedXML
---

# C# ライブラリClosedXMLでExcelを操作

## Topic

- 新規にExcelを作成して、セルに値を書き込み保存する

## Usage

### Excelを作成して保存する

```cs
public void SaveAsXlsx()
{
    using (var wb = new XLWorkbook())
    {
        var ws = wb.Worksheets.Add("sheetName");

        ws.Cell(1, 1).Value = "Example";
        ws.Cell(1, 2).Value = 1;

        // ウィンドウの固定
        ws.SheetView.FreezeRows(1);

        // 列幅
        ws.ColumnWidth = 20;

        // ダウンロードフォルダに保存
        string savePath = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile) + @"\Downloads\";
        wb.SaveAs(Path.Combine(savePath, "example.xlsx"));
    }
}
```

## Reference
- [ClosedXML wiki](https://github.com/ClosedXML/ClosedXML/wiki)
- [ClosedMXML GitHub](https://github.com/ClosedXML/ClosedXML)