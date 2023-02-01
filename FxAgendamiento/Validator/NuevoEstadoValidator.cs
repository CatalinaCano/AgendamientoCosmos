using FluentValidation;

using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.Input;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;

namespace FxAgendamiento.Validator
{
    public class NuevoEstadoValidator : AbstractValidator<NuevoEstadoInput>
    {
        public readonly IConfiguration _config;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IList<string> estados;

        public NuevoEstadoValidator(IConfiguration config, IUnitOfWork unitOfWork)
        {
            #region inyeccionDependencias

            _config = config;
            _unitOfWork = unitOfWork;
            estados = _config.GetSection("Estados").Get<List<string>>();

            #endregion inyeccionDependencias

            RuleFor(property => property.IdUsuario)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must((property, IdUsuario) => ValidarUsuario(IdUsuario)).WithMessage("El usuario enviado  no se encuentra habilitado para este proceso");


            RuleFor(property => property.Estado)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must(e => estados.Contains(e)).WithMessage("El estado enviado no se encuentra dentro del listado de estados permitidos");


            RuleFor(property => property.IdTramite)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must((property, IdUsuario) => ValidarTramite(property)).WithMessage("No es posible agregar estados duplicados al mismo tramite.");

            RuleFor(property => property.IdCampania)
               .NotEmpty().When(p => p.Estado.Equals(_config["Estados:Notificacion"]))
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio").When(p => p.Estado.Equals(_config["Estados:Notificacion"]));

            RuleFor(property => property.QRCode)
               .NotEmpty().WithMessage("{PropertyName} no puede ser nulo ni vacio").When(p => p.Estado.Equals(_config["Estados:Notificacion"]))
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio").When(p => p.Estado.Equals(_config["Estados:Notificacion"]));
        }

        private bool ValidarUsuario(string idUsuario)
        {
            var data = _unitOfWork.UsuarioRepository.ObtenerUsuario(idUsuario).GetAwaiter().GetResult();
            return data != null;
        }

        private bool ValidarTramite(NuevoEstadoInput property)
        {
            var data = _unitOfWork.TramiteRepository.ValidarEstado(property.IdUsuario, property.IdTramite,property.Estado).GetAwaiter().GetResult();
            if (data == null)
                return false;
            return !data.estado;
        }
    }
}