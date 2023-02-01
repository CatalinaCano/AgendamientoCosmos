using AutoMapper;

using FxSede.Models.Entities;
using FxSede.Models.Input;
using FxSede.Utils;

using System;

namespace FxSede.Mappers
{
    public class MappingProfileSede : Profile
    {
        public MappingProfileSede()
        {
            CreateMap<SedeInput, Sede>()
             .ForMember(dest => dest.Id,
                      opt => opt.MapFrom(src => SecurityHelper.SHA256Encrypt(src.NombreSede.Trim())))

             .ForMember(dest => dest.NombreSede,
                      opt => opt.MapFrom(src => src.NombreSede.Trim()))

             .ForMember(dest => dest.UsuarioCreacion,
                      opt => opt.MapFrom(src => src.Usuario))

             .ForMember(dest => dest.FechaCreacion,
                      opt => opt.MapFrom(src => DateTime.UtcNow))

             .ForMember(dest => dest.SubSedes,
                      opt => opt.MapFrom(src => new SubSede[] { }));
        }
    }
}