using FxMonitorizaCitas.Interfaces.RepositoryPattern;
using FxMonitorizaCitas.Models.DataTransferObjects;
using FxMonitorizaCitas.Utils;

using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FxMonitorizaCitas
{
    public class FxMonitorizaCitas
    {
        public readonly IConfiguration _configuration;

        private readonly IUnitOfWork _unitOfWork;

        public FxMonitorizaCitas(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        [FunctionName(nameof(MonitorizarCitas))]
        [FixedDelayRetry(3, "00:00:05")]
        public async Task MonitorizarCitas([TimerTrigger("%Horario%", RunOnStartup = true)] TimerInfo myTimer, ILogger log)
        {
            log.LogInformation($"Inicia la validacion de las citas: {TimeHelper.ObtenerFechaColombia()}");

            List<TramitesDiaDto> citas = await _unitOfWork.TramiteRepository.ObtenerCitasDia();

            if (citas.Any())
            {
                var citasFiltradas = citas.Where(c => TimeHelper.ObtenerFechaConHora(c.FechaAgendamiento, c.HoraAgendamiento) <= TimeHelper.ObtenerFechaColombia())
                                          .Select(c => new { c.IdCita, c.IdUsuario });
                if (citasFiltradas.Any())
                {
                    foreach (var cita in citasFiltradas)
                    {
                        await _unitOfWork.TramiteRepository.InactivarCita(cita.IdUsuario, cita.IdCita);
                        await _unitOfWork.TramiteRepository.AgregarEstado(cita.IdUsuario, cita.IdCita, new() { NombreEstado = _configuration["Estados:NoAsistio"] });
                    }
                }
            }
        }
    }
}