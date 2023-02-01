using AutoMapper;

using FluentValidation;

using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models;
using FxAgendamiento.Models.Entities;
using FxAgendamiento.Models.Input;
using FxAgendamiento.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Configuration;
using Microsoft.OpenApi.Models;

using Newtonsoft.Json;

using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamiento
{
    public class FxAgregarEstado

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<NuevoEstadoInput> _validator;
        
        private readonly IMapper _mapper;

        public FxAgregarEstado(IUnitOfWork unitOfWork, IValidator<NuevoEstadoInput> validator,IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _validator = validator;            
            _mapper = mapper;
        }

        [FunctionName(nameof(AgregarEstado))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "AgregarEstado", tags: new[] { "Agregar Estado" }, Description = "End point para agregar un nuevo estado a un tramite", Summary = "End point para agregar un nuevo estado a un tramite")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(NuevoEstadoInput), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Conflicto")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> AgregarEstado(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/AgregarEstado")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                NuevoEstadoInput request = JsonConvert.DeserializeObject<NuevoEstadoInput>(json);

                var validationResult = _validator.Validate(request);
                if (validationResult.IsValid)
                {

                    Estado estado = _mapper.Map<Estado>(request);

                    string result = await _unitOfWork.TramiteRepository.AgregarEstado(request.IdUsuario, request.IdTramite, estado);
                    return result.Equals("OK") ? HttpResponseHelper.Response(StatusCodes.Status201Created, new ResponseResult() { IsError = false, Message = "Estado agregado exitosamente" }) : HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = true, Message = "No es posible registrar la información enviada" });
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