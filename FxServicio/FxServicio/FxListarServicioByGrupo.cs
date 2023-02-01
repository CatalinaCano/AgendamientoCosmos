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
    public class FxListarServicioByGrupo
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarServicioByGrupo(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarServicioGrupo))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarServicioGrupo", tags: new[] { "Listar Servicios por Grupo de Servicio" }, Description = "Obtiene un servicio por el identificador del grupo de servicio", Summary = "Obtiene un servicio por el identificador del grupo de servicio")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idGrupoServicio", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador del grupo de servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "text/json", bodyType: typeof(IList<ServicioDto>), Description = "The OK response")]       
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarServicioGrupo(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Servicio/GrupoServicio/{idGrupoServicio}")] HttpRequest req, string idGrupoServicio)
        {
            try
            {
                bool validar = await _unitOfWork.GrupoServicioRepository.ExistsGrupoServicio(idGrupoServicio);

                if(validar)
                {
                    IList<ServicioDto> servicios = await _unitOfWork.ServicioRepository.GetServicioByIdGrupoServicioAsync(idGrupoServicio);
                    return HttpResponseHelper.SuccessfulObjectResult(servicios);
                }
                else
                {
                    return HttpResponseHelper.BadRequestObjectResult(new ResponseResult() { IsError = true, Message = "El grupo de servicio enviado no se encuentra registrado en la base de datos" });

                }
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}