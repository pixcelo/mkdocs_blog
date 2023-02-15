---
tags:
  - C#
  - GIS
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

`.shp`ファイルのパスを渡すことで読み込む

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

- `feature.Attributes`のコレクションには、ArcMapやQGISなどで読み込める属性テーブルの情報が参照できる
- `feature.Geometry`には、平面直角座標系の位置情報やジオメトリタイプ等のデータが確認できる

## Reference
- [NetTopologySuite](https://github.com/NetTopologySuite/NetTopologySuite)
- [NetTopologySuite.IO.Esri](https://github.com/NetTopologySuite/NetTopologySuite.IO.Esri)