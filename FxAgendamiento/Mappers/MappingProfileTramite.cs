using AutoMapper;

using FxAgendamiento.Models.Entities;
using FxAgendamiento.Models.Input;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;

namespace FxAgendamiento.Mappers
{
    public class MappingProfileTramite : Profile
    {
        public readonly IConfiguration _configuration;
        public MappingProfileTramite()
        {
            CreateMap<AgendaInput, Agenda>()

             .ForMember(dest => dest.Id,
                      opt => opt.MapFrom(src => src.IdUsuario))


              .ForMember(dest => dest.Tramites,
                          options => options.MapFrom(src => new Tramite[] {
                             new Tramite()
                                {
                                    PkSede = src.IdSede,
                                    PkSubSede = src.IdSubSede,
                                    PkMalla = src.IdMalla,
                                    FechaRegistro = DateTime.UtcNow,
                                    IpRegistro = src.Ip,
                                    Activo = true,
                                    Servicio = new Servicio()
                                    {
                                        PkServicio = src.IdServicio,
                                        FechaAgendamiento = src.FechaAgendamiento,
                                        HoraAgendamiento = src.HoraAgendamiento
                                    },
                                    Estados = new List<Estado>
                                    {
                                        new Estado()
                                        {
                                          
                                            FechaEstado = DateTime.UtcNow
                                        }
                                    }
                                }
                          }));
        }


      
    }
}