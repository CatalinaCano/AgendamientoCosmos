using FxAgendamientoMasivo.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxAgendamientoMasivo.OpenApi
{
    public class RequestExample : OpenApiExample<Request>
    {
        public override IOpenApiExample<Request> Build(NamingStrategy namingStrategy = null)
        {
            this.Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new Request()
                    {
                        File = "sdsadsa"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}