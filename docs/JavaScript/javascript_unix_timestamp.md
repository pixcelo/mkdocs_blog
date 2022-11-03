---
tags:
  - JavaScript
---

# JavaScript UNIXタイムスタンプ

UNIXタイムスタンプは、協定世界時（UTC）での1970年1月1日午前0時0分0秒からの経過秒数<br>
協定世界時（UTC）は世界の標準時で、「日本時間 - 9時間」がUTCとなる<br>

## JavaScriptで扱う
```javascript
// 日付オブジェクトを作成
const date = new Date(2022, 11, 2, 3, 15, 30);

// unix時間に変換
const unixTimestamp = date.getTime();

// 1669918530000
console.log(unixTimestamp);
```

### Note
JavaScriptでの月は「0起点」<br>
11月を引数に渡すと、12月(December)となることに注意
```javascript
new Date(2022, 11, 2, 3, 15, 30);
// Fri Dec 02 2022 03:15:30 GMT+0900 (Japan Standard Time)
```

APIのパラメータとして渡すときに、タイムスタンプの桁数を調整する場合がある
```javascript
const unixTimestamp = date.getTime();
const timestamp10digits= String(unixTimestamp).substring(0, 10);

// 1669918530
console.log(timestamp10digits);
```

## Reference
[MDN Date](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Date)<br>
[MDN substring](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/String/substring)<br>
