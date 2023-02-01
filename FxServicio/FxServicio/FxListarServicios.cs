using FxServicio.Interfaces.RepositoryPattern;
using FxServicio.Models;
using FxServicio.Models.DataTransferObjects;
using FxServicio.Utils;

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

namespace FxServicio
{
    public class FxListarServicios
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarServicios(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarServicios))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarServicios", tags: new[] { "Listar Servicios Activos" }, Description = "Obtiene los servicios", Summary = "Obtiene los servicios que se encuentra activos")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(IList<ServicioDto>), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarServicios(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Servicio")] HttpRequest req)
        {
            try
            {
                IList<ServicioDto> servicios = await _unitOfWork.ServicioRepository.GetServiciosAsync();
                return HttpResponseHelper.SuccessfulObjectResult(servicios);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}