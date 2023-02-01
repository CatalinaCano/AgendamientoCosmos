using FxAgendamiento.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxAgendamiento.OpenApi
{
    public class AgendaInputExample : OpenApiExample<AgendaInput>
    {
        public override IOpenApiExample<AgendaInput> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new AgendaInput()
                    {
                        IdUsuario = "0x580DA6946EA0D0C135BE7963B71F090D7B3B0FA32B738DA8742FB161D6641893",
                        IdMalla = "252b13683a3c596bb7281093de4c9f0980c67d009e971d1e393aa99258e0e6de",
                        IdSede = "4bf31286-0a56-4d77-ac91-187c5062ad8b",
                        IdSubSede = "03c62e8d79c103029265b3f5c1293505155da9ae",
                        IdServicio = "0a1dbd2e-a7fb-44f5-8738-a523960186c",
                        FechaAgendamiento = "01/12/2022",
                        HoraAgendamiento = "07:30",
                        Ip = "0.0.0.0"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}