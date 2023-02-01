using FluentValidation;

using FxGrupoTramite.Models.Input;

using Microsoft.Extensions.Configuration;

namespace FxGrupoTramite.Validator
{
    public class GrupoTramiteValidator : AbstractValidator<GrupoTramiteInput>
    {
        public readonly IConfiguration _configuration;

        public GrupoTramiteValidator()
        {
            RuleFor(property => property.NombreGrupoTramite)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio");

            RuleFor(property => property.Usuario)
               .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio");
        }
    }
}