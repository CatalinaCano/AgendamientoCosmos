using FluentValidation;

using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models.Input;
using FxSede.Utils;

using System.Linq;

namespace FxSede.Validator
{
    public class ServicioValidator : AbstractValidator<ServicioInput>
    {
        private readonly IUnitOfWork _unitOfWork;

        public ServicioValidator(IUnitOfWork unitOfWork, SubSedeInput padre)
        {
            _unitOfWork = unitOfWork;

            RuleFor(property => property.IdServicio)
               .NotNull()
               .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
               .Must((property, IdServicio) => ValidarServicio(property)).WithMessage("El servicio Enviado no esta registrado en la Base de datos")
               .Must((property, IdServicio) => CheckforDuplicates(padre,"idServicio")).WithMessage("Existen servicios duplicados");
         
            RuleFor(property => property.Prioridad).InclusiveBetween(0, padre.Servicios.Count)
              .WithMessage("La prioridad debe estar entre 0 y la cantidad de servicios enviados")
              .Must((property, Prioridad) => CheckforDuplicates(padre,"prioridad")).WithMessage("Existen prioridades duplicados");
        }

        private static bool CheckforDuplicates(SubSedeInput padre, string tipo)
        {
            var filterList = tipo.Equals("idServicio") ? padre.Servicios.Select(x => x.IdServicio) : padre.Servicios.Select(x => x.Prioridad.ToString());
            return ValidatorHelper.CheckforDuplicates(filterList.ToArray());
        }

        private bool ValidarServicio(ServicioInput property)
        {
            return _unitOfWork.ServicioRepository.GetServicioByIdAsync(property.IdServicio).GetAwaiter().GetResult();

        }
    }
}