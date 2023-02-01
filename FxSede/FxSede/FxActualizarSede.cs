using AutoMapper;

using FluentValidation;

using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models;
using FxSede.Models.DataTransferObjects;
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
    public class FxActualizarSede

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<SedeInput> _sedeValidator;
        private readonly IMapper _mapper;

        public FxActualizarSede(IUnitOfWork unitOfWork, IValidator<SedeInput> sedeValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _sedeValidator = sedeValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(ActualizarSede))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ActualizarSede", tags: new[] { "Actualizar Sede" }, Description = "Actualiza una sede", Summary = "Actualiza una sede")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idSede", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador de la sede")]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(SedeInput), Required = true, Description = "Sede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ActualizarSede(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/Sede/{idSede}")] HttpRequest req, string idSede)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                SedeInput request = JsonConvert.DeserializeObject<SedeInput>(json);

                var validationResult = _sedeValidator.Validate(request);
                if (validationResult.IsValid )
                {
                    Sede sede = _mapper.Map<Sede>(request);
                    sede.UsuarioModificacion = request.Usuario;
                    sede.FechaModificacion = DateTimeOffset.Now;
                    string result = await _unitOfWork.SedeRepository.PatchSedeAsync(sede, idSede);
                    return result.Equals("OK")
                           ? HttpResponseHelper.Response(StatusCodes.Status200OK, new ResponseResult() { IsError = false, Message = "Se ha actualizado correctamente la sede" })
                           : HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = false, Message = "Se ha presentado un error al intentar actualizar la sede." });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = validationResult.Errors.First().ErrorMessage
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