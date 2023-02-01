using FxAgendamientoMasivo.Interfaces;
using FxAgendamientoMasivo.Models;
using FxAgendamientoMasivo.Models.CSV;
using FxAgendamientoMasivo.Models.Input;
using FxAgendamientoMasivo.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.OpenApi.Models;

using Newtonsoft.Json;

using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamientoMasivo
{
    public class FxAgendamientoMasivo
    {
        private readonly IMessageService _messageService;

        public FxAgendamientoMasivo(IMessageService messageService)
        {
            _messageService = messageService;
        }

        [FunctionName(nameof(AgendamientoMasivo))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "AgendamientoMasivo", tags: new[] { "AgendamientoMasivo" }, Description = "End point para cargar una base csv que representa el agendamiento masivo", Summary = "End point para cargar una base csv que representa el agendamiento masivo")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(Request), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> AgendamientoMasivo(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/AgendamientoMasivo")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                Request request = JsonConvert.DeserializeObject<Request>(json);
                string file = FileParser.Base64_Decode(request.File);

                List<string[]> splitData = FileParser.SplitFile(file, char.Parse(","));
                var data = (dynamic)FileParser.ParseFileInfo<AgendamientoInfo>(splitData);

                if (data.Count == 0)
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult() { IsError = true, Message = "El archivo enviado posee error en los datos." });
                }
                else
                {
                    foreach (var row in data)
                    {
                        await _messageService.CrearMensaje(row);
                    }

                    return HttpResponseHelper.SuccessfulObjectResult(new ResponseResult() { IsError = false, Message = "Base Cargada Exitosamente" });
                }
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError, new ResponseResult() { IsError = true, Message = ex.Message });
            }
        }
    }
}