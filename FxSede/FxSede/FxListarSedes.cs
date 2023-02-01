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
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace FxSede
{
    public class FxListarSedes
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarSedes(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarSedes))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarSedes", tags: new[] { "Listar Sedes" }, Description = "Obtiene las sedes activas", Summary = "Obtiene las sedes que se encuentran activas")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(IList<SedeDto>), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarSedes(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Sede")] HttpRequest req)
        {
            try
            {
                IList<SedeDto> sedes = await _unitOfWork.SedeRepository.GetSedesAsync();
                return HttpResponseHelper.SuccessfulObjectResult(sedes);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}