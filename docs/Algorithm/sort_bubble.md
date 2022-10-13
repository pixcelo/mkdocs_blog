# バブルソート (bubble sort)
隣接する値との比較を繰り返して並び替えるアルゴリズム

## 計算量
O(n^2) <br>
先頭から順次処理されるので遅い<br>
アルゴリズムとして直感的でわかりやすい<br>

## 実装
```javascript
let data = [30, 10, 40, 90, 70, 20, 80];
console.log("before ", data);

for (let i = data.length - 1; i > 0; i--) {
    for (let j = 0; j < i; j++) {
        if(data[j] > data[j + 1]) {
            let tmp = data[j + 1];
            data[j + 1] = data[j];
            data[j] = tmp;
        }
    }
}

console.log("after ", data);
```

## ソースコード
[GitHub](https://github.com/pixcelo/Algorithm_csharp/blob/main/Algorithms/Service/SortService.cs)
