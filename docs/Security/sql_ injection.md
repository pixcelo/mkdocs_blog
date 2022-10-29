# SQLインジェクション

SQLインジェクションとは、システムの不備を悪用し、<br>
不正な操作をするためのSQLを実行すること、あるいはその脆弱性を指す<br><br>

具体的には、HTMLの入力フォームにセミコロン `;` やシングルクォーテーション `'` 等の<br>
SQLコマンドを入力し、不正に情報を入手するといったことが報告されている

## 対策方法
[SqlParameter](https://learn.microsoft.com/ja-jp/dotnet/api/system.data.sqlclient.sqlparameter?view=dotnet-plat-ext-6.0&viewFallbackFrom=net-6.0)を使って安全なマッピングをする

```C#
var myCommand = new SqlDataAdapter("AuthorLogin", conn);

myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

SqlParameter parm = myCommand.SelectCommand.Parameters
                    .Add("@au_id", SqlDbType.VarChar, 11);

parm.Value = Login.Text;
```


C# Linqを使用

## Reference
[SQLインジェクション](https://learn.microsoft.com/ja-jp/sql/relational-databases/security/sql-injection?view=sql-server-ver16)<br>
[パラメーターおよびパラメーター データ型の構成](https://learn.microsoft.com/ja-jp/dotnet/framework/data/adonet/configuring-parameters-and-parameter-data-types)<br>
