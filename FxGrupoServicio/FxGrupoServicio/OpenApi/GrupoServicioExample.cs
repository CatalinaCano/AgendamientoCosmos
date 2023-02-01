using FxGrupoServicio.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxGrupoServicio.OpenApi
{
    public class GrupoServicioExample : OpenApiExample<GrupoServicioInput>
    {
        public override IOpenApiExample<GrupoServicioInput> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new GrupoServicioInput()
                    {
                        NombreGrupoServicio = "Grupo de Servicio 1",
                        Activo = true,
                        Usuario = "Usuario Test"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}