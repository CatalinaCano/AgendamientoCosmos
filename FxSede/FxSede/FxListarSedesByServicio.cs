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
    public class FxListarSedesByServicio
    {
        private readonly IUnitOfWork _unitOfWork;

        public FxListarSedesByServicio(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [FunctionName(nameof(ListarSedesByServicio))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarSedesByServicio", tags: new[] { "Listar Sedes por Servicio" }, Description = "Obtiene las sedes que ofrecen un determinado servicio.", Summary = "Obtiene las sedes que ofrecen un determinado servicio.")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(IList<SedeDto>), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarSedesByServicio(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Sede/Servicio/{idServicio}")] HttpRequest req, string idServicio)
        {
            try
            {
                bool servicioValido = await _unitOfWork.ServicioRepository.GetServicioByIdAsync(idServicio);

                if (servicioValido)
                {
                    IList<SedeDto> sedes = await _unitOfWork.SedeRepository.GetSedesByServicio(idServicio);
                    return HttpResponseHelper.SuccessfulObjectResult(sedes);
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult() { IsError = true, Message = "El Servicio enviado no se encuentra registrado en la base de datos" });
                }
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}