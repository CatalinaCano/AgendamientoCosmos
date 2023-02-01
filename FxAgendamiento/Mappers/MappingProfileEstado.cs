using AutoMapper;

using FxAgendamiento.Models.Entities;
using FxAgendamiento.Models.Input;

using System;

namespace FxAgendamiento.Mappers
{
    public class MappingProfileEstado : Profile
    {

        public MappingProfileEstado()
        {
            CreateMap<NuevoEstadoInput, Estado>()
                .ForMember(dest => dest.NombreEstado,
                      opt => opt.MapFrom(src => src.Estado))
                .ForMember(dest => dest.FechaEstado,
                          opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForMember(dest => dest.IdCampania,
                          opt => opt.MapFrom(src =>src.IdCampania))
                .ForMember(dest => dest.CodigoQr,
                      opt => opt.MapFrom(src => src.QRCode));
        }
    }
}
