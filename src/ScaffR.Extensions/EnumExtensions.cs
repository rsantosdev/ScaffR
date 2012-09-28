namespace ScaffR.Extensions
{
    using System.ComponentModel;
    using System.Reflection;

    public static class EnumExtensions
    {
        public static string GetEnumDescription<TEnum>(TEnum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());

            var attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

            if ((attributes.Length > 0))
                return attributes[0].Description;
            return value.ToString();
        }
    }
}
