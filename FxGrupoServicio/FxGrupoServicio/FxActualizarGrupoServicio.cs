using AutoMapper;

using FluentValidation;

using FxGrupoServicio.Interfaces.RepositoryPattern;
using FxGrupoServicio.Models;
using FxGrupoServicio.Models.Entities;
using FxGrupoServicio.Models.Input;
using FxGrupoServicio.Utils;

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

namespace FxGrupoServicio
{
    public class FxActualizarGrupoServicio

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<GrupoServicioInput> _grupoServicioValidator;
        private readonly IMapper _mapper;

        public FxActualizarGrupoServicio(IUnitOfWork unitOfWork, IValidator<GrupoServicioInput> grupoServicioValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _grupoServicioValidator = grupoServicioValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(ActualizarGrupoServicio))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ActualizarGrupoServicio", tags: new[] { "Actualizar grupo de servicio" }, Description = "Actualiza un grupo de servicio", Summary = "Actualiza un grupo de servicio")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idGrupoServicio", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador del grupo de servicio")]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(GrupoServicioInput), Required = true, Description = "Grupo de Servicio")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ActualizarGrupoServicio(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/GrupoServicio/{idGrupoServicio}")] HttpRequest req, string idGrupoServicio)
        {
            try
            {
                var json = await req.ReadAsStringAsync();

                GrupoServicioInput request = JsonConvert.DeserializeObject<GrupoServicioInput>(json);
                var validationResult = _grupoServicioValidator.Validate(request);
                bool existeRecurso = await _unitOfWork.GrupoServicioRepository.GetGrupoServicioByIdAsync(idGrupoServicio) != null;
                if (validationResult.IsValid && existeRecurso)
                {
                    GrupoServicio grupoServicio = _mapper.Map<GrupoServicio>(request);
                    grupoServicio.UsuarioModificacion = request.Usuario;
                    string result = await _unitOfWork.GrupoServicioRepository.UpsertGrupoServicioAsync(grupoServicio, idGrupoServicio);
                    return result.Equals("OK")
                           ? HttpResponseHelper.Response(StatusCodes.Status200OK, new ResponseResult() { IsError = false, Message = "Se ha actualizado correctamente el grupo de servicio" })
                           : HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = false, Message = "Se ha presentado un error al intentar actualizar." });
                }
                else
                {

                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = !existeRecurso ? "No es posible actualizar el grupo de servicio enviado" : validationResult.Errors.First().ErrorMessage
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