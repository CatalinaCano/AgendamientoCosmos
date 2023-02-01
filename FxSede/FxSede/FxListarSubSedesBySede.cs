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
    public class FxListarSubSedesBySede
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarSubSedesBySede(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarSubSedesByIDSede))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarSubSedesByID", tags: new[] { "Listar todas las SubSedes de una Sede" }, Description = "Obtiene las subsedes de una sede", Summary = "Obtiene las subsedes que se encuentran activas de una sede")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idSede", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador de la sede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(IList<SubSedeDto>), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarSubSedesByIDSede(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/SubSedes/{idSede}")] HttpRequest req, string idSede)
        {
            try
            {

                var data = await _unitOfWork.SedeRepository.GetSedeByID(idSede);

                if (data != null)
                {
                    IList<SubSedeDto> subsedes = await _unitOfWork.SedeRepository.GetSubSedesByIdSedeAsync(idSede);
                    return HttpResponseHelper.SuccessfulObjectResult(subsedes);
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = "No es posible retornar las subsedes de la sede enviada"
                    });
                }

            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}