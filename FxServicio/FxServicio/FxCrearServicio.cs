using AutoMapper;

using FluentValidation;

using FxServicio.Interfaces.RepositoryPattern;
using FxServicio.Models;
using FxServicio.Models.Entities;
using FxServicio.Models.Input;
using FxServicio.Utils;

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

namespace FxServicio
{
    public class FxCrearServicio

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<ServicioInput> _servicioValidator;
        private readonly IMapper _mapper;

        public FxCrearServicio(IUnitOfWork unitOfWork, IValidator<ServicioInput> servicioValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _servicioValidator = servicioValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(CrearServicio))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "CrearServicio", tags: new[] { "Crear Servicio" }, Description = "Crea un servicio", Summary = "Crea un servicio")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(ServicioInput), Required = true, Description = "Servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> CrearServicio(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/Servicio")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                ServicioInput request = JsonConvert.DeserializeObject<ServicioInput>(json);
                bool existeRecurso = await _unitOfWork.ServicioRepository.ExistsServicioAsync(request.NombreServicio);
                var validationResult = _servicioValidator.Validate(request);
                if (validationResult.IsValid && !existeRecurso)
                {
                    Servicio servicio = _mapper.Map<Servicio>(request);
                    servicio.UsuarioCreacion = request.Usuario;
                    string result = await _unitOfWork.ServicioRepository.CreateServicioAsync(servicio);

                    return result.Equals("Error") ? HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = true, Message = "No es posible registrar la informaci�n enviada" })
                                                 : HttpResponseHelper.Response(StatusCodes.Status201Created, new ResponseResult() { IsError = false, Message = result });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = existeRecurso ? "No es posible crear el servicio enviado" : validationResult.Errors.First().ErrorMessage
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