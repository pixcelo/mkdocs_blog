---
tags:
  - C#
---

# C# NetTopologySuiteでshapeファイルの情報を取得する

## Topic

- `.shp`の情報を読み込む

## Install

パッケージマネージャーコンソールで`NetTopologySuite`をインストール

```
Install-Package NetTopologySuite
```

Esriのshapeファイルを読み込むサポートライブラリをインストール

```
NuGet\Install-Package NetTopologySuite.IO.Esri.Shapefile -Version 1.0.0
```

## Usage



```cs
string shpPath = "sample.shp";

foreach (var feature in Shapefile.ReadAllFeatures(shpPath))
{
    foreach (var attrName in feature.Attributes.GetNames())
    {
        Console.WriteLine($"{attrName,10}: {feature.Attributes[attrName]}");
    }
    Console.WriteLine($"     SHAPE: {feature.Geometry}");
    Console.WriteLine();
}
```

## Reference
- [NetTopologySuite](https://github.com/NetTopologySuite/NetTopologySuite)
- [NetTopologySuite.IO.Esri](https://github.com/NetTopologySuite/NetTopologySuite.IO.Esri)