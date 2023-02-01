using FxGrupoTramite.Models.Input;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxGrupoTramite.OpenApi
{
    public class GrupoTramiteExample : OpenApiExample<GrupoTramiteInput>
    {
        public override IOpenApiExample<GrupoTramiteInput> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new GrupoTramiteInput()
                    {
                        NombreGrupoTramite = "Grupo de Tramite 1",
                        DescripcionGrupoTramite = "Descripción Grupo Tramite 1",
                        Icono="/icono",
                        Activo = true,
                        Usuario = "Usuario Test"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}