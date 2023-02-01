using AutoMapper;

using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Input;

namespace FxAgendamiento.Mappers
{
    public class MappingProfileMalla : Profile
    {
        public MappingProfileMalla()
        {
            CreateMap<AgendaInput, MallaDto>()
                .ForMember(dest => dest.IdMalla,
                      opt => opt.MapFrom(src => src.IdMalla))
                .ForMember(dest => dest.IdSede,
                          opt => opt.MapFrom(src => src.IdSede))
                .ForMember(dest => dest.IdSubSede,
                          opt => opt.MapFrom(src => src.IdSubSede))
                .ForMember(dest => dest.Fecha,
                      opt => opt.MapFrom(src => src.FechaAgendamiento));

            CreateMap<CancelacionInput, MallaDto>()
               .ForMember(dest => dest.IdMalla,
                     opt => opt.MapFrom(src => src.IdMalla))
               .ForMember(dest => dest.IdSede,
                         opt => opt.MapFrom(src => src.IdSede))
               .ForMember(dest => dest.IdSubSede,
                         opt => opt.MapFrom(src => src.IdSubSede))
               .ForMember(dest => dest.Fecha,
                     opt => opt.MapFrom(src => src.FechaCita));
        }
    }
}