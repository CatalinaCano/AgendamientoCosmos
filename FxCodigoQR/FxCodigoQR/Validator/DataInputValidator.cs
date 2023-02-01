using FluentValidation;

using FxCodigoQR.Interfaces.RepositoryPattern;
using FxCodigoQR.Models.DataTransferObjects;
using FxCodigoQR.Models.Input;

namespace FxCodigoQR.Validator
{
    public class DataInputValidator : AbstractValidator<DataInput>
    {
        private readonly IUnitOfWork _unitOfWork;

        public DataInputValidator(IUnitOfWork unitOfWork)
        {
            #region inyeccionDependencias

            _unitOfWork = unitOfWork;

            #endregion inyeccionDependencias

            RuleFor(data => data.IdTramite)
           .NotEmpty()
           .NotNull().WithMessage("La {PropertyName}  no puede ser nula ni vacio")
           .Must((data, IdTramite) => VerificarCita(data)).WithMessage("La cita  enviada no esta registrada en la BD");

            RuleFor(data => data.IdUsuario)
            .NotEmpty()
            .NotNull().WithMessage("La {PropertyName} no puede ser nula ni vacio");

            RuleFor(data => data.Data)
            .NotEmpty()
            .NotNull().WithMessage("La {PropertyName} no puede ser nula ni vacio");
        }

        private bool VerificarCita(DataInput data)
        {
            CitasDto cita = _unitOfWork.TramiteRepository.ObtenerCita(data.IdUsuario, data.IdTramite).GetAwaiter().GetResult();
            return cita != null;
        }
    }
}