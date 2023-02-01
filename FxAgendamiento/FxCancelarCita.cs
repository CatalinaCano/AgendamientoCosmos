using AutoMapper;

using FluentValidation;

using FxAgendamiento.Interfaces;
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

using Newtonsoft.Json;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamiento
{
    public class FxCancelarCita

    {

        public readonly IConfiguration _configuration;

        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<CancelacionInput> _validator;
        private readonly IMapper _mapper;
        private readonly IMessageService _messageService;
        private const string OPERACION = "Cancelacion";

        public FxCancelarCita(IUnitOfWork unitOfWork, IValidator<CancelacionInput> validator, IMapper mapper, IMessageService messageService, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _validator = validator;
            _mapper = mapper;
            _messageService = messageService;
            _configuration = configuration;
        }

        [FunctionName(nameof(CancelarCita))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "CancelarCita", tags: new[] { "Cancelar Cita" }, Description = "End point para cancelar una cita previamente creada.", Summary = "End point para cancelar una cita previamente creada.")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(CancelacionInput), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Cancelación Éxitosa")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Conflicto")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> CancelarCita(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/CancelarCita")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                CancelacionInput request = JsonConvert.DeserializeObject<CancelacionInput>(json);

                var validationResult = _validator.Validate(request);
                if (validationResult.IsValid)
                {
                    MallaDto malla = _mapper.Map<MallaDto>(request);
                    List<CancelacionDto> citasCanceladas = await _unitOfWork.MallaRepository.ObtenerHorasCancelacion(malla, request.IdTramite);

                    var horas = citasCanceladas.Select(cita => new { cita.HoraInicio, cita.Tramites, cita.CantidadPersonas });

                    foreach (var hora in horas)
                    {
                        bool activarAgenda = (hora.CantidadPersonas >= (hora.Tramites.Length - 1));
                        await _unitOfWork.MallaRepository.CancelarCita(malla, hora.HoraInicio, hora.Tramites, request.IdTramite, request.IdUsuario, activarAgenda);
                    }

                    await _unitOfWork.TramiteRepository.AgregarEstado(request.IdUsuario, request.IdTramite, new() { NombreEstado = _configuration["Estados:Cancelacion"] });

                    CitasDto cita = await _unitOfWork.TramiteRepository.ObtenerCita(request.IdUsuario, request.IdTramite);
                    SedeDto sede = await _unitOfWork.SedeRepository.ObtenerDatosSede(cita.PkSede, cita.PkSubSede);
                    ServicioDto servicio = await _unitOfWork.ServicioRepository.ObtenerTiempodeAtencionServicio(cita.PkServicio);
                    UsuarioDto user = await _unitOfWork.UsuarioRepository.ObtenerUsuario(request.IdUsuario);

                    ValoresDto values = new()
                    {
                        IdUser = request.IdUsuario,
                        IdTramite = request.IdTramite,
                        Nombre = user.Nombres,
                        Direccion = string.Concat(sede.NombreSede, "<br>",
                                                  sede.Direccion, "<br>",
                                                  sede.NombreSubSede),
                        NombreServicio = servicio.nombreServicio,
                        Fecha = cita.FechaAgendamiento,
                        Hora = cita.HoraAgendamiento,
                        Tiempo = $"{cita.DuracionServicio} min"
                    };

                    await _messageService.CrearMensaje(user.CorreoElectronico, values, OPERACION);

                    return HttpResponseHelper.Response(StatusCodes.Status200OK, new ResponseResult()
                    {
                        IsError = false,
                        Message = "Cita cancelada exitosamente."
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