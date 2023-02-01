using AutoMapper;

using FluentValidation;

using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models;
using FxSede.Models.Entities;
using FxSede.Models.Input;
using FxSede.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.OpenApi.Models;

using Newtonsoft.Json;

using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxSede
{
    public class FxCrearSede

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<SedeInput> _sedeValidator;
        private readonly IMapper _mapper;

        public FxCrearSede(IUnitOfWork unitOfWork, IValidator<SedeInput> sedeValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _sedeValidator = sedeValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(CrearSede))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "CrearSede", tags: new[] { "Crear Sede" }, Description = "Crea una sede", Summary = "Crea una sede")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(SedeInput), Required = true, Description = "Sede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Ejemplo de conflicto en la operacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> CrearSede(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/Sede")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                SedeInput request = JsonConvert.DeserializeObject<SedeInput>(json);
                bool existeRecurso = await _unitOfWork.SedeRepository.ExistsSedeAsync(request.NombreSede);
                var validationResult = _sedeValidator.Validate(request);
                if (validationResult.IsValid && !existeRecurso)
                {
                    Sede sede = _mapper.Map<Sede>(request);
                    string result = await _unitOfWork.SedeRepository.CreateSedeAsync(sede);

                    return result.Equals("Error") ? HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = true, Message = "No es posible registrar la información enviada" })
                                                  : HttpResponseHelper.Response(StatusCodes.Status201Created, new ResponseResult() { IsError = false, Message = result });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = existeRecurso ? "No es posible crear la sede enviada" : validationResult.Errors.First().ErrorMessage
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