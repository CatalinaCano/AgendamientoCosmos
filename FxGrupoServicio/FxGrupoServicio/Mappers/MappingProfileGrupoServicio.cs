using AutoMapper;

using FxGrupoServicio.Models.Entities;
using FxGrupoServicio.Models.Input;
using FxGrupoServicio.Utils;

using System;

namespace FxGrupoServicio.Mappers
{
    public class MappingProfileGrupoServicio : Profile
    {
        public MappingProfileGrupoServicio()
        {
            CreateMap<GrupoServicioInput, GrupoServicio>()

            .ForMember(dest => dest.Id,
                      opt => opt.MapFrom(src => SecurityHelper.SHA256Encrypt(src.NombreGrupoServicio.Trim())))

               .ForMember(dest => dest.PkGrupoTramite,
                      opt => opt.MapFrom(src => src.IdGrupoTramite))

            .ForMember(dest => dest.NombreGrupoServicio,
                      opt => opt.MapFrom(src => src.NombreGrupoServicio.Trim()))
            .ForMember(dest => dest.DescripcionGrupoServicio,
                      opt => opt.MapFrom(src => src.DescripcionGrupoServicio))

            .ForMember(dest => dest.FechaCrecion,
                      opt => opt.MapFrom(src => DateTimeOffset.UtcNow))

            .ForMember(dest => dest.UsuarioCreacion,
                      opt => opt.MapFrom(src => src.Usuario));

        }
    }
}