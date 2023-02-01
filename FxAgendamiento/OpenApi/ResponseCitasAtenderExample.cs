using FxAgendamiento.Models;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxAgendamiento.OpenApi
{
    public class ResponseCitasAtenderExample : OpenApiExample<ResponseCitasAtender>
    {
        public override IOpenApiExample<ResponseCitasAtender> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "Respuesta de Citas Atender",
                    new ResponseCitasAtender()
                    {
                        Nombres="Usuario Test",
                        CorreoElectronico="user@test.com",
                        DuracionServicio="25 min",
                        NombreServicio="Servicio Ejemplo",
                        NumeroDocumento="10784562325"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
 
    
}
