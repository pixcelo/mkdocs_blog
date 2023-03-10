---
tags:
  - VBA
---

# Excel VBA FileSystemObjectでフォルダ名を変更する

- `FileSystemObject`は、ファイルやフォルダを操作できるオブジェクト
- 参照設定で`Microsoft Scripting Runtime`にチェックを入れる

## Usage

- パスからフォルダ名を取得するには、`GetFolder(fullPath)`を使用する

```VBScript
' フォルダ名を変更する
Public Sub ChangeDirectoryName(ByVal dirPath As String)

    Dim fso As Object
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    Dim newName As String
    newName = "new_directory_name"
    
    ' フォルダ名を変更
    fso.GetFolder(dirPath).Name = newName
    
    Debug.Print fso.GetFolder(dirPath).Name
End Sub
```


## Reference
- [FileSystemObject オブジェクト](https://learn.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/filesystemobject-object)
- [GetFolder メソッド](https://learn.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/getfolder-method)