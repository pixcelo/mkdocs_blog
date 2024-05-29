---
tags:
  - C#
---

# C# 文字列型・日付型とUnixTimeへの変換 DataTime

文字列型、`DateTime`型の日付、及びUNIXタイムへの変換

## Usage
### 日付型
現在の日付を取得
```C#
DateTime now = DateTime.Now;
// {2022/11/12 0:00:00}
```

`string`型の日付を`DateTime`型に変換
```C#
string dateString = "2022-11-23 15:10:30";
DateTime date = DateTime.Parse(dateString);
// {2022/11/23 15:10:30}
```
### UNIXタイム
`DateTimeOffset.ToUnixTimeSeconds`は、1970-01-01T00:00:00Z からの経過時間を秒で返す<br>
```C#
DateTimeOffset dto = new DateTimeOffset(2022, 11, 12, 15, 30, 0, TimeSpan.Zero);
long unixTime = dto.ToUnixTimeSeconds();
// 1668267000
```

UNIXタイムから戻す場合は、`FromUnixTimeMilliseconds`
```C#
DateTimeOffset dto = DateTimeOffset.FromUnixTimeMilliseconds(unixTime);
// {1970/01/01 0:00:00 +00:00}
```

## Reference
[DateTime 構造体](https://learn.microsoft.com/ja-jp/dotnet/api/system.datetime?view=net-7.0)<br>
[DateTime.Parse メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.datetime.parse?view=net-7.0)<br>
[DateTimeOffset.ToUnixTimeSeconds メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.datetimeoffset.tounixtimeseconds?view=net-7.0)<br>
[DateTimeOffset.FromUnixTimeSeconds(Int64) メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.datetimeoffset.fromunixtimeseconds?view=net-7.0#system-datetimeoffset-fromunixtimeseconds(system-int64))<br>
