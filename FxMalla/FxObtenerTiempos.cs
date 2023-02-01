using AutoMapper;

using FluentValidation;

using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models;
using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Input;
using FxMalla.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Configuration;
using Microsoft.OpenApi.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxMalla
{
    public class FxObtenerTiempos

    {
        public readonly IConfiguration _config;

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IValidator<Tuple<string, string, string>> _validator;

        public FxObtenerTiempos(IConfiguration config, IUnitOfWork unitOfWork, IMapper mapper, IValidator<Tuple<string, string, string>> validator)
        {
            _config = config;
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _validator = validator;
        }

        [FunctionName(nameof(ObtenerTiempos))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ObtenerTiempos", tags: new[] { "Obtener RespuestaTiempo" }, Description = "End point obtener los tiempos en los cuales se encuentra disponible una agenda", Summary = "End point obtener los tiempos en los cuales se encuentra disponible una agenda.")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(MallaInput), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta OK")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ObtenerTiempos(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/Malla/{idSede}/{idServicio}/{idUsuario}")] HttpRequest req, string idSede, string idServicio, string idUsuario)
        {
            try
            {
                string fecha = req.Query["fechaAgenda"];
                Tuple<string, string, string> data = new(idSede, idServicio, fecha);
                var validationResult = _validator.Validate(data);
                if (validationResult.IsValid)
                {
                    var tiempos = await _unitOfWork.MallaRepository.ObtenerTiempos(idSede, fecha, idUsuario);
                    var subsedesPorServicio = await _unitOfWork.SedeRepository.ObtenerSubsedesPorServicio(idServicio);
                    List<RespuestaTiempos> datos = new();

                    if (tiempos.Any() && subsedesPorServicio.Any())
                    {
                        var joinedList = (from tiempo in tiempos
                                          join subsede in subsedesPorServicio on tiempo.IdSubSede equals subsede.IdSubSede
                                          select new
                                          {
                                              tiempo.IdMalla,
                                              tiempo.IdSede,
                                              tiempo.IdSubSede,
                                              tiempo.Fecha,
                                              tiempo.HoraInicio,
                                              subsede.Prioridad,
                                              tiempo.UsuarioVetado
                                          }).OrderBy(row => row.HoraInicio).ThenBy(row => row.Prioridad).DistinctBy(row => row.HoraInicio);

                        if (joinedList.Any())
                        {
                            var FilterList = joinedList.Where(user => !user.UsuarioVetado)
                           .Select(u => new RespuestaTiempo
                           {
                               PkMalla = u.IdMalla,
                               PkSede = u.IdSede,
                               PkSubSede = u.IdSubSede,
                               Fecha = u.Fecha,
                               HoraInicio = u.HoraInicio
                           });

                            datos = _mapper.Map<List<RespuestaTiempos>>(FilterList);
                        }
                    }
                    return HttpResponseHelper.Response(StatusCodes.Status200OK, datos);
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