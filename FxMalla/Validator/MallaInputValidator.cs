using FluentValidation;

using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Input;
using FxMalla.Utils;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;

namespace FxMalla.Validator
{
    public class MallaInputValidator : AbstractValidator<MallaInput>
    {
        private readonly IUnitOfWork _unitOfWork;
        public readonly IConfiguration _config;

        public MallaInputValidator(IUnitOfWork unitOfWork, IConfiguration config)
        {
            #region inyeccionDependencias

            _unitOfWork = unitOfWork;
            _config = config;

            #endregion inyeccionDependencias

            RuleFor(property => property.FechaInicio)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Fecha"]).WithMessage("{PropertyName} debe ser una Fecha valida en formato dd/MM/yyyy")
                .Must((property, FechaInicio) => ValidacionFecha(FechaInicio)).WithMessage("La {PropertyName} no puede ser una Fecha pasada, debe ser mayor al dia de hoy.");

            RuleFor(property => property.FechaFin)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Matches(_config["RegexExpression:Fecha"]).WithMessage("{PropertyName} debe ser una Fecha valida en formato dd/MM/yyyy")
                .Must((property, FechaFin) => ValidacionFecha(FechaFin)).WithMessage("La {PropertyName} no puede ser una Fecha pasada, debe ser mayor al dia de hoy.")
                .Must((property, FechaFin) => VerificarBD(property)).WithMessage("No es posible registrar la información enviada, ya existe una malla activa que contiene este periodo de tiempo.")
                .Must((property, FechaFin) => FechaMayor(property)).WithMessage("La Fecha fin debe ser mayor a la Fecha de inicio");

            RuleFor(property => property.IdSede)
                .NotEmpty()
                .NotNull().WithMessage("{PropertyName} no puede ser nulo ni vacio")
                .Must((property, IdSede) => VerificarSede(property)).WithMessage("No es posible registrar la información enviada, ya que la sede enviada no esta registrada en la BD")
                .Must((property, IdSede) => VerificarSubSede(property)).WithMessage("No es posible generar la malla pues la sede no tiene subsedes asociadas");
        }

        private bool VerificarSubSede(MallaInput property)
        {
            return _unitOfWork.SedeRepository.PoseeSubSedes(property.IdSede).GetAwaiter().GetResult();
        }

        private bool VerificarSede(MallaInput property)
        {
            return _unitOfWork.SedeRepository.ExisteSede(property.IdSede).GetAwaiter().GetResult();
        }

        private static bool ValidacionFecha(string fecha)
        {
            return TimeHelper.ValidacionFecha(fecha);
        }

        private static bool FechaMayor(MallaInput property)
        {
            if (TimeHelper.ConvertirFecha(property.FechaInicio) <= TimeHelper.ConvertirFecha(property.FechaFin))
                return true;
            return false;
        }

        private bool VerificarBD(MallaInput property)
        {
            List<bool> result = new() { };
            List<MallaDto> data = _unitOfWork.MallaRepository.ValidarMalla(property.IdSede).GetAwaiter().GetResult();
            DateTime inputInicio = TimeHelper.ConvertirFecha(property.FechaInicio);
            DateTime inputFin = TimeHelper.ConvertirFecha(property.FechaFin);
            if (data != null)
            {
                foreach (var fecha in data)
                {
                    DateTime fechIni = TimeHelper.ConvertirFecha(fecha.FechaInicio);
                    DateTime fechFin = TimeHelper.ConvertirFecha(fecha.FechaFin);
                    result.Add(inputInicio >= fechIni && inputInicio <= fechFin || inputFin >= fechIni && inputFin <= fechFin);
                }

                return !result.Contains(true);
            }
            else
            {
                return true;
            }
        }
    }
}