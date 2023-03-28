---
tags:
  - VBA
---

# Excel VBA フォルダ内のファイルを見つけてパスを取得する

- ファイルが見つかった場合、フルパスを返却する
- 見つからなかった場合は、空文字列を返す

## Usage
```VBScript
Public Function FindFile( _
    ByVal path As String, _
    ByVal fileName As String) As String

    Dim fso As Object
    Dim folder As Object
    Dim subFolder As Object
    Dim file As Object
    Dim filePath As String
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folder = fso.GetFolder(path)
    
    For Each file In folder.Files
        If file.Name = fileName Then
            filePath = file.Path
            Exit For
        End If
    Next file
    
    If filePath = "" Then
        For Each subFolder In folder.SubFolders
            filePath = FindFile(subFolder.Path, fileName)
            If filePath <> "" Then
                Exit For
            End If
        Next subFolder
    End If
    
    FindFile = filePath
End Function
```

```
Public Sub FindFile()
    Dim path As String
    Dim fileName As String
    Dim filePath As String
    
    path = "C:\Users\Username\Documents"
    fileName = "example.txt"
    
    filePath = FindFile(path, fileName)
    
    If filePath <> "" Then
        MsgBox "ファイルが見つかりました。" & vbCrLf & filePath
    Else
        MsgBox "ファイルが見つかりませんでした。"
    End If
End Sub
```

## Reference
- []
