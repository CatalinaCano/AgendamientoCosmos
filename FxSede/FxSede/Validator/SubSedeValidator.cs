using FluentValidation;

using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models.DataTransferObjects;
using FxSede.Models.Input;
using FxSede.Utils;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;

namespace FxSede.Validator
{
    public class SubSedeValidator : AbstractValidator<SubSedeInput>
    {
        public readonly IConfiguration _config;
        private readonly int tiempoMaximo;
        private readonly IUnitOfWork _unitOfWork;

        public SubSedeValidator(IConfiguration config, IUnitOfWork unitOfWork, string idSede)
        {
            _config = config;
            tiempoMaximo = _config.GetValue<int>("Validator:TiempoMaximo");
            _unitOfWork = unitOfWork;

            List<string> diasSemana = new() { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" };

            RuleFor(property => property.idSede)                
                .NotNull()
                .NotEmpty().WithMessage("{PropertyName}no puede ser vacio")
                .Must((property, idSede) => ValidarSede(property)).WithMessage("La sede a la cual se le quiere agregar una subsede no existe registrada en la base de datos");

            RuleFor(property => property.NombreSubSede)
                .NotNull()
                .NotEmpty().WithMessage("{PropertyName}no puede ser vacio");
                

            RuleFor(property => property.HoraInicio)
                 .NotNull()
                 .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
                 .Matches(_config["RegexExpression:Hora"]).WithMessage("{PropertyName} invalido.");

            RuleFor(property => property.HoraFin)
               .NotNull()
               .NotEmpty().WithMessage("{PropertyName}no puede ser nulo ni vacio")
               .Matches(_config["RegexExpression:Hora"]).WithMessage("{PropertyName} invalido.")
               .Must((property, HoraFin) => HoraMayor(property)).WithMessage("La Hora de Fin de la subsede debe ser mayor a la hora de Inicio de la subsede")
               .Must((property, HoraFin) => ValidarHoraSede(property)).WithMessage("La Hora Inicio y Fin de la subsede debe estar dentro del horario de la sede.");

            RuleFor(property => property.IntervaloAtencion)
              .Must(x => x > 0 && x <= tiempoMaximo).WithMessage($"El Intervalo del servicio debe ser mayor que 0 y menor que {tiempoMaximo}");

            RuleFor(property => property.NumeroPersonasAtencion)
              .Must(x => x > 0).WithMessage($"Número de personas a atender debe ser mayor que 0");

            RuleForEach(property => property.DiasOffline)
             .Must((property,d) => property.DiasOffline.Length > 0 && property.DiasOffline.Length <= 7).WithMessage("Recuerde que deben venir minimo un dia maximo 7")
             .Must(d => diasSemana.Contains(d)).When(x => x.DiasOffline?.Length > 0).WithMessage("El o uno de los días enviados en Dias Offline es inválido")
             .Must((property, Dias) => CheckforDuplicates(property)).WithMessage("Existen dias repetidos en los dias offline");


            RuleFor(property => property.TiemposOffline)           
                .Must((TiemposOffline) => TiemposOffline?.Count>0).When(property => property.TiemposOffline?.Count > 0)
                .WithMessage("Especifique los tiempos offline.")
                .DependentRules(() =>
                {
                    RuleForEach(property => property.TiemposOffline).SetValidator(property => new TiempoOfflineValidator(_config, diasSemana, property));
                }).When(property => property.TiemposOffline?.Count > 0);

            RuleFor(property => property.Servicios)
                .Must(x => x.Any()).WithMessage("Se debe asociar por lo menos un servico a la subsede")
                .DependentRules(() =>
                {
                    RuleForEach(property => property.Servicios).SetValidator(property => new ServicioValidator(_unitOfWork, property));
                    
                });

        }

        private static bool CheckforDuplicates(SubSedeInput property)
        {
            return ValidatorHelper.CheckforDuplicates(property.DiasOffline);
        }

        private  bool ValidarSede(SubSedeInput property)
        {
            var data = _unitOfWork.SedeRepository.GetSedeByID(property.idSede).GetAwaiter().GetResult();
            if (data == null)
                return false;
            return true;
        }


        private static bool HoraMayor(SubSedeInput property)
        {
            return TimeHelper.HoraMayor(property);
        }

        private bool ValidarHoraSede(SubSedeInput property)
        {
            SedeDto data = _unitOfWork.SedeRepository.GetSedeByID(property.idSede).GetAwaiter().GetResult();
            if (data != null)
                return TimeHelper.HoraValida(data.horaInicio, data.horaFin, property.HoraInicio, property.HoraFin);
            return false;
        }
    }
}