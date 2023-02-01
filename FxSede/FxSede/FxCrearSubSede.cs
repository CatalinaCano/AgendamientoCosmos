using AutoMapper;

using FluentValidation;

using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models;
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
    public class FxCrearSubSede

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<SubSedeInput> _subSedeValidator;
        private readonly IMapper _mapper;

        public FxCrearSubSede(IUnitOfWork unitOfWork, IValidator<SubSedeInput> subSedeValidator, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _subSedeValidator = subSedeValidator;
            _mapper = mapper;
        }

        [FunctionName(nameof(CrearSubSede))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "CrearSubSede", tags: new[] { "Crear SubSede" }, Description = "Crea una subsede", Summary = "Crea una subsede")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiParameter(name: "idSede", In = ParameterLocation.Path, Required = true, Type = typeof(string), Description = "Identificador de la sede")]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(SubSedeInput), Required = true, Description = "Subsede")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> CrearSubSede(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/SubSede/{idSede}")] HttpRequest req, string idSede)
        {
            try
            {
                var json = await req.ReadAsStringAsync();

                SubSedeInput request = JsonConvert.DeserializeObject<SubSedeInput>(json);
                request.idSede = idSede;
                bool existeSubSede  = await _unitOfWork.SedeRepository.GetSubSedeByName(idSede, request.NombreSubSede)!=null;


                var validationResult = _subSedeValidator.Validate(request);
                if (validationResult.IsValid && !existeSubSede)
                {
                    SubSede subsede = _mapper.Map<SubSede>(request);

                    string result  = await _unitOfWork.SedeRepository.AddSubSede(subsede, idSede);
                    return result.Contains("Error") ? HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = true, Message = $"No es posible registrar la información enviada. {result}" })
                                                  : HttpResponseHelper.Response(StatusCodes.Status201Created, new ResponseResult() { IsError = false, Message = result });
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status400BadRequest, new ResponseResult()
                    {
                        IsError = true,
                        Message = existeSubSede ? "Ya existe una SubSede creada con este nombre para la sede enviada.\"" : validationResult.Errors.First().ErrorMessage
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