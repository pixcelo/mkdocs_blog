
.NET6

Add
new file
Razor View (Razor View Page)


https://docs.microsoft.com/ja-jp/aspnet/core/tutorials/first-mvc-app/adding-model?view=aspnetcore-5.0&tabs=visual-studio-mac


PATH
open ~/.zshrc
編集する
source ~/.zshrc

make Models/Movie.cs ファイルを次のコードで更新します。
MOdelsのクラスからマイグレーションでデータベースとコンテキスト、コントローラービューなど諸々を作成するコマンド
// CLI
dotnet-aspnet-codegenerator controller -name AccessController -m AccessModel -dc AccessContext --relativeFolderPath Controllers --useDefaultLayout --referenceScriptLibraries -sqlite
