using FxSede.Models.DataTransferObjects;
using FxSede.Models.Entities;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxSede.Interfaces.RepositoryPattern
{
    public interface ISedeRepository
    {
        public Task<string> CreateSedeAsync(Sede sede);
        public Task<SedeDto> GetSedeByName(string nombreSede);
        public Task<SedeDto> GetSedeByID(string idSede);
        public Task<List<SubSedeDto>> GetSubSedesByIdSedeAsync(string idSede);
        public Task<SubSedeDto> GetSubSedesByIdAsync(string idSede, string idSubSede);
        public Task<List<SedeDto>> GetSedesAsync();
        public Task<string> PatchSedeAsync(Sede sede, string idSede);
        public Task<bool> ExistsSedeAsync(string nombreSede);
        public Task<bool> ExistsSubSedeAsync(string idSede, string idSubSede);
        public Task<SubSedeDto> GetSubSedeByName(string idSede, string nombreSubSede);
        public Task<List<SedeDto>> GetSedesByServicio(string idServicio);
        public Task<string> AddSubSede(SubSede subsede, string idSede);
        public Task<string> UpdateSubSede(SubSede subsede, string idSede);


    }
}