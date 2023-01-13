
```cs
using System.Text;

namespace prop;

class Program
{
    class Sample
    {
        public int MyProperty { get; set; }
        public string? MyName { get; set; }
    }

    static void Main()
    {
        Sample sample = new Sample()
        {
            MyProperty = 1,
            MyName = "Tom"
        };

        var props = new Sample().GetType().GetProperties();
        var sb = new StringBuilder();

        foreach (var prop in props)
        {
            sb.Append(prop.Name);
            sb.Append(Environment.NewLine);

            sb.Append(typeof(Sample).GetProperty(prop.Name).GetValue(sample, null));
            sb.Append(Environment.NewLine);
        }

        Console.WriteLine(sb.ToString());
        Console.ReadKey();

        // MyProperty
        // 1
        // MyName
        // Tom
    }
}
```