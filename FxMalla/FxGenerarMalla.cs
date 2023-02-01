using AutoMapper;

using FluentValidation;

using FxMalla.Interfaces;
using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models;
using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Entities;
using FxMalla.Models.Input;
using FxMalla.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Extensions;
using Microsoft.OpenApi.Models;

using Newtonsoft.Json;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxMalla
{
    public class FxGenerarMalla

    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IValidator<MallaInput> _validator;
        private readonly IMapper _mapper;
        private readonly IHttpService _httpService;

        private const string FORMATO_FECHA = "dd/MM/yyyy";
        private const string FORMATO_HORA = "HH:mm";

        public FxGenerarMalla(IUnitOfWork unitOfWork, IValidator<MallaInput> validator, IMapper mapper, IHttpService httpService)
        {
            _unitOfWork = unitOfWork;
            _validator = validator;
            _mapper = mapper;
            _httpService = httpService;
        }

        [FunctionName(nameof(CrearMalla))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "CrearMalla", tags: new[] { "Crear Malla" }, Description = "End point para generar una malla en cosmos db", Summary = "End point para generar una malla en cosmos db")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(MallaInput), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Conflict, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Conflicto")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> CrearMalla(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/Malla")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                MallaInput request = JsonConvert.DeserializeObject<MallaInput>(json);

                var validationResult = _validator.Validate(request);
                if (validationResult.IsValid)
                {
                    Malla malla = _mapper.Map<Malla>(request);
                    malla.MallasPorSubSede = new List<MallasPorSubSede>() { };
                    List<SedeDto> subsedes = await _unitOfWork.SedeRepository.ObtenerSubsedes($"'{malla.PkSede}'");
                    List<string> festivos = ObtenerFestivos(request.FechaInicio, request.FechaFin);

                    foreach (SedeDto subsede in subsedes)
                    {
                        var agendaMalla = GenerarMallaSubsede(malla, subsede, festivos);
                        malla.MallasPorSubSede.Add(
                            new()
                            {
                                PkSubSede = subsede.IdSubSede,
                                TiemposAtencion = agendaMalla
                            }
                        );
                    }

                    string result = await _unitOfWork.MallaRepository.InsertarMallaAsync(malla);

                    if (result.Equals("Registro Exitoso"))
                    {
                        await _unitOfWork.MallaRepository.InactivarMallas(malla.PkSede, malla.Id, request.Usuario);

                        return HttpResponseHelper.Response(StatusCodes.Status201Created, new ResponseResult() { IsError = false, Message = $"La Malla ha sido creada exitosamente desde el {request.FechaInicio} hasta el {request.FechaFin}." });
                    }
                    else
                    {
                        return HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult() { IsError = true, Message = "No es posible registrar la información enviada." });
                    }
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

        private List<Agenda> GenerarMallaSubsede(Malla malla, SedeDto subsede, List<string> festivos)
        {
            AgendaInput input = _mapper.Map<AgendaInput>(subsede);
            input.FechaInicio = TimeHelper.ConvertirFecha(malla.FechaInicio);
            input.FechaFin = TimeHelper.ConvertirFecha(malla.FechaFin);
            input.InactivaFestivos = subsede.InactivarFestivos;
            var resultado = TimeHelper.CalcularAgenda(input, festivos, FORMATO_FECHA, FORMATO_HORA);

            return resultado;
        }

        private List<string> ObtenerFestivos(string fechaInicio, string fechaFin)
        {
            List<string> fechasFestivos = new() { };
            var result = _httpService.GetAsync(fechaInicio, fechaFin).GetAwaiter().GetResult();
            var festivosResult = result.Content.ReadAsStringAsync().GetAwaiter().GetResult();

            if (!festivosResult.IsNullOrWhiteSpace() && result.IsSuccessStatusCode)
            {
                List<Festivo> objFestivos = JsonConvert.DeserializeObject<List<Festivo>>(festivosResult);
                foreach (Festivo festivo in objFestivos)
                {
                    fechasFestivos.Add(festivo.Fecha);
                }
            }

            return fechasFestivos;
        }
    }
}