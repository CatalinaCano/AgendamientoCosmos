using AutoMapper;

using FluentValidation;

using FxAgendamiento.Interfaces;
using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Entities;
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

using Newtonsoft.Json;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamiento
{
    public class FxAgendarCita

    {
        public readonly IConfiguration _configuration;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<AgendaInput> _validator;
        private readonly IMapper _mapper;
        private readonly IMessageService _messageService;
        private const string OPERACION = "Agendamiento";

        public FxAgendarCita(IUnitOfWork unitOfWork, IValidator<AgendaInput> validator, IMapper mapper, IMessageService messageService, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _validator = validator;
            _mapper = mapper;
            _messageService = messageService;
            _configuration = configuration;
        }

        [FunctionName(nameof(AgendarCita))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "AgendarCita", tags: new[] { "Agendar Cita" }, Description = "End point para crear una cita dentro del sistema.", Summary = "End point para crear una cita dentro del sistema.")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(AgendaInput), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Conflicto")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> AgendarCita(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/AgendarCita")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                AgendaInput request = JsonConvert.DeserializeObject<AgendaInput>(json);

                var validationResult = _validator.Validate(request);
                if (validationResult.IsValid)
                {
                    SedeDto sede = await _unitOfWork.SedeRepository.ObtenerDatosSede(request.IdSede, request.IdSubSede);
                    ServicioDto servicio = await _unitOfWork.ServicioRepository.ObtenerTiempodeAtencionServicio(request.IdServicio);
                    string pkTramite = SecurityHelper.CalcularLlave(request);

                    List<DateTime> horas = TimeHelper.ObtenerHoras(request, sede, servicio);
                    string[] tiemposHoras = TimeHelper.CambiarHoras(horas);

                    MallaDto malla = _mapper.Map<MallaDto>(request);

                    List<TramiteDto> result = await _unitOfWork.MallaRepository.ValidarTiempos(malla, tiemposHoras);

                    foreach (TramiteDto hora in result)
                    {
                        if (hora.AgendaDisponible && hora.Tramites?.Length <= hora.CantidadPersonas)
                        {
                            bool activarAgenda = hora.Tramites?.Length + 1 != hora.CantidadPersonas;
                            await _unitOfWork.MallaRepository.InactivarTiempos(malla, hora.HoraInicio, pkTramite, activarAgenda);
                        }
                        else
                        {
                            return HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult()
                            {
                                IsError = true,
                                Message = "No es posible realizar el agendamiento pues este espacio ya se encuentra ocupado."
                            });
                        }
                    }

                    Agenda tramite = _mapper.Map<Agenda>(request);
                    tramite.Tramites[0].PkTramite = pkTramite;
                    tramite.Tramites[0].Servicio.DuracionServicio = servicio.tiempoAtencion;
                    tramite.Tramites[0].Estados[0].NombreEstado = _configuration["Estados:Creacion"];
                    await _unitOfWork.TramiteRepository.CrearTramite(tramite);

                    UsuarioDto user = await _unitOfWork.UsuarioRepository.ObtenerUsuario(request.IdUsuario);

                    ValoresDto values = new()
                    {
                        IdUser = request.IdUsuario,
                        IdTramite = pkTramite,
                        Nombre = user.Nombres,
                        Direccion = string.Concat(sede.NombreSede, "<br>",
                                                  sede.Direccion, "<br>",
                                                  sede.NombreSubSede),
                        NombreServicio = servicio.nombreServicio,
                        Fecha = request.FechaAgendamiento,
                        Hora = request.HoraAgendamiento,
                        Tiempo = $"{servicio.tiempoAtencion} min"
                    };

                    await _messageService.CrearMensaje(user.CorreoElectronico, values, OPERACION);

                    return HttpResponseHelper.Response(StatusCodes.Status200OK, new ResponseResult()
                    {
                        IsError = false,
                        Message = @$"Cita agendada exitosamente.La información de la cita ha sido enviada a tu correo electrónico,recuerda presentarlo al momento de asistir a la cita."
                    });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = validationResult.Errors.First().ErrorMessage
                    });
                }
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}