using AutoMapper;

using FluentValidation;

using FxCodigoQR.Interfaces;
using FxCodigoQR.Interfaces.RepositoryPattern;
using FxCodigoQR.Models;
using FxCodigoQR.Models.DataTransferObjects;
using FxCodigoQR.Models.Entities;
using FxCodigoQR.Models.Input;
using FxCodigoQR.Utils;

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

namespace FxCodigoQR
{
    public class FxCodigoQR
    {
        public readonly IConfiguration _configuration;

        private readonly IGeneraQR _generaQR;
        private readonly IValidator<DataInput> _validator;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public FxCodigoQR(IGeneraQR generaQR, IValidator<DataInput> validator, IMapper mapper, IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _generaQR = generaQR;
            _validator = validator;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        [FunctionName(nameof(GeneraCodigoQR))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "GeneraCodigoQR", tags: new[] { "Generación Código QR" }, Description = "End point para generar codigos QR", Summary = "End point para generar codigos QR")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(DataInput), Required = true, Description = "Ejemplo de Request")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(QRDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> GeneraCodigoQR(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "V1.0/CodigoQR")] HttpRequest req)
        {
            try
            {
                var json = await req.ReadAsStringAsync();
                DataInput request = JsonConvert.DeserializeObject<DataInput>(json);

                var validationResult = _validator.Validate(request);
                if (validationResult.IsValid)
                {
                    CitasDto cita = await _unitOfWork.TramiteRepository.ObtenerCita(request.IdUsuario, request.IdTramite);
                    CodigoQR data = _mapper.Map<CodigoQR>(request);
                    data.TiempoActivacion = ObtenerTiempoActivacion(cita);
                    data.TiempoCaducidad = ObtenerTiempoCaducidad(cita);

                    string result = await _unitOfWork.CodigoQRRepository.InsertarSolictud(data);

                    if (result.Equals("OK"))
                    {
                        QRDto dataResult = new()
                        {
                            qrbase64 = _generaQR.construyeQR(request.Data)
                        };
                        return HttpResponseHelper.SuccessfulObjectResult(dataResult);
                    }
                    else
                    {
                        return HttpResponseHelper.Response(StatusCodes.Status409Conflict, new ResponseResult()
                        {
                            IsError = true,
                            Message = "Se ha presentado un error al momento de crear el Código QR"
                        });
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

        private long ObtenerTiempoActivacion(CitasDto cita)
        {
            int tiempoVigencia = _configuration.GetValue<int>("Activacion:TiempoVigencia");
            DateTime horaActivacion = TimeHelper.ConevrtirHora(cita.HoraAgendamiento).AddMinutes(-tiempoVigencia);
            return TimeHelper.ObtenerFechaConHora(cita.FechaAgendamiento, horaActivacion.Hour, horaActivacion.Minute).Ticks;
        }

        private long ObtenerTiempoCaducidad(CitasDto cita)
        {
            int tiempoVigencia = _configuration.GetValue<int>("Activacion:TiempoVigencia");
            int total = Convert.ToInt32(cita.DuracionServicio + tiempoVigencia);
            DateTime horaExpiracion = TimeHelper.ConevrtirHora(cita.HoraAgendamiento).AddMinutes(total);
            return TimeHelper.ObtenerFechaConHora(cita.FechaAgendamiento, horaExpiracion.Hour, horaExpiracion.Minute).Ticks;
        }
    }
}