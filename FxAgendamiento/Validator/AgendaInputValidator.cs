using FluentValidation;

using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Input;
using FxAgendamiento.Utils;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Extensions;
using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;

namespace FxAgendamiento.Validator
{
    public class AgendaInputValidator : AbstractValidator<AgendaInput>
    {
        public readonly IConfiguration _config;
        private readonly IUnitOfWork _unitOfWork;
        private readonly int cantidadSolicitudesDiarias;

        public AgendaInputValidator(IConfiguration config, IUnitOfWork unitOfWork)
        {
            #region inyeccionDependencias

            _config = config;
            _unitOfWork = unitOfWork;
            cantidadSolicitudesDiarias = _config.GetValue<int>("Validator:CantidadSolicitudesDiarias");

            #endregion inyeccionDependencias

            RuleFor(property => property.IdUsuario)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must((property, IdUsuario) => ValidarUsuario(IdUsuario)).WithMessage("No es posible registrar la cita para el usario enviado, pues no se encuentra habilitado para este proceso")
                .Must((property, IdUsuario) => ValidarCitaActivaUsuario(property)).WithMessage("No es posible agendar esta cita, pues el usuario ya posee una cita Activa para este Servicio.")
                .Must((property, IdUsuario) => ValidarSolicitudesDiarias(property)).WithMessage("No es posible agendar esta cita, pues el usuario ha exedido la cantidad citas para agendar diarias.");


            RuleFor(property => property.IdMalla)
               .NotEmpty()
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
               .Must((property, IdMalla) => VerificarMalla(IdMalla)).WithMessage("La malla enviada no esta registrada en la BD");

            RuleFor(property => property.IdSede)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must(property => VerificarSede(property)).WithMessage("La sede enviada no esta registrada en la BD");

            RuleFor(property => property.IdSubSede)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must((property, IdSubSede) => VerificarSubSede(property)).WithMessage("La Subsede enviada no esta registrada en la BD");


            RuleFor(property => property.IdServicio)
               .NotEmpty()
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
               .Must(property => VerificarServicio(property)).WithMessage("La Subsede enviada no esta registrada en la BD")
                .Must((property, IdServicio) => VerificarServicio(IdServicio)).WithMessage("La Subsede enviada no esta registrada en la BD");


            RuleFor(property => property.FechaAgendamiento)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Fecha"]).WithMessage("{PropertyName} debe ser una fecha valida en formato dd/MM/yyyy")
                .Must((property, FechaAgendamiento) => ValidacionFecha(FechaAgendamiento)).WithMessage("La Fecha del agendamiento no puede ser una fecha pasada, debe ser mayor al dia de hoy.");
               


            RuleFor(property => property.HoraAgendamiento)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Hora"]).WithMessage("{PropertyName} debe ser una fecha hora valida en formato de 24 horas")
                .Must((property, FechaAgendamiento) => ValidacionFechaHabilitada(property)).WithMessage("La fecha y hora enviadas no se encuentrán disponibles para el agendamiento");
    

            RuleFor(property => property.Ip)
               .NotEmpty()
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
               .Matches(_config["RegexExpression:DireccionIP"]).WithMessage("{PropertyName} invalida.");
        }

        private bool ValidacionFechaHabilitada(AgendaInput property)
        {
            List<TiempoDto> tiempos = _unitOfWork.MallaRepository.ValidarEspacio(property.IdMalla, property.IdSede, property.IdSubSede, property.FechaAgendamiento).GetAwaiter().GetResult();

   
            if (tiempos.Any())
            {
                var data = tiempos.Where(t => t.HoraInicio.Equals(property.HoraAgendamiento) &&
                                         t.AgendaDisponible &&
                                         !t.UsuariosVetados.Contains(property.IdUsuario))
                                        .Select(t=> t);
                return !data.IsEmpty();
            }
            else
            {
                return false;
            }

        }

        private bool ValidarUsuario(string idUsuario)
        {
            var data = _unitOfWork.UsuarioRepository.ObtenerUsuario(idUsuario).GetAwaiter().GetResult();
            return data != null;
        }

        private static bool ValidacionFecha(string fecha)
        {

            return TimeHelper.ValidacionFecha(fecha);
        }

        private bool VerificarServicio(string idServicio)
        {
            var data = _unitOfWork.ServicioRepository.ObtenerTiempodeAtencionServicio(idServicio);
            return data != null;
        }

        private bool VerificarSubSede(AgendaInput property)
        {
            return _unitOfWork.SedeRepository.ExisteSubSede(property.IdSede, property.IdSubSede).GetAwaiter().GetResult();
        }

        private bool VerificarMalla(string idMalla)
        {
            return _unitOfWork.MallaRepository.ExistMalla(idMalla).GetAwaiter().GetResult();
        }

        private bool VerificarSede(string property)
        {
            return _unitOfWork.SedeRepository.ExisteSede(property).GetAwaiter().GetResult();
        }
        private bool ValidarSolicitudesDiarias(AgendaInput property)
        {
            SolicitudesDto cantidad = _unitOfWork.TramiteRepository.ValidarCantidadSolicitudes(property.IdUsuario).GetAwaiter().GetResult();

            return (cantidad == null || cantidad.CantidadSolicitudes < cantidadSolicitudesDiarias);
   
        }

        private bool ValidarCitaActivaUsuario(AgendaInput property)
        {
            ValidarTramiteDto data = _unitOfWork.TramiteRepository.ValidarServicioActivo(property.IdUsuario, property.IdServicio).GetAwaiter().GetResult();
            return data == null;

        }
    }
}