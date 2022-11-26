---
tags:
  - C#
  - GIS
---

# C# 画像のExif情報からを緯度・経度を取得する

Exif `Exchangeable image file format`

* 画像に記録されるメタデータ
* 撮影日時やGPSなど画像に付与された情報

## Usage

C#を使って、画像から緯度・経度を取得するサンプル

```cs
using System.Diagnostics;
using System.Drawing.Imaging;

namespace ExifSample
{
    public class ExifReader
    {
        public void ReadExifData(string path)
        {
            using (var bmp = new Bitmap(path))
            {
                foreach (var item in bmp.PropertyItems)
                {
                    switch (item.Id)
                    {
                        // PropertyTagGpsLatitudeRef
                        case 0x0001:
                           ReadLatlngRef(item);
                           break;

                        // PropertyTagGpsLatitude
                        case 0x0002:
                            ReadLatlng(item);
                            break;

                        // PropertyTagGpsLongitudeRef
                        case 0x0003:
                           ReadLatlngRef(item);
                           break;

                        // PropertyTagGpsLongitude
                        case 0x0004:
                            ReadLatlng(item);
                            break;
                    }
                }
            }
        }

        private void ReadLatlngRef(PropertyItem item)
        {
            string value = System.Text.Encoding.ASCII.GetString(item.Value);
            value = value.Trim(new char[] { '\0' });

            switch(value)
            {
                case "N":
                    Debug.Print("北緯");
                    break;
                case "S":
                    Debug.Print("南緯");
                    break;
                case "E":
                    Debug.Print("東経");
                    break;
                case "W":
                    Debug.Print("西経");
                    break;
            }
        }

        private void ReadLatlng(PropertyItem item)
        {
            UInt32 deg_numerator = BitConverter.ToUInt32(item.Value, 0);
            UInt32 deg_denominator = BitConverter.ToUInt32(item.Value, 4);
            decimal deg = (decimal)deg_numerator / (decimal)deg_denominator;

            UInt32 min_numerator = BitConverter.ToUInt32(item.Value, 8);
            UInt32 min_denominator = BitConverter.ToUInt32(item.Value, 12);
            decimal min = (decimal)min_numerator / (decimal)min_denominator;

            UInt32 sec_numerator = BitConverter.ToUInt32(item.Value, 16);
            UInt32 sec_denominator = BitConverter.ToUInt32(item.Value, 20);
            decimal sec = sec_denominator == 0
                          ? 0
                          : (decimal)sec_numerator / (decimal)sec_denominator;

            Debug.Print($"{deg}度{min}分{sec}秒\r\n");
            Debug.Print(ConvertLatlngFrom60To10(deg, min, sec).ToString());
        }

        private decimal ConvertLatlngFrom60To10(decimal degree, decimal minute, decimal second)
        {
            decimal latLng = degree + (minute / 60) + (second / 60 / 60);
            return Math.Round(latLng, 10);
        }
    }
}
```

`Bitmap`として読み込み、`PropertyItems`をループして格納されたメタデータを取得できる

取得したメタデータは、プロパティのIDによって判別する

詳細については[プロパティ項目の説明](https://learn.microsoft.com/ja-jp/windows/win32/gdiplus/-gdiplus-constant-property-item-descriptions?redirectedfrom=MSDN)を参照

メタデータにカプセル化されているEixf情報はバイト配列のため、`BitConverter`で基本データ型に変換が必要

e.g.<br>
緯度・経度の値データのタイプは`PropertyTagTypeRational`

24バイトのうち、8バイトごとに度・分・秒が割り当てられている

8バイトのうち、最初の4バイトの整数は分子で、2番目の4バイトの整数は分母

```cs
UInt32 分子 = BitConverter.ToUInt32(item.Value, 0);
UInt32 分母 = BitConverter.ToUInt32(item.Value, 4);
decimal 度 = (decimal)分子 / (decimal)分母;
```

* `[]`は1バイト
* 24バイトを8バイトで度・分・秒を割り当て
* 4バイトごとに分子・分母となっている

```cs
// 度
[][][][][][][][]
└──┬───┘└──┬───┘
  分母     分子

// 分
[][][][][][][][]
└──┬───┘└──┬───┘
  分母     分子

// 秒
[][][][][][][][]
└──┬───┘└──┬───┘
  分母     分子
```

今回は検証していないが`Nuget`にはExif情報を取得するためのライブラリ[MetadataExtractor](https://github.com/drewnoakes/metadata-extractor-dotnet)も公開されている

## Reference
* [PropertyItem.Id プロパティ](https://learn.microsoft.com/ja-jp/dotnet/api/system.drawing.imaging.propertyitem.id?view=dotnet-plat-ext-7.0)
* [プロパティ項目の説明](https://learn.microsoft.com/ja-jp/windows/win32/gdiplus/-gdiplus-constant-property-item-descriptions?redirectedfrom=MSDN)
* [PropertyItem クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.drawing.imaging.propertyitem?view=dotnet-plat-ext-7.0)
* [BitConverter クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.bitconverter?view=net-7.0)
* [System.Drawing 名前空間](https://learn.microsoft.com/ja-jp/dotnet/api/system.drawing?view=dotnet-plat-ext-7.0)
* [Bitmap クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.drawing.bitmap?view=dotnet-plat-ext-7.0)
