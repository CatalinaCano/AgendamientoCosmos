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
    public class FxListarSubSedesByID
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarSubSedesByID(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarSubSedesByID))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarSubSedesByID", tags: new[] { "Obtiene una sede por su identificador" }, Description = "Obtiene una sede por su identificador", Summary = "Obtiene una sede por su identificador")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idSede", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador de la sede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(SubSedeDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarSubSedesByID(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/SubSedes/{idSede}/{idSubSede}")] HttpRequest req, string idSede, string idSubSede)
        {
            try
            {

                var data = await _unitOfWork.SedeRepository.GetSedeByID(idSede);


                if (data != null)
                {
                    SubSedeDto subsedes = await _unitOfWork.SedeRepository.GetSubSedesByIdAsync(idSede,idSubSede);
                    return HttpResponseHelper.SuccessfulObjectResult(subsedes);
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = "No es posible retornar la subsede de la sede enviada"
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