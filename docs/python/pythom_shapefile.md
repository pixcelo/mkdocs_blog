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

sf = shapefile.Reader("shapefiles/blockgroups.shp")

```


## Reference
* [pyshp](https://pypi.org/project/pyshp/)
* [GDAL](https://gdal.org/index.html)
