using AutoMapper;

using FxTiposPago.Models;
using FxTiposPago.Models.DataTransferObjects;

namespace FxTiposPago.Mappers
{
    public class MappingProfileTipoDato : Profile
    {
        public MappingProfileTipoDato()
        {
            CreateMap<TipoPagoDto, TipoDato>();
        }
    }
}