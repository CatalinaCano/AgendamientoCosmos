using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Input;
using FxAgendamiento.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Configuration;
using Microsoft.OpenApi.Models;

using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamiento
{
    public class FxListarCitasDia

    {
        private readonly IUnitOfWork _unitOfWork;
        public readonly IConfiguration _configuration;

        public FxListarCitasDia(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        [FunctionName(nameof(ListarCitasDia))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarCitasDia", tags: new[] { "Listar Citas de hoy" }, Description = "End point para listar las citas de hoy ", Summary = "End point para listar las citas de hoy")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(AgendaInput), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Conflicto")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarCitasDia(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/ListarCitasDia/{numeroIdentificacion}/{digitoVerificacion?}")] HttpRequest req,string numeroIdentificacion,  string? digitoVerificacion)
        {
            try
            {
                List<ResposeTramite> tramites = new() { };
                int digito = digitoVerificacion!= null ? int.Parse(digitoVerificacion):-1;

#nullable enable
                UsuarioDto? usuario = await _unitOfWork.UsuarioRepository.ObtenerUsuarioPorNumeroIdenticacion(numeroIdentificacion, digito);
                #nullable disable

                if (usuario != null)
                {
                 
                    List<CitasDto> citas = await _unitOfWork.TramiteRepository.ObtenerCitasPorDia(usuario.IdUsuario);
                    foreach (CitasDto cita in citas)
                    {
                        #nullable enable
                        ServicioDto? servicio = await _unitOfWork.ServicioRepository.ObtenerTiempodeAtencionServicio(cita.PkServicio);
                        SedeDto? sede = await _unitOfWork.SedeRepository.ObtenerDatosSede(cita.PkSede, cita.PkSubSede);
                        

                        tramites.Add(new ResposeTramite()
                        {
                            IdTramite = cita.PkTramite,
                            Activo = cita.Activo,
                            IdMalla = cita.PkMalla,
                            IdSede = cita.PkSede,
                            IdSubsede = cita.PkSubSede,
                            EstadoCita = cita.NombreEstado,
                            CorreoElectronico = usuario?.CorreoElectronico,
                            Fecha = cita.FechaAgendamiento,
                            Hora = cita.HoraAgendamiento,
                            NombresApellidos = usuario?.Nombres,
                            NumeroDocumento = usuario?.NumeroIdentificacion,
                            PuntoAtencion = sede?.NombreSede != null ? string.Concat(sede?.NombreSede, " - ", sede?.NombreSubSede) : sede?.NombreSede,
                            TipoPago = servicio?.tipoPago,
                            Tramite = servicio?.nombreServicio,
                            TramiteVirtual = servicio?.tramiteVirtual,
                            DuracionServicio = cita?.DuracionServicio != null ? string.Concat(cita?.DuracionServicio, " min") : null
                        });

                    #nullable disable
                    }

                    

                    return HttpResponseHelper.Response(StatusCodes.Status200OK, tramites);

                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult() { IsError = true, Message = "El usuario enviado no esta registrado en la Base de datos" });
                }
                
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}