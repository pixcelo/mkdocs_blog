---
tags:
  - C#
---

# C# メールを送信する

`SmtpClientクラス`が存在するが、多くの最新のプロトコルをサポートしていないため、非推奨とされている

代わりとして`MailKit`ライブラリ(MITライセンス)を利用する

## Usage

Nugetに公開されているので`Package Manager Console`からインストール可

```
Install-Package MailKit
```

## Reference
* [MailKit](https://github.com/jstedfast/MailKit)
* [MailKit Documentation](http://www.mimekit.net/docs/html/Introduction.htm)
* [SmtpClient クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.net.mail.smtpclient?view=net-7.0)
* [DE0005: SmtpClient shouldn't be used](https://github.com/dotnet/platform-compat/blob/master/docs/DE0005.md)
