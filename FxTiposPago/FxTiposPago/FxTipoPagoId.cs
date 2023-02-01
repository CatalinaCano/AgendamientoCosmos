using AutoMapper;

using FxTiposPago.Interfaces;
using FxTiposPago.Models;
using FxTiposPago.Models.DataTransferObjects;
using FxTiposPago.Utils;

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

namespace FxTiposPago
{
    public class FxTipoPagoId
    {
        private readonly IDatabaseService _serviceDatabase;
        private readonly IMapper _mapper;

        public FxTipoPagoId(IDatabaseService serviceDatabase, IMapper mapper)
        {
            _serviceDatabase = serviceDatabase;
            _mapper = mapper;
        }

        [FunctionName(nameof(LisatTipoPagoID))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "LisatTipoPagoID", tags: new[] { "End point para listar todos los tipos de pago." }, Description = "Descripcion de prueba", Summary = "Resumen de prueba")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(TipoDato), Description = "Respuesta exitosa")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> LisatTipoPagoID(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/tipoPago/{idTipoPago}")] HttpRequest req, string idTipoPago)
        {
            try
            {
                TipoPagoDto result = await _serviceDatabase.GetById(idTipoPago);
                TipoDato data = _mapper.Map<TipoDato>(result);
                return data != null ? HttpResponseHelper.SuccessfulObjectResult(data) : HttpResponseHelper.HttpExplicitNoContent();
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}