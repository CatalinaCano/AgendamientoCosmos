using FluentValidation;

using FxServicio.Interfaces.RepositoryPattern;
using FxServicio.Models.Entities;
using FxServicio.Models.Input;
using FxServicio.Utils;

using Microsoft.Extensions.Configuration;

using System;

namespace FxServicio.Validator
{
    public class ServicioValidator : AbstractValidator<ServicioInput>
    {
        public readonly IConfiguration _config;
        private readonly int tiempoMaximo;
        private readonly IUnitOfWork _unitOfWork;
        public ServicioValidator(IConfiguration config, IUnitOfWork unitOfWork)
        {
            #region inyeccionDependencias

            _config = config;
            tiempoMaximo = _config.GetValue<int>("Validator:TiempoMaximo");
            _unitOfWork = unitOfWork;

            #endregion inyeccionDependencias

            RuleFor(property => property.IdGrupoServicio)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must((property, IdGrupoServicio) => VerificarBD(IdGrupoServicio)).WithMessage("El grupo de servicio enviado no se encuentra registrado en la base de datos.");


            RuleFor(property => property.NombreServicio)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio");
        

            RuleFor(property => property.TiempoAtencion)              
               .Must(x => x > 0 && x <= tiempoMaximo).WithMessage($"El tiempo del servicio debe ser mayor que 0 y menor que {tiempoMaximo}");

            RuleFor(property => property.NumeroPersonasAtencion)            
              .Must(x => x > 0).WithMessage($"Numero de personas a atender debe ser mayor que 0");


            RuleFor(property => property.TipoPago)
               .NotEmpty()
               .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio");

            RuleFor(property => property.Usuario)
               .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio");
        }

       

        private bool VerificarBD(string idGrupoServicio)
        {
            return _unitOfWork.GrupoServicioRepository.ExistsGrupoServicio(idGrupoServicio).GetAwaiter().GetResult();
        }
    }
}