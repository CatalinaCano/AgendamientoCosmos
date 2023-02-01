using System.Linq;

namespace FxSede.Utils
{
    public static class ValidatorHelper
    {
        public static bool CheckforDuplicates(string[] lista)
        {
            var duplicates = lista
           .GroupBy(p => p)
           .Where(g => g.Count() > 1)
           .Select(g => g.Key);
            return !(duplicates.Any());
        }
    }
}
