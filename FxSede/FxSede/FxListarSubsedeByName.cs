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
    public class FxListarSubsedeByName
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarSubsedeByName(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarSubsedeByName))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarSubsedeByName", tags: new[] { "Listar una subsede por su nombre" }, Description = "Obtiene una subsede por su nombre", Summary = "Obtiene una subsede por su nombre")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idSede", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador de la sede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(SedeDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.NoContent, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "No Content")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarSubsedeByName(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Sede/Subsede/{idSede}/{nombre}")] HttpRequest req, string idSede, string nombre)
        {
            try
            {

               
                var data = await _unitOfWork.SedeRepository.GetSedeByID(idSede);

                if (data != null)
                {
                    SubSedeDto subSede = await _unitOfWork.SedeRepository.GetSubSedeByName(idSede, nombre);
                
                    return subSede == null ? HttpResponseHelper.HttpExplicitNoContent() : HttpResponseHelper.SuccessfulObjectResult(subSede);
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message =  "La sede enviada no esta registrada en la base de datos"
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