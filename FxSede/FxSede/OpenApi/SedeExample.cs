using FxSede.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxSede.OpenApi
{
    public class SedeExample : OpenApiExample<SedeInput>
    {
        public override IOpenApiExample<SedeInput> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new SedeInput()
                    {
                        NombreSede = "Nogal",
                        Direccion = "Calle 1 # 11 - 111",
                        Telefono = "3003003003",
                        HoraInicio = "06:00",
                        HoraFin = "22:00",
                        InactivarFestivos = true,
                        Activo = true,
                        Usuario = "Usuario Test"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}