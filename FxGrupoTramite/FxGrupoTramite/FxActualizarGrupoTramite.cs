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
    public class FxActualizarGrupoTramite

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<GrupoTramiteInput> _grupoTramiteValidator;
        private readonly IMapper _mapper;

        public FxActualizarGrupoTramite(IUnitOfWork unitOfWork, IValidator<GrupoTramiteInput> grupoTramiteValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _grupoTramiteValidator = grupoTramiteValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(ActualizarGrupoTramite))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ActualizarGrupoTramite", tags: new[] { "Actualizar grupo de tramite" }, Description = "Actualiza un grupo de tramite", Summary = "Actualiza un grupo de tramite")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idGrupoTramite", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador del grupo de tramite")]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(GrupoTramiteInput), Required = true, Description = "Grupo de Servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ActualizarGrupoTramite(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/GrupoTramite/{idGrupoTramite}")] HttpRequest req, string idGrupoTramite)
        {
            try
            {
                var json = await req.ReadAsStringAsync();

                GrupoTramiteInput request = JsonConvert.DeserializeObject<GrupoTramiteInput>(json);
                var validationResult = _grupoTramiteValidator.Validate(request);
                bool existeRecurso = await _unitOfWork.GrupoTramiteRepository.GetGrupoTramiteByIdAsync(idGrupoTramite) != null;
                if (validationResult.IsValid && existeRecurso)
                {
                    GrupoTramite grupoServicio = _mapper.Map<GrupoTramite>(request);
                    grupoServicio.UsuarioModificacion = request.Usuario;
                    string result = await _unitOfWork.GrupoTramiteRepository.UpsertGrupoTramiteAsync(grupoServicio, idGrupoTramite);
                    return result.Equals("OK")
                           ? HttpResponseHelper.Response(StatusCodes.Status200OK, new ResponseResult() { IsError = false, Message = "Se ha actualizado correctamente el grupo de tramite" })
                           : HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = false, Message = "Se ha presentado un error al intentar actualizar." });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = !existeRecurso ? "No es posible actualizar el grupo de tramite enviado" : validationResult.Errors.First().ErrorMessage
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