using FxCodigoQR.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxCodigoQR.OpenApi
{
    public class DataInputExample : OpenApiExample<DataInput>
    {
        public override IOpenApiExample<DataInput> Build(NamingStrategy namingStrategy = null)
        {
            this.Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "Ejemplo de Request",
                    new DataInput()
                    {
                        IdUsuario = "0x20A37C93D89C3AC7C3CCF4DDE3A0CF778EF8F7F36310835E2D1FC297EAF9EB3D",
                        IdTramite = "0x271B4958AE2D485AB812A8CD01DA33B052D8D78AB61357DB13E43878DB26A8D7",
                        Data = "https://stwebtransversaldtdev.z20.web.core.windows.net/ciudadano/citas/0x653AAF9A5E80F8DBFF19F0692442E427015C993025701F8207811DB5915B161A"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}