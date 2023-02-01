using AutoMapper;

using FxGrupoTramite.Models.Entities;
using FxGrupoTramite.Models.Input;
using FxGrupoTramite.Utils;

using System;

namespace FxGrupoTramite.Mappers
{
    public class MappingProfileGrupoTramite : Profile
    {
        public MappingProfileGrupoTramite()
        {
            CreateMap<GrupoTramiteInput, GrupoTramite>()

            .ForMember(dest => dest.Id,
                      opt => opt.MapFrom(src => SecurityHelper.SHA256Encrypt(src.NombreGrupoTramite.Trim())))

            .ForMember(dest => dest.NombreGrupoTramite,
                      opt => opt.MapFrom(src => src.NombreGrupoTramite.Trim()))

            .ForMember(dest => dest.DescripcionGrupoTramite,
                      opt => opt.MapFrom(src => src.DescripcionGrupoTramite.Trim()))

            .ForMember(dest => dest.Icono,
                      opt => opt.MapFrom(src => src.Icono.Trim()))

            .ForMember(dest => dest.FechaCrecion,
                      opt => opt.MapFrom(src => DateTimeOffset.UtcNow))

            .ForMember(dest => dest.UsuarioCreacion,
                      opt => opt.MapFrom(src => src.Usuario));
        }
    }
}