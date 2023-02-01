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
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace FxTiposPago
{
    public class FuncGetTiposPago
    {
        private readonly IDatabaseService _serviceDatabase;
        private readonly IMapper _mapper;

        public FuncGetTiposPago(IDatabaseService serviceDatabase, IMapper mapper)
        {
            _serviceDatabase = serviceDatabase;
            _mapper = mapper;
        }

        [FunctionName(nameof(ListarTiposDePago))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarTiposDePago", tags: new[] { "End point para listar todos los tipos de pago." }, Description = "Descripcion de prueba", Summary = "Resumen de prueba")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(TipoDato), Description = "Respuesta exitosa")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarTiposDePago(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/tipoPago")] HttpRequest req)
        {
            try
            {
                List<TipoPagoDto> result = await _serviceDatabase.Get();
                List<TipoDato> list = _mapper.Map<List<TipoDato>>(result);
                return HttpResponseHelper.SuccessfulObjectResult(list);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}