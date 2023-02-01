using AutoMapper;

using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Input;

namespace FxMalla.Mappers
{
    public class MappingProfileInputAgenda : Profile
    {
        public MappingProfileInputAgenda()
        {
            CreateMap<SedeDto, AgendaInput>()
             .ForMember(dest => dest.Intervalo,
                      opt => opt.MapFrom(src => src.IntervaloAtencion))
              .ForMember(dest => dest.CantidadPersonas,
                      opt => opt.MapFrom(src => src.NumeroPersonasAtencion));
        }
    }
}