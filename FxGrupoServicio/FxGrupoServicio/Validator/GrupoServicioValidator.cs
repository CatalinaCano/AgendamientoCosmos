using FluentValidation;

using FxGrupoServicio.Interfaces.RepositoryPattern;
using FxGrupoServicio.Models.Input;

using Microsoft.Extensions.Configuration;

namespace FxGrupoServicio.Validator
{
    public class GrupoServicioValidator : AbstractValidator<GrupoServicioInput>
    {
        public readonly IConfiguration _configuration;

        private readonly IUnitOfWork _unitOfWork;
        public GrupoServicioValidator(IUnitOfWork unitOfWork)
        {
            _unitOfWork= unitOfWork;

            RuleFor(property => property.IdGrupoTramite)
             .NotEmpty()
             .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
             .Must((property, IdGrupoTramite) => ValidarGrupoTramite(IdGrupoTramite)).WithMessage("El grupo de tramite enviado no esta registrado en la base de datos");

            RuleFor(property => property.NombreGrupoServicio)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio");

            RuleFor(property => property.Usuario)
               .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio");
        }

        private bool ValidarGrupoTramite(string idGrupoTramite)
        {
            return _unitOfWork.GrupoTramiteRepository.ExistsGrupoTramiteAsync(idGrupoTramite).GetAwaiter().GetResult();
        }
    }
}