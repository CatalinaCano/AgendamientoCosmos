using AutoMapper;

using FxDiasSemana.Interfaces;
using FxDiasSemana.Models;
using FxDiasSemana.Models.DataTransferObjects;
using FxDiasSemana.Utils;

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

namespace FxDiasSemana
{
    public class DescripcionLiteralDiaSemana
    {
        private readonly IDatabaseService _serviceDatabase;
        private readonly IMapper _mapper;

        public DescripcionLiteralDiaSemana(IDatabaseService serviceDatabase, IMapper mapper)
        {
            _mapper = mapper;
            _serviceDatabase = serviceDatabase;
        }

        [FunctionName(nameof(ListarDiasSemana))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ListarDiasSemana", tags: new[] { "Listar Dias Semana" }, Description = "Dias Literales", Summary = "Retorna una coleccion con los dias en español e ingles")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(Dias), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ListarDiasSemana(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/literalDias")] HttpRequest req)
        {
            try
            {
                List<DiasDto> diasresult = await _serviceDatabase.Get();
                List<Dias> result = _mapper.Map<List<Dias>>(diasresult);
                return HttpResponseHelper.SuccessfulObjectResult(result);
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}