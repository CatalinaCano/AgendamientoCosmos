using FxCodigoQR.Interfaces.RepositoryPattern;
using FxCodigoQR.Models;
using FxCodigoQR.Models.DataTransferObjects;
using FxCodigoQR.Models.Entities;
using FxCodigoQR.Utils;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Configuration;
using Microsoft.OpenApi.Models;

using System;
using System.Net;
using System.Threading.Tasks;

namespace FxCodigoQR
{
    public class FxActivarCodigo
    {
        public readonly IConfiguration _configuration;

        private readonly IUnitOfWork _unitOfWork;

        public FxActivarCodigo(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        [FunctionName(nameof(ActivarCodigoQR))]
        [FixedDelayRetry(3, "00:00:05")]
        [OpenApiOperation(operationId: "ActivarCodigoQR", tags: new[] { "Activar Código QR" }, Description = "End point para activar un código QR.", Summary = "End point para activar un código QR.")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(QRDto), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")]
        public async Task<IActionResult> ActivarCodigoQR(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "V1.0/CodigoQR/Activar/{id}")] HttpRequest req, string id)
        {
            try
            {
                CodigoQRDto data = await _unitOfWork.CodigoQRRepository.ObtenerTramite(id);

                if (data != null)
                {
                    DateTime fechaActivacion = new(data.TiempoActivacion);
                    DateTime fechaCaducidad = new(data.TiempoCaducidad);
                    DateTime hoy = TimeHelper.ObtenerFechaHoy();
                    string nombreEstado = _configuration["Estados:EnEspera"];
                    EstadoDto resultEstado = await _unitOfWork.TramiteRepository.ValidarEstado(data.IdUsuario, data.IdTramite, nombreEstado);

                    if (hoy >= fechaActivacion && hoy <= fechaCaducidad && !resultEstado.estado)
                    {
                        Estado estado = new Estado()
                        {
                            NombreEstado = nombreEstado,
                            FechaEstado = DateTime.UtcNow
                        };
                        string result = await _unitOfWork.TramiteRepository.AgregarEstado(data.IdUsuario, data.IdTramite, estado);
                        return result.Equals("OK") ? HttpResponseHelper.Response(StatusCodes.Status201Created,
                                                                        new ResponseResult()
                                                                        {
                                                                            IsError = false,
                                                                            Message = "Estado agregado exitosamente"
                                                                        }) : HttpResponseHelper.Response(StatusCodes.Status409Conflict,
                                                                        new ResponseResult()
                                                                        {
                                                                            IsError = true,
                                                                            Message = "No es posible registrar la información enviada"
                                                                        });
                    }
                    else
                    {
                        return HttpResponseHelper.Response(StatusCodes.Status409Conflict,
                                                          new ResponseResult()
                                                          {
                                                              IsError = true,
                                                              Message = "No es posible activar el código enviado, pues el periodo de activación es inválido"
                                                          });
                    }
                }
                else
                {
                    return HttpResponseHelper.Response(StatusCodes.Status404NotFound,
                                                        new ResponseResult()
                                                        {
                                                            IsError = true,
                                                            Message = "No es posible activar el código enviado, pues este no registra en la BD."
                                                        });
                }
            }
            catch (Exception ex)
            {
                return HttpResponseHelper.Response(StatusCodes.Status500InternalServerError,
                                                    new ResponseResult()
                                                    {
                                                        IsError = true,
                                                        Message = ex.Message
                                                    });
            }
        }
    }
}