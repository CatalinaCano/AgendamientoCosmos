using FxMalla.Interfaces;
using FxMalla.Models;
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
using System.Net;
using System.Threading.Tasks;

namespace FxMalla
{
    public class FxObtenerMallaByID

    {
        public readonly IConfiguration _config;

        private readonly IDataService _dataService;

        public FxObtenerMallaByID(IConfiguration config, IDataService dataService)
        {
            _config = config;
            _dataService = dataService;
        }

        [FunctionName(nameof(ObtenerMallaByID))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ObtenerMallaByID", tags: new[] { "Obtener una malla por su identificador único." }, Description = "End point para Obtener una malla por su identificador único.", Summary = "End point para Obtener una malla por su identificador único")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta OK")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.NoContent, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "No content example")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ObtenerMallaByID(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Malla/MallaID/{idMalla}")] HttpRequest req, string idMalla)
        {
            try
            {
                var result = await _dataService.GetMallaByID(idMalla);
                return result != null ? HttpResponseHelper.SuccessfulObjectResult(result) :
                                       HttpResponseHelper.HttpExplicitNoContent();
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}