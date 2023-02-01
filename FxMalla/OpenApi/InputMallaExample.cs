using FxMalla.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxMalla.OpenApi
{
    public class InputMallaExample : OpenApiExample<MallaInput>
    {
        public override IOpenApiExample<MallaInput> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new MallaInput()
                    {
                        FechaInicio = "01/01/2022",
                        FechaFin = "31/12/2022",
                        IdSede = "4bf31286-0a56-4d77-ac91-187c5062ad8b",
                        Usuario = "Usuario Test"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}