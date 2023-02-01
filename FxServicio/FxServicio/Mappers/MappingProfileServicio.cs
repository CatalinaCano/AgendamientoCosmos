using AutoMapper;

using FxServicio.Models.Entities;
using FxServicio.Models.Input;
using FxServicio.Utils;

using System;

namespace FxServicio.Mappers
{
    public class MappingProfileServicio : Profile
    {
        public MappingProfileServicio()
        {
            CreateMap<ServicioInput, Servicio>()

             .ForMember(dest => dest.Id,
                      opt => opt.MapFrom(src => SecurityHelper.SHA256Encrypt(src.NombreServicio.Trim())))
            .ForMember(dest => dest.PkGrupoServicio,
                      opt => opt.MapFrom(src => src.IdGrupoServicio))
            .ForMember(dest => dest.UsuarioCreacion,
                      opt => opt.MapFrom(src => src.Usuario))
            .ForMember(dest => dest.NombreServicio,
                      opt => opt.MapFrom(src => src.NombreServicio.Trim()))
            .ForMember(dest => dest.DescripcionServicio,
                      opt => opt.MapFrom(src => src.DescripcionServicio.Trim()))
            .ForMember(dest => dest.FechaCrecion,
                      opt => opt.MapFrom(src => DateTimeOffset.UtcNow));
        }
    }
}