---
tags:
  - C#
  - GIS
---

# C# DotSpatial.NetStandard 座標系の変換して緯度・経度を取得する

## Topic

- 座標系の再投影
- XY座標から緯度・経度を取得する

## Usage

`Reproject.ReprojectPoints`に変換する座標`double[]`と空間座標系のESPGコードを渡す
 
```cs
using DotSpatial.Projections;

var src = ProjectionInfo.FromEpsgCode(6674);
var dest = ProjectionInfo.FromEpsgCode(4326);

foreach (var coordinates in feature.Geometry.Coordinates)
{
    double[] xy = new double[2]
    {
        coordinates.X,
        coordinates.Y
    };

    // 平面直角座標系 → 緯度経度
    Reproject.ReprojectPoints(xy, null, src, dest, 0, 1);
}
```

## Reference
- [DotSpatial.NetStandard](https://github.com/ststeiger/DotSpatial)
- [DotSpatial](https://github.com/DotSpatial/DotSpatial)