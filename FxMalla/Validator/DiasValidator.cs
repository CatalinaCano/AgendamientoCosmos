using FluentValidation;

using FxMalla.Interfaces.RepositoryPattern;

using Microsoft.Extensions.Configuration;

using System;

namespace FxMalla.Validator
{
    public class DiasValidator : AbstractValidator<Tuple<string, string>>
    {
        private readonly IUnitOfWork _unitOfWork;
        public readonly IConfiguration _config;

        public DiasValidator(IUnitOfWork unitOfWork, IConfiguration config)
        {
            #region inyeccionDependencias

            _unitOfWork = unitOfWork;
            _config = config;

            #endregion inyeccionDependencias

            RuleFor(property => property.Item1)
                .NotEmpty()
                .NotNull().WithMessage("La sede no puede ser nula ni vacio")
                .Must(property => VerificarSede(property)).WithMessage("La sede enviada no esta registrada en la BD");

            RuleFor(property => property.Item2)
             .NotEmpty()
             .NotNull().WithMessage("El servicio enviado no puede ser nula ni vacio")
             .Must(property => VerificarServicio(property)).WithMessage("El servicio enviado no esta registrada en la BD");
        }

        private bool VerificarServicio(string property)
        {
            return _unitOfWork.ServicioRepository.ExisteServicio(property).GetAwaiter().GetResult();
        }

        private bool VerificarSede(string property)
        {
            return _unitOfWork.SedeRepository.ExisteSede(property).GetAwaiter().GetResult();
        }
    }
}