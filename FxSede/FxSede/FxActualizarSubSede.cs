using AutoMapper;

using FluentValidation;

using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models;
using FxSede.Models.Entities;
using FxSede.Models.Input;
using FxSede.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Cosmos.Serialization.HybridRow;
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
    public class FxActualizarSubSede

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<SubSedeInput> _subSedeValidator;
        private readonly IMapper _mapper;

        public FxActualizarSubSede(IUnitOfWork unitOfWork, IValidator<SubSedeInput> subSedeValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _subSedeValidator = subSedeValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(ActualizarSubSede))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ActualizarSubSede", tags: new[] { "Actualizar SubSede" }, Description = "Actualiza una subsede", Summary = "Actualiza una subsede")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idSede", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador de la sede")]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(SubSedeInput), Required = true, Description = "Subsede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Conflict Response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ActualizarSubSede(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/SubSede/{idSede}")] HttpRequest req, string idSede)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                SubSedeInput request = JsonConvert.DeserializeObject<SubSedeInput>(json);
                request.idSede = idSede;
                bool existeRecurso = await _unitOfWork.SedeRepository.ExistsSubSedeAsync(idSede, request.IdSubSede);
                var validationResult = _subSedeValidator.Validate(request);
                if (validationResult.IsValid && existeRecurso)
                {
                    SubSede subsede = _mapper.Map<SubSede>(request);
                    subsede.UsuarioModificacion = request.Usuario;
                    subsede.IdSubSede = request.IdSubSede;
                    var result = await _unitOfWork.SedeRepository.UpdateSubSede(subsede, idSede);
                    return result.Equals("OK")
                           ? HttpResponseHelper.Response(StatusCodes.Status200OK, new ResponseResult() { IsError = false, Message = "Se ha actualizado correctamente la subsede" })
                           : HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = false, Message = "Se ha presentado un error al intentar actualizar la subsede." });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = !existeRecurso ? "No es posible actualizar la subsede enviada" : validationResult.Errors.First().ErrorMessage
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