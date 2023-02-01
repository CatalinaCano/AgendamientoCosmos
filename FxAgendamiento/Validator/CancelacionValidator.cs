using FluentValidation;

using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Input;

using Microsoft.Extensions.Configuration;

namespace FxAgendamiento.Validator
{
    public class CancelacionValidator : AbstractValidator<CancelacionInput>
    {
        public readonly IConfiguration _config;
        private readonly IUnitOfWork _unitOfWork;

        public CancelacionValidator(IConfiguration config, IUnitOfWork unitOfWork)
        {
            #region inyeccionDependencias

            _config = config;
            _unitOfWork = unitOfWork;

            #endregion inyeccionDependencias



            RuleFor(property => property.IdUsuario)
               .NotEmpty()
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
               .Must((property, IdUsuario) => ValidarUsuario(IdUsuario)).WithMessage("El usuario enviado  no se encuentra habilitado para este proceso");


            RuleFor(property => property.IdTramite)
             .NotEmpty()
             .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
             .Must((property, IdUsuario) => ValidarTramite(property)).WithMessage("Los datos asocioados al tramite enviando son incorrectos, por tal motivo no es posible cancelarlo.");

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



            RuleFor(property => property.FechaCita)
               .NotEmpty()
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
               .Matches(_config["RegexExpression:Fecha"]).WithMessage("{PropertyName} debe ser una fecha valida en formato dd/MM/yyyy");

        }

        private bool ValidarUsuario(string idUsuario)
        {
            var data = _unitOfWork.UsuarioRepository.ObtenerUsuario(idUsuario).GetAwaiter().GetResult();
            return data != null;
        }

        private bool ValidarTramite(CancelacionInput property)
        {
            CitasDto data = _unitOfWork.TramiteRepository.ObtenerCita(property.IdUsuario, property.IdTramite).GetAwaiter().GetResult();
            
            if (data != null)
                return data.FechaAgendamiento.Equals(property.FechaCita);
            return false;

        }
        

        private bool VerificarSubSede(CancelacionInput property)
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
    }
}