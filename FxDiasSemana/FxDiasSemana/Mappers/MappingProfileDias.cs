using AutoMapper;

using FxDiasSemana.Models;
using FxDiasSemana.Models.DataTransferObjects;

namespace FxDiasSemana.Mappers
{
    public class MappingProfileDias : Profile
    {
        public MappingProfileDias()
        {
            CreateMap<DiasDto, Dias>();
        }
    }
}