using AutoMapper;

using FxSede.Models.Entities;
using FxSede.Models.Input;

namespace FxSede.Mappers
{
    public class MappingProfileServicio : Profile
    {
        public MappingProfileServicio()
        {
            CreateMap<ServicioInput, Servicio>();
        }
    }
}