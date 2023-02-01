using System.Collections.Generic;
using System.Linq;

namespace FxMalla.Utils
{
    public static class DataHelper
    {
        public static string ListaValores(IEnumerable<dynamic> lista, string clave)
        {
            dynamic[] valores = lista.Select(x => x.GetType().GetProperty(clave).GetValue(x)).Distinct().ToArray();
            return string.Join(",", valores.Select(x => $"'{x}'"));
        }
    }
}