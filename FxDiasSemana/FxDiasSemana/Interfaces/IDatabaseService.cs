using FxDiasSemana.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxDiasSemana.Interfaces
{
    public interface IDatabaseService
    {
        public Task<List<DiasDto>> Get();
    }
}