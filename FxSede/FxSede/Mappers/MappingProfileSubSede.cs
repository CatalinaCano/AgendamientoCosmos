using AutoMapper;

using FxSede.Models.Entities;
using FxSede.Models.Input;
using FxSede.Utils;

using System;
using System.Linq;

namespace FxSede.Mappers
{
    public class MappingProfileSubSede : Profile
    {
        public MappingProfileSubSede()
        {
            CreateMap<SubSedeInput, SubSede>()

                .ForMember(dest => dest.IdSubSede,
                  opt => opt.MapFrom(src => SecurityHelper.SHA256Encrypt(src.NombreSubSede.Trim())))
                .ForMember(dest => dest.NombreSubSede,
                  opt => opt.MapFrom(src => src.NombreSubSede.Trim()))
                .ForMember(dest => dest.UsuarioCreacion,
                  opt => opt.MapFrom(src => src.Usuario))
                 .ForMember(dest => dest.FechaCreacion,
                  opt => opt.MapFrom(src => DateTime.UtcNow))
                 .ForMember(dest => dest.DiasOffline,
                 opt => opt.MapFrom(src => src.DiasOffline ?? Array.Empty<string>()))
                  .ForMember(dest => dest.TiemposOffline,
                 opt => opt.MapFrom(src => src.TiemposOffline ?? Array.Empty<TiempoOfflineInput>().ToList()));
        }
    }

}