# マージソート (merge sort)
すでにある程度、整列されているものの並びを、小さい単位で並び替えてソートするアルゴリズム

## 計算量
O(n log n)<br>
ランダムなデータでは、クイックソートの方が速い<br>
1. データ列を分割する（通常、二等分する）
2. 分割された各データ列で、含まれるデータが1個ならそれを返し、2個以上ならステップ1から3を再起的に適用してマージソートする
3. 二つのソートされたデータ列（1個であればそれ自身）をマージする

## jsでの実装
```javascript
// Merge sort
function mergeSort(unsortedArray) {
    if (unsortedArray.length <= 1) {
      return unsortedArray;
    }
    const middle = Math.floor(unsortedArray.length / 2);
    const left = unsortedArray.slice(0, middle);
    const right = unsortedArray.slice(middle);

    return merge(mergeSort(left), mergeSort(right));
  }

  function merge(left, right) {
    let resultArray = [],
      leftIndex = 0,
      rightIndex = 0;

    while (leftIndex < left.length && rightIndex < right.length) {
      if (left[leftIndex] < right[rightIndex]) {
        resultArray.push(left[leftIndex]);
        leftIndex++;
      } else {
        resultArray.push(right[rightIndex]);
        rightIndex++;
      }
    }

    return resultArray
      .concat(left.slice(leftIndex))
      .concat(right.slice(rightIndex));
  }

  console.log(mergeSort([4, 1, 3, 2, 16, 9, 10, 14, 8, 7]));
```

## ソースコード
