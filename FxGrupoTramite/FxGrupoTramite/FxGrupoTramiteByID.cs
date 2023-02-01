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
using System.Net;
using System.Threading.Tasks;

namespace FxGrupoTramite
{
    public class FxGrupoTramiteByID
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxGrupoTramiteByID(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarGrupoTramiteID))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarGrupoTramiteID", tags: new[] { "Listar Grupo Tramite ID" }, Description = "Obtiene un grupo de tramite por su identificador", Summary = "Obtiene un grupo de tramite por su identificador")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idGrupoTramite", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador del grupo de Tramite")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(GrupoTramiteDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarGrupoTramiteID(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/GrupoTramite/{idGrupoTramite}")] HttpRequest req, string idGrupoTramite)
        {
            try
            {
                GrupoTramiteDto grupoTramite = await _unitOfWork.GrupoTramiteRepository.GetGrupoTramiteByIdAsync(idGrupoTramite);
                return HttpResponseHelper.SuccessfulObjectResult(grupoTramite);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}