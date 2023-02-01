using FxSede.Models.DataTransferObjects;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxSede.OpenApi
{
    public class ResponseSede : OpenApiExample<SedeDto>
    {
        public override IOpenApiExample<SedeDto> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "Respuesta Sede Ejemplo",
                    new SedeDto()
                    {
                        idSede = "0xC67DCBCF16335D167503670C69ABE831E2DDC52959EB11C2D3883DBFF3DA322E",
                        nombre = "Sede las Americas",
                        direccion = "Calle 26 Sur #78 H 30",
                        telefono = "1122323",
                        horaInicio = "08:00",
                        horaFin = "20:00",
                        inactivarFestivos = true
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}