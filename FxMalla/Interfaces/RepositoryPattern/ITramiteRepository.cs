using FxMalla.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMalla.Interfaces.RepositoryPattern
{
    public interface ITramiteRepository
    {
        public Task<List<TramiteDto>> ObtenerTramitesMallas(string idMallas);
    }
}