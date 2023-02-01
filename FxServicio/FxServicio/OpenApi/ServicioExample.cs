using FxServicio.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxServicio.OpenApi
{
    public class ServicioExample : OpenApiExample<ServicioInput>
    {
        public override IOpenApiExample<ServicioInput> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new ServicioInput()
                    {
                        IdGrupoServicio = "3a4cb34160c6a21b6fd984db8736b5cb22f890cc6ed99fed4cb2db2711b0c71a",
                        NombreServicio = "Servicio 1",
                        TiempoAtencion = 40,
                        NumeroPersonasAtencion = 1,
                        TramiteVirtual = true,
                        TipoPago = "Ventanilla",
                        Activo = true,
                        Usuario = "Usuario Test"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}