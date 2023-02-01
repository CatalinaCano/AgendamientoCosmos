using FluentValidation;

using FxMalla.Models.Input;
using FxMalla.Utils;

using Microsoft.Extensions.Configuration;

namespace FxMalla.Validator
{
    public class FechaInputValidator : AbstractValidator<FechaInput>
    {
        public readonly IConfiguration _config;
        public FechaInputValidator(IConfiguration config)
        {
            _config = config;

            RuleFor(property => property.FechaInicio)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Fecha"]).WithMessage("{PropertyName} debe ser una Fecha valida en formato dd/MM/yyyy")
                .Must((property, FechaInicio) => ValidacionFecha(FechaInicio)).WithMessage("La {PropertyName} no puede ser una Fecha pasada, debe ser mayor al dia de hoy.");

            RuleFor(property => property.FechaFin)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Fecha"]).WithMessage("{PropertyName} debe ser una Fecha valida en formato dd/MM/yyyy")
                .Must((property, FechaFin) => ValidacionFecha(FechaFin)).WithMessage("La {PropertyName} no puede ser una Fecha pasada, debe ser mayor al dia de hoy.")
                
                .Must((property, FechaFin) => FechaMayor(property)).WithMessage("La Fecha fin debe ser mayor a la Fecha de inicio");

        }

        private static bool ValidacionFecha(string fecha)
        {
            return TimeHelper.ValidacionFecha(fecha);
        }
        private static bool FechaMayor(FechaInput property)
        {
            if (TimeHelper.ConvertirFecha(property.FechaInicio) <= TimeHelper.ConvertirFecha(property.FechaFin))
                return true;
            return false;
        }
    }
}
