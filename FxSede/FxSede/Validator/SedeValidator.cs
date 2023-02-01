using FluentValidation;

using FxSede.Models.Input;
using FxSede.Utils;

using Microsoft.Extensions.Configuration;

namespace FxSede.Validator
{
    public class SedeValidator : AbstractValidator<SedeInput>
    {
        public readonly IConfiguration _config;
      

        public SedeValidator(IConfiguration config)
        {
            _config = config;

            RuleFor(property => property.NombreSede)
                .NotNull()
                .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio");

            RuleFor(property => property.Direccion)
                .NotNull()
                .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Direccion"]).WithMessage("{PropertyName} invalida.");

            RuleFor(property => property.Telefono)
                .NotNull()
                .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:NumeroTelefono"]).WithMessage("{PropertyName} invalido.");

            RuleFor(property => property.HoraInicio)
                .NotNull()
                .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Hora"]).WithMessage("{PropertyName} invalido.");

            RuleFor(property => property.HoraFin)
               .NotNull()
               .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
               .Matches(_config["RegexExpression:Hora"]).WithMessage("{PropertyName} invalido.")
               .Must((property, HoraFin) => HoraMayor(property)).WithMessage("La Hora de Fin debe ser mayor a la hora de Inicio");

            RuleFor(property => property.Usuario)
               .NotNull()
               .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio");
        }

        private static bool HoraMayor(SedeInput property)
        {
            
            return TimeHelper.HoraMayor(property);
        }
    }
}