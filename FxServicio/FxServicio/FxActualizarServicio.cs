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
    public class FxActualizarServicio

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<ServicioInput> _servicioValidator;
        private readonly IMapper _mapper;

        public FxActualizarServicio(IUnitOfWork unitOfWork, IValidator<ServicioInput> servicioValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _servicioValidator = servicioValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(ActualizarServicio))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ActualizarServicio", tags: new[] { "Actualizar Servicio" }, Description = "Actualiza un servicio", Summary = "Actualiza un servicio")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idServicio", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador del servicio")]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(ServicioInput), Required = true, Description = "Servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ActualizarServicio(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/Servicio/{idServicio}")] HttpRequest req, string idServicio)
        {
            try
            {
                    var json = await req.ReadAsStringAsync();
                    ServicioInput request = JsonConvert.DeserializeObject<ServicioInput>(json);
                  
                    bool ExisteServicio = await _unitOfWork.ServicioRepository.GetServicioByIdAsync(idServicio)!=null;


                    var validationResult = _servicioValidator.Validate(request);
                    if (validationResult.IsValid&& ExisteServicio)
                    {
                        Servicio servicio = _mapper.Map<Servicio>(request);
                        servicio.UsuarioModificacion = request.Usuario;
                        await _unitOfWork.ServicioRepository.UpsertServicioAsync(servicio, idServicio);
                        return HttpResponseHelper.Response(StatusCodes.Status200OK, new ResponseResult() { IsError = false, Message = "Se ha actualizado correctamente el servicio." });
                    }
                    else
                    {
                        return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                        {
                            IsError = true,
                            Message = !ExisteServicio?"No es posible actualizar el servicio enviado.":validationResult.Errors.First().ErrorMessage
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