using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Entities;
using FxMalla.Models.Input;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMalla.Interfaces
{
    public interface IDataService
    {
        public Task<object> GetMallaByID(string idMalla);

        public Task<IEnumerable<object>> ObterDataConsolidada(List<Malla> malla);

        public Task<List<DatosSedeDto>> GetDatosSedes(string idSedes);

        public Task<List<SedeDto>> GetSubSedes(string idSedes);

        public string GetUsuariosVetados(List<Malla> malla);

        public Task<IEnumerable<dynamic>> GetTramitesJoined(List<TramiteDto> tramites);

        public Task<List<object>> GetMallaByFecha(FechaInput fecha);
    }
}