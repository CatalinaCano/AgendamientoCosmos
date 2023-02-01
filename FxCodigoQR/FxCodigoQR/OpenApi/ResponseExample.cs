using FxCodigoQR.Models.DataTransferObjects;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxCodigoQR.OpenApi
{
    public class ResponseExample : OpenApiExample<QRDto>
    {
        public override IOpenApiExample<QRDto> Build(NamingStrategy namingStrategy = null)
        {
            this.Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new QRDto()
                    {
                        qrbase64 = "http//holamunco.com"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}