---
tags:
  - Python
  - GIS
---

# Python シェイプファイル(.shp)からポリゴンの緯度・経度を取得する

# Install
pyshp
```
pip install pyshp
```

osgeo(GDAL)
```
pip install gdal
pip install osgeo
```

## Usage
```python
import shapefile
from osgeo import ogr, osr

sf = shapefile.Reader("shapefiles/blockgroups.shp")
shps = sf.shapes()
shp = ogr.GetDriverByName('ESRI Shapefile').Open(file_path, 0)
src_srs = shp.GetLayer().GetSpatialRef()
dst_srs = osr.SpatialReference()
dst_srs.ImportFromEPSG(4612)
trans = osr.CoordinateTransformation(src_srs, dst_srs)
shp.Destroy()

for shp in shps:
    print(list(map(lambda point: trans.TransformPoint(point[0], point[1])[:2], shp.points)))
```

## Reference
* [pyshp](https://pypi.org/project/pyshp/)
* [GDAL](https://gdal.org/index.html)
