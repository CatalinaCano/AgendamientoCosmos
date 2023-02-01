using FxServicio.Interfaces.RepositoryPattern;
using FxServicio.Models;
using FxServicio.Models.DataTransferObjects;
using FxServicio.OpenApi;
using FxServicio.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.OpenApi.Models;

using System;
using System.Net;
using System.Threading.Tasks;

namespace FxServicio
{
    public class FxListarServicioByID
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarServicioByID(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarServicioID))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarServicioID", tags: new[] { "Listar Servicio por ID" }, Description = "Obtiene un servicio por su identificador", Summary = "Obtiene un servicio por su identificador")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idServicio", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador del servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ServicioDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.NoContent, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "No Content")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarServicioID(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Servicio/{idServicio}")] HttpRequest req, string idServicio)
        {
            try
            {
                ServicioDto servicio = await _unitOfWork.ServicioRepository.GetServicioByIdAsync(idServicio);
                return HttpResponseHelper.SuccessfulObjectResult(servicio);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}