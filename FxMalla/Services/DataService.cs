using Deedle;

using FxMalla.Interfaces;
using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Entities;
using FxMalla.Models.Input;
using FxMalla.Utils;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Extensions;
using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FxMalla.Services
{
    public class DataService : IDataService
    {
        public readonly IConfiguration _config;

        private readonly IUnitOfWork _unitOfWork;

        public DataService(IConfiguration config, IUnitOfWork unitOfWork)
        {
            _config = config;
            _unitOfWork = unitOfWork;
        }

        public async Task<object> GetMallaByID(string idMalla)
        {
            List<Malla> malla = await _unitOfWork.MallaRepository.ObtenerMallaporID(idMalla);
            var result = malla.Any() ? ObterDataConsolidada(malla).Result.FirstOrDefault() : null;  
            return result;
        }


        public async Task<List<object>> GetMallaByFecha(FechaInput fecha)
        {
            List<Malla> malla = await _unitOfWork.MallaRepository.ObtenerMallaporFecha(fecha);
            var result = malla.Any() ? ObterDataConsolidada(malla).Result.ToList() : new List<object>() { }; 
            return result;
        }


        public async Task<IEnumerable<object>> ObterDataConsolidada(List<Malla> malla)
        {
            string idSedes = DataHelper.ListaValores(malla, "PkSede");
            List<DatosSedeDto> datosSedes = await GetDatosSedes(idSedes);
            List<SedeDto> subsedes = await GetSubSedes(idSedes);
            string idMallas = DataHelper.ListaValores(malla, "Id");

            List<TramiteDto> tramites = await _unitOfWork.TramiteRepository.ObtenerTramitesMallas(idMallas);
            var tramitesJoined = await GetTramitesJoined(tramites);
            string idUsuariosVentados = GetUsuariosVetados(malla);

            List<UsuarioDto> listadoUsuariosVetados = !idUsuariosVentados.IsEmpty() ?await _unitOfWork.UsuarioRepository.ObtenerUsuario(idUsuariosVentados) : new List<UsuarioDto>() { };

            var mallasSede = (from m in malla
                              join s in datosSedes on m.PkSede equals s.IdSede
                              select new
                              {
                                  IdMalla = m.Id,
                                  s.NombreSede,
                                  s.Direccion,
                                  m.FechaInicio,
                                  m.FechaFin,
                                  m.Activo,
                                  MallasPorSubSede = m.MallasPorSubSede.Join(subsedes,
                                  mallaSubSede => mallaSubSede.PkSubSede,
                                  subsede => subsede.IdSubSede, (mallaSubSede, subsede) => new
                                  {
                                      nombreSubSede = subsede.NombreSubSede,
                                      horaInicioSubSede = subsede.HoraInicio,
                                      horaFinSubSede = subsede.HoraFin,
                                      intervaloAtencion = subsede.IntervaloAtencion,
                                      tiemposAtencion = mallaSubSede.TiemposAtencion
                                      .Select(x =>
                                            new
                                            {
                                                x.Fecha,
                                                x.DiaSemana,
                                                tiempos = x.Tiempos?.Where(t => t.IdTiempoMalla != null).Select(t => new
                                                {
                                                    t.HoraInicio,
                                                    t.HoraFin,
                                                    t.AgendaDisponible,
                                                    t.CantidadPersonas,
                                                    tramites = (from tr in t.Tramites
                                                                join dtr in tramitesJoined on tr equals dtr.IdTramite
                                                                select new
                                                                {
                                                                    dtr.Nombres,
                                                                    dtr.CorreoElectronico,
                                                                    dtr.NumeroIdentificacion,
                                                                    dtr.NombreServicio,
                                                                    dtr.DuracionServicio,
                                                                    dtr.TiempoAtencion,
                                                                    dtr.FechaRegistro,
                                                                    dtr.NombreEstado,
                                                                    dtr.TramiteVirtual
                                                                }).Distinct(),
                                                    usuariosVetados = (from us in t.UsuariosVetados
                                                                       join u in listadoUsuariosVetados on us equals u.IdUsuario
                                                                       select new
                                                                       {
                                                                           u.Nombres,
                                                                           u.NumeroIdentificacion,
                                                                           u.CorreoElectronico
                                                                       }).Distinct()
                                                })
                                            })
                                  }
                                 )
                              });

            return mallasSede;
        }

        public async Task<List<DatosSedeDto>> GetDatosSedes(string idSedes)
        {
            return await _unitOfWork.SedeRepository.ObtenerDatosSede(idSedes);
        }

        public async Task<List<SedeDto>> GetSubSedes(string idSedes)
        {
            List<SedeDto> subSedes = await _unitOfWork.SedeRepository.ObtenerSubsedes(idSedes);
            return subSedes;
        }

        public string GetUsuariosVetados(List<Malla> malla)
        {
            var usuariosVetados = malla.SelectMany(x => x.MallasPorSubSede
                                        .SelectMany(mps => mps.TiemposAtencion?
                                        .Where(ta => ta.Tiempos != null).SelectMany(ta => ta.Tiempos
                                        .SelectMany(t => t.UsuariosVetados)))).Distinct();

            return string.Join(",", usuariosVetados.Select(x => $"'{x}'"));
        }

        public async Task<IEnumerable<dynamic>> GetTramitesJoined(List<TramiteDto> tramites)
        {
            string idUsuarios = DataHelper.ListaValores(tramites, "IdUsuario");
            List<UsuarioDto> usuarios = !idUsuarios.IsEmpty() ? await _unitOfWork.UsuarioRepository.ObtenerUsuario(idUsuarios): new List<UsuarioDto>() { } ;

            string idServicios = DataHelper.ListaValores(tramites, "PkServicio");
            List<ServicioDataDto> servicios = !idServicios.IsEmpty()? await _unitOfWork.ServicioRepository.ObtenerTiempodeAtencionServicio(idServicios):new List<ServicioDataDto>() { };

            var tramitesJoined = (from u in usuarios
                                  join tr in tramites on u.IdUsuario equals tr.IdUsuario
                                  from s in servicios
                                  join tr1 in tramites on s.IdServicio equals tr1.PkServicio
                                  select new
                                  {
                                      IdTramite = tr.PkTramite,
                                      u.Nombres,
                                      u.CorreoElectronico,
                                      u.NumeroIdentificacion,
                                      tr.NombreEstado,
                                      tr.FechaRegistro,
                                      tr.DuracionServicio,
                                      s.NombreServicio,
                                      s.TiempoAtencion,
                                      s.TramiteVirtual
                                  });

            return tramitesJoined;
        }
    }
}