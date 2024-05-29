---
tags:
  - C#
---

# C# Task 並列プログラミング .NET Framework 4.0

- `Task.Factory.StartNew()`に処理を記述
- 次の処理がある場合、`ContinueWith()`で繋ぐ

## Usage
```cs
public Task<JsonResult> GetSomthing(FormCollection collection)
{
    var list = new List<Sample>();

    return Task.Factory.StartNew(() =>
    {
        var id = collection["id"];
        list = GetModels(id);
    }).ContinueWith(t =>
    {
        return new JsonResult() { Data = list, MaxJsonLength = Int32.MaxValue };
    });
}
```

## Reference
- [Task クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.threading.tasks.task?view=net-7.0)
- [Task<TResult> クラス](https://learn.microsoft.com/ja-jp/dotnet/api/system.threading.tasks.task-1?view=net-7.0)
- [TaskFactory.StartNew メソッド](https://learn.microsoft.com/ja-jp/dotnet/api/system.threading.tasks.taskfactory.startnew?view=net-7.0)
- [タスク ベースの非同期プログラミング](https://learn.microsoft.com/ja-jp/dotnet/standard/parallel-programming/task-based-asynchronous-programming)
- [方法: タスクから値を返す](https://learn.microsoft.com/ja-jp/dotnet/standard/parallel-programming/how-to-return-a-value-from-a-task)