using FluentValidation;

using FxAgendamiento.Interfaces.RepositoryPattern;

using Microsoft.Extensions.Configuration;

using System;

namespace FxAgendamiento.Validator
{
    public class ListarTramitesValidator: AbstractValidator<Tuple<string,string>>
    {
        public readonly IConfiguration _configuration;
        private readonly IUnitOfWork _unitOfWork;


        public ListarTramitesValidator(IConfiguration configuration, IUnitOfWork unitOfWork)
        {
            #region inyeccionDependencias
            _unitOfWork = unitOfWork;
            _configuration = configuration;
            #endregion inyeccionDependencias

            RuleFor(property => property.Item1)
               .NotEmpty()
               .NotNull().WithMessage("El id de la sede no puede ser nulo ni vacio")
               .Must(property => VerificarSede(property)).WithMessage("La sede enviada no esta registrada en la BD");

            RuleFor(property => property.Item2)
                .NotEmpty()
                .NotNull().WithMessage("El ide de la subsede no puede ser nulo ni vacio")
                .Must((property, IdSubSede) => VerificarSubSede(property)).WithMessage("La Subsede enviada no esta registrada en la BD");

        }

        private bool VerificarSubSede(Tuple<string,string> property)
        {
            return _unitOfWork.SedeRepository.ExisteSubSede(property.Item1, property.Item2).GetAwaiter().GetResult();
        }

        private bool VerificarSede(string property)
        {
            return _unitOfWork.SedeRepository.ExisteSede(property).GetAwaiter().GetResult();
        }
    }
}
