---
tags:
  - C#
  - SQLServer
  - Windowsフォーム
---

# C# データベース（SQLServer）に接続する

C# Windowsフォームでデータベース（SQLServer）に接続するサンプル

## Usage

`SqlConnectionStringBuilder`でデータベースの接続文字列を作成する

```cs
private void button1_Click(object sender, EventArgs e)
{
    // データベースの接続文字列の作成
    var builder = new SqlConnectionStringBuilder();

    builder.DataSource = "server_name";
    builder.UserID = "login_name";
    builder.Password = "password";
    builder.InitialCatalog = "database_name";

    string sql = @"SELECT * FROM user WHERE userID = '1'";

    using (var connection = new SqlConnection(builder.ConnectionString))
    {
        var command = new SqlCommand(sql, connection);

        try {
            // データベースに接続
            connection.Open();

            // SQLの読み込み
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    // ここに処理を書く
                }
            }
        }
        catch(SqlException)
        {
            MessageBox.Show("データベースの接続に失敗しました。");
        }

    }
}
```
## Reference
* [SqlConnectionStringBuilder クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.data.sqlclient.sqlconnectionstringbuilder?view=dotnet-plat-ext-7.0)
* [SqlConnection クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.data.sqlclient.sqlconnection?view=dotnet-plat-ext-7.0)
