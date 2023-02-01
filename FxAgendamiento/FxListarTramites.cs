using FluentValidation;

using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.OpenApi.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamiento
{
    public class FxListarTramites

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<Tuple<string, string>> _validator;  

        public FxListarTramites(IUnitOfWork unitOfWork, IValidator<Tuple<string,string>> validator)
        {
            _unitOfWork = unitOfWork;
            _validator = validator;
        }

        [FunctionName(nameof(ListarTramites))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarTramites", tags: new[] { "Listar Tramites" }, Description = "End point para listar todos los tramites en espera de una subsede", Summary = "End point para listar todos los tramites en espera de una subsede")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(List<ResponseCitasAtender>), Description = "Respuesta de OK")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Conflicto")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarTramites(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/ListarTramites/{idSede}/{idSubSede}")] HttpRequest req, string idSede, string idSubSede)
        {
            try
            {
                Tuple<string,string> input = new(idSede, idSubSede);
                var validationResult = _validator.Validate(input);
                if (validationResult.IsValid)
                {
                    List<ResponseCitasAtender> tramites = new() { };
                    List<TramiteEnEsperaDto> citas = await _unitOfWork.TramiteRepository.ListarTramitesEnEspera(idSede, idSubSede);
                    foreach (TramiteEnEsperaDto cita in citas)
                    {
                        #nullable enable
                        ServicioDto? servicio = await _unitOfWork.ServicioRepository.ObtenerTiempodeAtencionServicio(cita.idServicio);
                        UsuarioDto? usuario = await _unitOfWork.UsuarioRepository.ObtenerUsuario(cita.idUsuario);
                        
                        tramites.Add(new ResponseCitasAtender()
                        {
                            Nombres = usuario?.Nombres,
                            NumeroDocumento = usuario?.NumeroIdentificacion,
                            CorreoElectronico = usuario?.CorreoElectronico,
                            NombreServicio = servicio?.nombreServicio,
                            DuracionServicio = cita?.duracionServicio != null ? string.Concat(cita?.duracionServicio, " min") : null
                        });
                        #nullable disable
                    }

                    return HttpResponseHelper.Response(StatusCodes.Status200OK, tramites);
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