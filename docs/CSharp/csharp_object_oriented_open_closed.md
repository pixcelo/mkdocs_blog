---
tags:
  - C#
  - オブジェクト指向
  - SOLID
---

# オブジェクト指向の原則　オープン・クローズドの原則

「ソフトウェアの構成要素は拡張に対して開いていて、修正に対して閉じていなければならない」という原則

## NGな例

```cs
/// <summary>
/// Pointボタン（機能拡張に弱い例：NGパターン）
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>
private void ng_pointButton_Click(object sender, EventArgs e)
{
    int price = 100;

    // 1%のポイントを付与する仕様
    //int point = Convert.ToInt32(price * 0.01f);
    //this.pointLabel.Text = $"{point.ToString()}p";

    // 上記のポイント付与条件に仕様変更があった場合、修正に閉じられていないため
    // 仕様変更があるたびに条件分岐を修正する必要がある
    int point;
    if (this.cardNumber.StartsWith("P"))
    {
        point = Convert.ToInt32(price * 0.02f);
    }
    else
    {
        point = Convert.ToInt32(price * 0.01f);
    }

    this.pointLabel.Text = $"{point.ToString()}p";

    // さらに言えば、画面にビジネスロジックを書いてしまっているため、
    // 本来は修正する必要のない画面クラスが修正対象となってしまう
}
```

## ファクトリーメソッドによる拡張

拡張する場合は、生成のみを責務とした`Factory`と、クラスを追加するだけでOK

ファクトリー
```cs
/// <summary>
/// ポイントファクトリー
/// Gof : ファクトリーメソッドパターン
/// 新しいポイントを作成する場合はPointクラスを追加して、
/// 以下のCreatePointメソッドに条件分岐を追加する
/// </summary>
public class PointFactory
{
    /// <summary>
    /// ポイントを作成する
    /// </summary>
    /// <param name="cardNumber"></param>
    /// <returns></returns>
    public static IPoint CreatePoint(string cardNumber)
    {
        if (cardNumber.StartsWith("G"))
        {
            return new GoldPoint();
        }
        
        if (cardNumber.StartsWith("S"))
        {
            return new SilverPoint();
        }

        return new Point();
    }
}
```

ポイントクラス、ファクトリー
```cs
/// <summary>
/// ポイントインターフェイス
/// </summary>
public interface IPoint
{
    /// <summary>
    /// ポイントを取得する
    /// </summary>
    /// <param name="price"></param>
    /// <returns></returns>
    int GetPoint(int price);
}

/// <summary>
/// ゴールド会員ポイントクラス
/// </summary>
public class GoldPoint : IPoint
{
    public int GetPoint(int price)
    {
        return Convert.ToInt32(price * 0.03f);
    }
}

/// <summary>
/// スタンダード会員ポイントクラス
/// </summary>
public sealed class Point : IPoint
{
    public int GetPoint(int price)
    {
        return Convert.ToInt32(price * 0.01f);
    }
}
```

クライアント側は、ファクトリーで必要なポイントクラスを生成する
```cs
/// <summary>
/// コンストラクタ
/// </summary>
/// <param name="cardNumber"></param>
public PointForm(string cardNumber) : this()
{
    this.cardNumber = cardNumber;
    this.point = PointFactory.CreatePoint(cardNumber);
}

/// <summary>
/// Pointボタン
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>
private void pointButton_Click(object sender, EventArgs e)
{
    int price = 100;
    this.pointLabel.Text = $"{this.point.GetPoint(price).ToString()}p";
}
```

**GitHub**<br />
https://github.com/pixcelo/CSharp-app/tree/main/OpenCloedPrinciple

## 予想されるバリエーション
インターフェイスを使用すべきか？を考えるには、拡張ポイントが必要かどうかを考慮する

- 外部接続（データベースの違い、CSV、ファイルシステム）
- 会員（会員ランク、通常or有料会員）
- 決済方法（クレジット、現金、QR決済）
- 通知方法（メール、SMS、プッシュ通知）
- レポート形式（PDF、Excel、HTML）
- ディスカウント戦略（パーセンテージ割引、固定割引、バンドル割引）
- ロギング（ファイルログ、データベースログ、クラウドログ）
- 認証方法（パスワード、OAuth、SAML）
- UI（ライトテーマ、ダークテーマ、高コントラストテーマ）

## Reference
- [O (Open Closed: 開放/閉鎖) の原則](https://learn.microsoft.com/ja-jp/archive/msdn-magazine/2014/may/csharp-best-practices-dangers-of-violating-solid-principles-in-csharp#o-open-closed-%E9%96%8B%E6%94%BE%E9%96%89%E9%8E%96-%E3%81%AE%E5%8E%9F%E5%89%87)