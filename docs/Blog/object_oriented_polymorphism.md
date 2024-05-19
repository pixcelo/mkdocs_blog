---
tags:
  - ブログ
  - オブジェクト指向
  - ポリモーフィズム
  - リファクタリング
  - C#
---

# 条件分岐を減らすために、ポリモーフィズムを利用する

条件分岐は難しい

複雑な条件分岐は、コードを読みづらく、保守性を悪化させ、テストを困難にする

一方、ポリモーフィズムを活用することで、条件分岐を減らし、コードをよりエレガントで保守しやすいものにすることが可能となる

## 例：形状を描画するアプリケーション
円の描画、四角形の描画、三角形の描画など、さまざまな形状を描画するアプリケーションを考えてみる

従来であれば、各形状ごとに条件分岐を用いて描画処理を記述する必要がある

```cs
void DrawShape(Shape shape)
{
    if (shape is Circle)
    {
        DrawCircle((Circle)shape);
    }
    else if (shape is Square)
    {
        DrawSquare((Square)shape);
    }
    else if (shape is Triangle)
    {
        DrawTriangle((Triangle)shape);
    }
    else
    {
        throw new ArgumentException("Unsupported shape type: " + shape.GetType().Name);
    }
}
```

業務でアプリケーションを開発する場合、様々なケースが想定されるので条件分岐が増えがちだが、<br />
このように条件分岐が増えると不具合を見落とす可能性がグッと高まるためリファクタリングを検討したい

## ポリモーフィズムによる解決策
ポリモーフィズムを利用して、DrawShapeメソッドを抽象化することができる

まず、Shapeという抽象クラスを作成し、Drawという抽象メソッドを定義する

```cs
public abstract class Shape
{
    public abstract void Draw();
}
```

次に、Circle、Square、Triangleなどの具体的な形状クラスを作成し、それぞれDrawメソッドをオーバーライドする

```cs
public class Circle : Shape
{
    public override void Draw()
    {
        // 円を描画する処理
    }
}

public class Square : Shape
{
    public override void Draw()
    {
        // 四角形を描画する処理
    }
}

public class Triangle : Shape
{
    public override void Draw()
    {
        // 三角形を描画する処理
    }
}
```

これにより条件分岐が完全に排除され、DrawShapeメソッドは次のようにシンプルになる

```cs
void DrawShape(Shape shape)
{
    shape.Draw();
}
```

コードがより読みやすく、保守しやすくなった

## Reference
- [オブジェクト指向プログラミング (C#)](https://learn.microsoft.com/ja-jp/dotnet/csharp/fundamentals/tutorials/oop)
- [ポリモーフィズム](https://learn.microsoft.com/ja-jp/dotnet/csharp/fundamentals/object-oriented/polymorphism)