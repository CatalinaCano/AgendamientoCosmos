using FxGrupoTramite.Interfaces.RepositoryPattern;
using FxGrupoTramite.Models;
using FxGrupoTramite.Models.DataTransferObjects;
using FxGrupoTramite.Utils;

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

namespace FxGrupoTramite
{
    public class FxListarGruposTramite
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarGruposTramite(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarGruposTramite))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarGruposTramite", tags: new[] { "Listar todos los grupos de tramites activos" }, Description = "Obtiene los grupos de tramite", Summary = "Obtiene todo los grupos de tramite que estan activos")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(IList<GrupoTramiteDto>), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarGruposTramite(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/GrupoTramite")] HttpRequest req)
        {
            try
            {
                IList<GrupoTramiteDto> gruposServicio = await _unitOfWork.GrupoTramiteRepository.GetGruposTramiteAsync();
                return HttpResponseHelper.SuccessfulObjectResult(gruposServicio);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}