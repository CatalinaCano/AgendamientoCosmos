using AutoMapper;

using FxMalla.Models;
using FxMalla.Models.DataTransferObjects;

namespace FxMalla.Mappers
{
    public class MappingProfileRespuestaTiempos : Profile
    {
        public MappingProfileRespuestaTiempos()
        {
            CreateMap<RespuestaTiempo, RespuestaTiempos>()
            .ForMember(dest => dest.IdMalla,
                     opt => opt.MapFrom(src => src.PkMalla))
             .ForMember(dest => dest.IdSede,
                     opt => opt.MapFrom(src => src.PkSede))
              .ForMember(dest => dest.IdSubSede,
                     opt => opt.MapFrom(src => src.PkSubSede))
               .ForMember(dest => dest.Fecha,
                     opt => opt.MapFrom(src => src.Fecha))
                .ForMember(dest => dest.Hora,
                     opt => opt.MapFrom(src => src.HoraInicio));
        }
    }
}