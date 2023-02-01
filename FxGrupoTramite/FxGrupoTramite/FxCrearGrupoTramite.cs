using AutoMapper;

using FluentValidation;

using FxGrupoTramite.Interfaces.RepositoryPattern;
using FxGrupoTramite.Models;
using FxGrupoTramite.Models.Entities;
using FxGrupoTramite.Models.Input;
using FxGrupoTramite.Utils;

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

namespace FxGrupoTramite
{
    public class FxCrearGrupoTramite

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<GrupoTramiteInput> _grupoTramiteValidator;
        private readonly IMapper _mapper;

        public FxCrearGrupoTramite(IUnitOfWork unitOfWork, IValidator<GrupoTramiteInput> grupoTramiteValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _grupoTramiteValidator = grupoTramiteValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(CrearGrupoTramite))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "CrearGrupoTramite", tags: new[] { "Crear Grupo Tramite" }, Description = "Crea un grupo de tramite", Summary = "Crea un grupo de tramite")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(GrupoTramiteInput), Required = true, Description = "Grupo de Servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> CrearGrupoTramite(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/GrupoTramite")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                GrupoTramiteInput request = JsonConvert.DeserializeObject<GrupoTramiteInput>(json);
                bool existeRecurso = await _unitOfWork.GrupoTramiteRepository.ExistsGrupoTramiteAsync(request.NombreGrupoTramite);
                var validationResult = _grupoTramiteValidator.Validate(request);
                if (validationResult.IsValid && !existeRecurso)
                {
                    GrupoTramite grupoTramite = _mapper.Map<GrupoTramite>(request);

                    string result = await _unitOfWork.GrupoTramiteRepository.CreateGrupoTramiteAsync(grupoTramite);

                    return result.Equals("Error") ? HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = true, Message = "No es posible registrar la información enviada" })
                                                  : HttpResponseHelper.Response(StatusCodes.Status201Created, new ResponseResult() { IsError = false, Message = result });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = existeRecurso ? "No es posible crear el grupo de tramite enviado" : validationResult.Errors.First().ErrorMessage
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