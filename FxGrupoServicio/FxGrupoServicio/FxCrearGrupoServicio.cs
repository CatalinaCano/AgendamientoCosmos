using AutoMapper;

using FluentValidation;

using FxGrupoServicio.Interfaces.RepositoryPattern;
using FxGrupoServicio.Models;
using FxGrupoServicio.Models.Entities;
using FxGrupoServicio.Models.Input;
using FxGrupoServicio.Utils;

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

namespace FxGrupoServicio
{
    public class FxCrearGrupoServicio

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<GrupoServicioInput> _grupoServicioValidator;
        private readonly IMapper _mapper;

        public FxCrearGrupoServicio(IUnitOfWork unitOfWork, IValidator<GrupoServicioInput> grupoServicioValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _grupoServicioValidator = grupoServicioValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(CrearGrupoServicio))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "CrearGrupoServicio", tags: new[] { "Crear Grupo Servicio" }, Description = "Crea un grupo de servicio", Summary = "Crea un grupo de servicio")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(GrupoServicioInput), Required = true, Description = "Grupo de Servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> CrearGrupoServicio(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/GrupoServicio")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                GrupoServicioInput request = JsonConvert.DeserializeObject<GrupoServicioInput>(json);
                bool existeRecurso = await _unitOfWork.GrupoServicioRepository.ExistsGrupoServicioAsync(request.NombreGrupoServicio);
                var validationResult = _grupoServicioValidator.Validate(request);
                if (validationResult.IsValid && !existeRecurso)
                {
                    GrupoServicio grupoServicio = _mapper.Map<GrupoServicio>(request);
                    
                    string result = await _unitOfWork.GrupoServicioRepository.CreateGrupoServicioAsync(grupoServicio);

                    return result.Equals("Error") ? HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = true, Message = "No es posible registrar la información enviada" })
                                                  : HttpResponseHelper.Response(StatusCodes.Status201Created, new ResponseResult() { IsError = false, Message = result });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = existeRecurso ? "No es posible crear el grupo de servicio enviado" : validationResult.Errors.First().ErrorMessage
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