---
tags:  
  - C#
---

# Unit of Workパターンとは

Unit of Workパターンは、エンタープライズ向けアプリケーションでよく用いられるデザインパターンの1つ

PoEAA "Patterns of Enterprise Application Architecture"（エンタープライズアプリケーションアーキテクチャのパターン）に記載

## Unit of Work の役割

ビジネストランザクション中に影響を受けるオブジェクトのリストを維持し、<br />
トランザクションのライフサイクルの様々な問題を調整する」

## Unit of Work の実装

```cs
public interface IUnitOfWork
{
    void MarkDirty(object entity);
    void MarkNew(object entity);
    void MarkDeleted(object entity);
    void Commit();
    void Rollback();
}
```

## Unit of Workの仕組みのメリット

- デッドロックの可能性を極小化できる

## Reference
https://qiita.com/tanakahisateru/items/b0c441c4540e84fe6dea
https://bliki-ja.github.io/pofeaa/UnitofWork
https://www.martinfowler.com/eaaCatalog/unitOfWork.html
https://learn.microsoft.com/ja-jp/archive/msdn-magazine/2009/june/the-unit-of-work-pattern-and-persistence-ignorance
https://learn.microsoft.com/ja-jp/aspnet/mvc/overview/older-versions/getting-started-with-ef-5-using-mvc-4/implementing-the-repository-and-unit-of-work-patterns-in-an-asp-net-mvc-application