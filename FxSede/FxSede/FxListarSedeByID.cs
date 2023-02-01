using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models;
using FxSede.Models.DataTransferObjects;
using FxSede.Utils;

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

namespace FxSede
{
    public class FxListarSedeByID
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarSedeByID(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarSedeByID))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarSedeByID", tags: new[] { "Listar Sede por Id" }, Description = "Obtiene una sede por su identificador", Summary = "Obtiene una sede por su identificador")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idSede", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador de la sede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(SedeDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.NoContent, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "No Content")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarSedeByID(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Sede/{idSede}")] HttpRequest req, string idSede)
        {
            try
            {
                SedeDto sede = await _unitOfWork.SedeRepository.GetSedeByID(idSede);
                return sede == null ? HttpResponseHelper.HttpExplicitNoContent() : HttpResponseHelper.SuccessfulObjectResult(sede);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}