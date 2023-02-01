using AutoMapper;

using FxSede.Models.Entities;
using FxSede.Models.Input;

namespace FxSede.Mappers
{
    public class MappingProfileTiempoOffline : Profile
    {
        public MappingProfileTiempoOffline()
        {
            CreateMap<TiempoOfflineInput, TiempoOffline>();
        }
    }
}