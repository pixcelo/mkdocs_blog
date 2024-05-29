---
tags:
  - C#
---

# C# 高速なシリアライザーMemoryPackを使用する

## Install

dotnetコマンドでインストール
```
dotnet add package MemoryPack --version 1.9.11
```

パッケージマネージャでインストール
```
PM> Install-Package MemoryPack
```

## Usage

`[MemoryPackable]`属性をつけて、`partial class`を定義

```cs
using MemoryPack;

namespace ConsoleApp1
{
    [MemoryPackable]
    public partial class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
```

`MemoryPackSerializer.Serialize()`と`MemoryPackSerializer.Deserialize<T>()`でシリアライズ・デシリアライズを行う

```cs
using ConsoleApp1;
using MemoryPack;

namespace Consoleapp1;

class Program
{
    static async Task Main()
    {
        var student = new Student { Id = 1, Name = "Tom" };
        var bin = MemoryPackSerializer.Serialize(student);
        var val = MemoryPackSerializer.Deserialize<Student>(bin);
    }
}
```

## Reference
- [Cysharp/MemoryPack](https://github.com/Cysharp/MemoryPack)
- [nuget memoryPack](https://www.nuget.org/packages/MemoryPack#versions-body-tab)