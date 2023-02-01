using FluentValidation;

using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models;
using FxMalla.Models.DataTransferObjects;
using FxMalla.Utils;

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
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxMalla
{
    public class FxObtenerDias

    {
        public readonly IConfiguration _config;

        private readonly IUnitOfWork _unitOfWork;

        private readonly IValidator<Tuple<string, string>> _validator;

        public FxObtenerDias(IConfiguration config, IUnitOfWork unitOfWork, IValidator<Tuple<string, string>> validator)
        {
            _config = config;
            _unitOfWork = unitOfWork;
            _validator = validator;
        }

        [FunctionName(nameof(ObtenerDias))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ObtenerDias", tags: new[] { "Obtener Dias Disponibles" }, Description = "End point obtener los dias en los  cuales se encuentra disponible una agenda", Summary = "End point obtener los dias en los  cuales se encuentra disponible una agenda")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta OK")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ObtenerDias(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Malla/Dias/{idSede}/{idServicio}")] HttpRequest req, string idSede, string idServicio)
        {
            try
            {
                Tuple<string, string> data = new(idSede, idServicio);
                var validationResult = _validator.Validate(data);
                if (validationResult.IsValid)
                {
                    List<DiasDto> response = await _unitOfWork.MallaRepository.ObtenerDiasDisponibles(idSede);
                    var subsedesPorServicio = await _unitOfWork.SedeRepository.ObtenerSubsedesPorServicio(idServicio);
                    List<string> datos = new();

                    if (response.Any() && subsedesPorServicio.Any())
                    {
                        var joinedList = (from dias in response
                                          join subsede in subsedesPorServicio on dias.PkSubSede equals subsede.IdSubSede
                                          select dias.Fecha).Distinct().ToList();

                        joinedList.RemoveAll(x => TimeHelper.ValidacionFechaMenor(x));

                        return HttpResponseHelper.Response(StatusCodes.Status200OK, joinedList);
                    }
                    else
                    {
                        return HttpResponseHelper.Response(StatusCodes.Status200OK, datos);
                    }
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