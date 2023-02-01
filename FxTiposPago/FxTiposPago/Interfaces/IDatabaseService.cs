using FxTiposPago.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxTiposPago.Interfaces
{
    public interface IDatabaseService
    {
        public Task<List<TipoPagoDto>> Get();

        public Task<TipoPagoDto> GetById(string id);
    }
}