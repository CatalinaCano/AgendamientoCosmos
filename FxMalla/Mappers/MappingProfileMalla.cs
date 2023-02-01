using AutoMapper;

using FxMalla.Models.Entities;
using FxMalla.Models.Input;
using FxMalla.Utils;

using System;

namespace FxMalla.Mappers
{
    public class MappingProfileGrupoServicio : Profile
    {
        public MappingProfileGrupoServicio()
        {
            CreateMap<MallaInput, Malla>()
            .ForMember(dest => dest.Id,
                      opt => opt.MapFrom(src => SecurityHelper.SHA256Encrypt(string.Concat(src.IdSede, src.FechaInicio, src.FechaFin))))

            .ForMember(dest => dest.PkSede,
                      opt => opt.MapFrom(src => src.IdSede))

            .ForMember(dest => dest.FechaInicio,
                      opt => opt.MapFrom(src => src.FechaInicio))

           .ForMember(dest => dest.FechaFin,
                      opt => opt.MapFrom(src => src.FechaFin))

           .ForMember(dest => dest.Activo,
                      opt => opt.MapFrom(src => true))

          .ForMember(dest => dest.UsuarioCreacion,
                      opt => opt.MapFrom(src => src.Usuario))

           .ForMember(dest => dest.FechaCreacion,
                      opt => opt.MapFrom(src => DateTime.UtcNow))

           .ForMember(dest => dest.UsuarioModificacion,
                      opt => opt.UseDestinationValue())

           .ForMember(dest => dest.FechaModificacion,
                      opt => opt.UseDestinationValue());
        }
    }
}