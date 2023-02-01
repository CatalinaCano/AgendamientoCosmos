using System;
using System.Text.RegularExpressions;

namespace FxAgendamientoMasivo.Models.CSV
{
    [AttributeUsage(AttributeTargets.Property)]
    public sealed class CsvColumnAttribute : Attribute
    {
        public string Name { get; private set; }
        public Regex ValidationRegex { get; private set; }

        public CsvColumnAttribute(string name) : this(name, null)
        {
        }

        public CsvColumnAttribute(string name, string validationRegex)
        {
            this.Name = name;
            this.ValidationRegex = new Regex(validationRegex ?? "^.*$");
        }
    }
}