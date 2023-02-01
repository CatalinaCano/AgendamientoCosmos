using FluentValidation;

using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Utils;

using Microsoft.Extensions.Configuration;

using System;

namespace FxMalla.Validator
{
    public class TiemposValidator : AbstractValidator<Tuple<string, string, string>>
    {
        private readonly IUnitOfWork _unitOfWork;
        public readonly IConfiguration _config;

        public TiemposValidator(IUnitOfWork unitOfWork, IConfiguration config)
        {
            #region inyeccionDependencias

            _unitOfWork = unitOfWork;
            _config = config;

            #endregion inyeccionDependencias

            RuleFor(property => property.Item1)
               .NotEmpty()
               .NotNull().WithMessage("El id de la sede no puede ser nulo ni vacio")
               .Must(property => ExisteSede(property)).WithMessage("La Sede enviada no se encuenrta registrada en la BD");

            RuleFor(property => property.Item2)
              .NotEmpty()
              .NotNull().WithMessage("El id del Servicio no puede ser nulo ni vacio")
              .Must(property => ExisteServicio(property)).WithMessage("El Servicio enviado no se encuenrta registrado en la BD");

            RuleFor(property => property.Item3)
              .NotEmpty()
              .NotNull().WithMessage("La Fecha a consultar no puede ser nulo ni vacio")
              .Matches(_config["RegexExpression:Fecha"]).WithMessage("La Fecha a consultar no debe ser una Fecha valida en formato dd/MM/yyyy")
              .Must((property, Fecha) => ValidacionFecha(Fecha)).WithMessage("La Fecha a consultar  no puede ser una Fecha pasada, debe ser mayor al dia de hoy.");
        }

        private bool ExisteServicio(string property)
        {
            return _unitOfWork.ServicioRepository.ExisteServicio(property).GetAwaiter().GetResult();
        }

        private bool ExisteSede(string property)
        {
            return _unitOfWork.SedeRepository.ExisteSede(property).GetAwaiter().GetResult();
        }

        private static bool ValidacionFecha(string fecha)
        {
            return TimeHelper.ValidacionFecha(fecha);
        }
    }
}