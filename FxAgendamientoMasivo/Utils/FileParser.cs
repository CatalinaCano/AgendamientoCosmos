using FxAgendamientoMasivo.Models.CSV;

using Microsoft.VisualBasic.FileIO;

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;

namespace FxAgendamientoMasivo.Utils
{
    public static class FileParser
    {
        public static string Base64_Decode(string str)
        {
            try
            {
                byte[] decbuff = Convert.FromBase64String(str);
                return System.Text.Encoding.UTF8.GetString(decbuff);
            }
            catch
            {
                return "";
            }
        }

        public static List<T> ParseFileInfo<T>(List<string[]> split) where T : new()
        {
            if (split.Count < 2)
                return new List<T>();
            string[] templateRow = split[0];

            Dictionary<string, int> columnIndexing = new();
            for (int i = 0; i < templateRow.Length; i++)
            {
                string colHeader = templateRow[i].Trim().ToUpperInvariant();
                if (!columnIndexing.ContainsKey(colHeader))
                    columnIndexing.Add(colHeader, i);
            }

            int numCols = columnIndexing.Values.Max() + 1;

            PropertyInfo[] properties = new PropertyInfo[numCols];

            Regex[] propValidators = new Regex[numCols];

            TypeConverter[] propconverters = new TypeConverter[numCols];

            foreach (PropertyInfo p in typeof(T).GetProperties())
            {
                object[] attrs = p.GetCustomAttributes(true);
                foreach (object attr in attrs)
                {
                    if (attr is not CsvColumnAttribute fileAttr)
                        continue;
                    if (!columnIndexing.TryGetValue(fileAttr.Name.ToUpperInvariant(), out int index))
                    {
                        if (!fileAttr.ValidationRegex.IsMatch(string.Empty))
                            return new List<T>();
                        break;
                    }
                    properties[index] = p;
                    propValidators[index] = fileAttr.ValidationRegex;
                    propconverters[index] = TypeDescriptor.GetConverter(p.PropertyType);
                    break;
                }
            }
            List<T> objList = new();
            for (int i = 1; i < split.Count; i++)
            {
                bool abortLine = false;
                string[] line = split[i];
                T obj = new();
                for (int col = 0; col < properties.Length; col++)
                {
                    string curVal = col < line.Length ? line[col] : string.Empty;
                    PropertyInfo prop = properties[col];
                    if (prop == null)
                        continue;
                    bool valid = propValidators[col].IsMatch(curVal);
                    if (!valid)
                    {
                        abortLine = true;
                        break;
                    }
                    object value = propconverters[col].ConvertFromString(curVal);
                    prop.SetValue(obj, value, null);
                }
                if (!abortLine)
                    objList.Add(obj);
            }
            return objList;
        }

        public static List<string[]> SplitFile(string fileContent, char separator)
        {
            List<string[]> splitLines = new();
            try
            {
                using (StringReader sr = new(fileContent))
                using (TextFieldParser tfp = new(sr))
                {
                    tfp.TextFieldType = FieldType.Delimited;
                    tfp.Delimiters = new string[] { separator.ToString() };
                    while (true)
                    {
                        string[] curLine = tfp.ReadFields();
                        if (curLine == null)
                            break;
                        splitLines.Add(curLine);
                    }
                }
                return splitLines;
            }
            catch (MalformedLineException mfle)
            {
                throw new FormatException(string.Format("No se pudo leerr la linea {0} en el archivo!", mfle.LineNumber));
            }
        }
    }
}