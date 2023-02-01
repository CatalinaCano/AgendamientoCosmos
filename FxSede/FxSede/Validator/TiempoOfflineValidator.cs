using FluentValidation;

using FxSede.Models.Input;
using FxSede.Utils;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;

namespace FxSede.Validator
{
    public class TiempoOfflineValidator : AbstractValidator<TiempoOfflineInput>
    {
        public readonly IConfiguration _config;

        public TiempoOfflineValidator(IConfiguration config, List<string> diasSemana, SubSedeInput padre)
        {
            #region inyeccionDependencias

            _config = config;

            #endregion inyeccionDependencias

            RuleFor(property => property.HoraInicio)
                 .NotNull()
                 .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
                 .Matches(_config["RegexExpression:Hora"]).WithMessage("{PropertyName} inválido.");

            RuleFor(property => property.HoraFin)
               .NotNull()
               .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
               .Matches(_config["RegexExpression:Hora"]).WithMessage("{PropertyName} inválido.")
               .Must((property, HoraFin) => HoraMayor(property)).WithMessage("La Hora de Fin del tiempo offline debe ser mayor a la hora de Inicio del tiempo offline")
               .Must((property, HoraFin) => ValidarHoraSede(property, padre)).WithMessage("La Hora Inicio y Fin de los tiempos offline  debe estar dentro del horario de la subsede.");


            RuleForEach(property => property.Dias)
             .NotNull()
             .NotEmpty()
             .Must(d => diasSemana.Contains(d)).WithMessage("El/los días enviados en la sección Tiempos Offline no son válidos.")
             .Must((property, Dias) => CheckforDuplicates(property)).WithMessage("Existen dias repetidos en los dias de los tiempos offline");


        }    

        private static bool CheckforDuplicates(TiempoOfflineInput property)
        {
            return ValidatorHelper.CheckforDuplicates(property.Dias);
        }

        private static bool ValidarHoraSede(TiempoOfflineInput property, SubSedeInput padre)
        {
            return TimeHelper.HoraValida(padre.HoraInicio, padre.HoraFin, property.HoraInicio, property.HoraFin);
        }

        private static bool HoraMayor(TiempoOfflineInput property)
        {
            return TimeHelper.HoraMayor(property);
        }
    }
}