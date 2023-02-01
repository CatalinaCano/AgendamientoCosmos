using FluentValidation;

using FxMalla.Interfaces;
using FxMalla.Models;
using FxMalla.Models.Input;
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
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxMalla
{
    public class FxObtenerMallaByFecha

    {
        public readonly IConfiguration _config;
        private readonly IValidator<FechaInput> _validator;
        private readonly IDataService _dataService;

        public FxObtenerMallaByFecha(IConfiguration config, IDataService dataService, IValidator<FechaInput> validator)
        {
            _config = config;
            _dataService = dataService;
            _validator = validator; 
        }

        [FunctionName(nameof(ObtenerMallaByFecha))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ObtenerMallaByFecha", tags: new[] { "Obtener todos los tramites en un rango de fechas establecido" }, Description = "End point para Obtener todos los tramites en un rango de fechas establecido.", Summary = "End point para Obtener todos los tramites en un rango de fechas establecido.")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta OK")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ObtenerMallaByFecha(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Malla/Fechas")] HttpRequest req)
        {
            try
            {
                string fechaInicio = req.Query["fechaInicio"];
                string fechaFin = req.Query["fechaFin"];

                FechaInput fecha = new()
                {
                    FechaInicio = fechaInicio,
                    FechaFin = fechaFin
                };

                var validationResult = _validator.Validate(fecha);

                if (validationResult.IsValid)
                {
                    var result = await _dataService.GetMallaByFecha(fecha);
                    return HttpResponseHelper.SuccessfulObjectResult(result);
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