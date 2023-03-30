---
tags:
  - C#
---

# C# ベイズの定理

## Topic

ベイズの定理は、条件付き確率を求めるための定理

ある事象Bが起こった条件下で、別の事象Aが起こる確率を求めることができる（条件付確率）

## Overview

ベイズの定理は以下の式で表される

```
P(A|B) = P(B|A) * P(A) / P(B)
```

- ここで、P(A|B)は、事象Bが起こった条件下での事象Aの確率を表す
- P(B|A)は、事象Aが起こった条件下での事象Bの確率を表す
- P(A)は、事象Aが起こる確率を表す
- P(B)は、事象Bが起こる確率を表す

- この式を利用することで、ある条件下での事象の確率を予測することができる
- 具体的には、P(A|B)を求めるために、P(B|A)、P(A)、P(B)を計算する
- P(B|A)は、経験的なデータや専門知識から導き出すことができる

- P(A)は、事象Aが起こる確率を事前に知っている場合はその値を用い、そうでない場合は専門知識やデータから導き出すことができる
- P(B)は、事象Bが起こる確率を知っている場合はその値を用い、そうでない場合は全事象の確率の和が1になることを利用して計算することができる

ベイズの定理は、確率的な問題を解決するために広く用いられており、機械学習や統計学などの分野で利用される

## Usage

```cs
using System;

class Program {
    static void Main(string[] args) {
        // 事象Aと事象Bの確率を設定する
        double probabilityA = 0.3;
        double probabilityB = 0.5;
        
        // 事象Bが起こった条件下での事象Aの確率を求める
        double probabilityAB = 0.7;
        
        // 事象Aが起こった条件下での事象Bの確率を計算する
        double probabilityBA = probabilityAB * probabilityA / probabilityB;
        
        Console.WriteLine($"P(B|A) = {probabilityBA}");
    }
}
```

## Reference
- [ベイズの定理](https://ja.wikipedia.org/wiki/%E3%83%99%E3%82%A4%E3%82%BA%E3%81%AE%E5%AE%9A%E7%90%86)