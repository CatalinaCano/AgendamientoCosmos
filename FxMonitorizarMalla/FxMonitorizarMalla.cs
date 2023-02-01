using FxMonitorizarMalla.Interfaces.RepositoryPattern;
using FxMonitorizarMalla.Models.DataTransferObjects;
using FxMonitorizarMalla.Utils;

using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FxMonitorizarMalla
{
    public class FxMonitorizarMalla
    {
        public readonly IConfiguration _configuration;

        private readonly IUnitOfWork _unitOfWork;

        public FxMonitorizarMalla(IUnitOfWork unitOfWork, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _configuration = configuration;
        }

        [FunctionName(nameof(MonitorizarMalla))]
        [FixedDelayRetry(3, "00:00:05")]
        public async Task MonitorizarMalla([TimerTrigger("%Horario%", RunOnStartup = true)] TimerInfo myTimer, ILogger log)
        {
            log.LogInformation($"Inicia la validacion de las Mallas: {TimeHelper.ObtenerFechaColombia()}");

            List<MallaDto> mallas = await _unitOfWork.MallaRepository.ObtenerMallas();

            if (mallas.Any())
            {
                foreach (MallaDto malla in mallas)
                {
                    await _unitOfWork.MallaRepository.InactivarMalla(malla.Id, malla.PkSede);
                }
            }
        }
    }
}