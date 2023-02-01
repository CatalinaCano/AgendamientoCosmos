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
using System.Net;
using System.Threading.Tasks;

namespace FxGrupoServicio
{
    public class FxGrupoServicioByID
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxGrupoServicioByID(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarGrupoServicioID))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarGrupoServicioID", tags: new[] { "Listar Grupo Servicio ID" }, Description = "Obtiene un grupo de servicio por su identificador", Summary = "Obtiene un grupo de servicio por su identificador")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idGrupoServicio", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador del grupo de servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(GrupoServicioDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarGrupoServicioID(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/GrupoServicio/{idGrupoServicio}")] HttpRequest req, string idGrupoServicio)
        {
            try
            {
                GrupoServicioDto gruposServicio = await _unitOfWork.GrupoServicioRepository.GetGrupoServicioByIdAsync(idGrupoServicio);
                return HttpResponseHelper.SuccessfulObjectResult(gruposServicio);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}