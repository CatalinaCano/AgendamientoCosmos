using AutoMapper;

using FxCodigoQR.Models.Entities;
using FxCodigoQR.Models.Input;
using FxCodigoQR.Utils;

using System;

namespace FxCodigoQR.Mappers
{
    public class MappingProfileCodigo : Profile
    {
        public MappingProfileCodigo()
        {
            CreateMap<DataInput, CodigoQR>()
            .ForMember(dest => dest.Id,
                     opt => opt.MapFrom(src => SecurityHelper.SHA256Encrypt(src.IdTramite.Trim())))

            .ForMember(dest => dest.IdUsuario,
                     opt => opt.MapFrom(src => src.IdUsuario.Trim()))

            .ForMember(dest => dest.IdTramite,
                     opt => opt.MapFrom(src => src.IdTramite.Trim()))
              .ForMember(dest => dest.Datos,
                     opt => opt.MapFrom(src => src.Data.Trim()))

            .ForMember(dest => dest.FechaCreacion,
                     opt => opt.MapFrom(src => DateTime.UtcNow));
        }
    }
}