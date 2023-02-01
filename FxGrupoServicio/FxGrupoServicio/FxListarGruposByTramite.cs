using FxGrupoServicio.Interfaces.RepositoryPattern;
using FxGrupoServicio.Models;
using FxGrupoServicio.Models.DataTransferObjects;
using FxGrupoServicio.Utils;

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

namespace FxGrupoServicio
{
    public class FxListarGruposByTramite
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarGruposByTramite(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarGruposByTramite))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarGruposByTramite", tags: new[] { "Listar todos los grupos de servicio por grupo de tramite" }, Description = "Obtiene los grupos de servicio por grupo de tramite", Summary = "Obtiene todo los grupos de servicio que estan activos por grupo de trami")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(IList<GrupoServicioDto>), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarGruposByTramite(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/GrupoServicio/GrupoTramite/{idTramite}")] HttpRequest req, string idTramite)
        {
            try
            {
                IList<GrupoServicioDto> gruposServicio = await _unitOfWork.GrupoServicioRepository.GetGrupoServicioByGrupoTramiteAsync(idTramite);
                return HttpResponseHelper.SuccessfulObjectResult(gruposServicio);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}