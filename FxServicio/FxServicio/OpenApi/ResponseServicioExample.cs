using FxServicio.Models.DataTransferObjects;
using FxServicio.Models.Input;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

namespace FxServicio.OpenApi
{
    public class ResponseServicioExample : OpenApiExample<ServicioDto>
    {
        public override IOpenApiExample<ServicioDto> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ResponseExample",
                    new ServicioDto()
                    {
                        idServicio = "3a4cb34160c6a21b6fd984db8736b5cb22f890cc6ed99fed4cb2db2711b0c71a",
                        idGrupoServicio = "0xDF28091DF972ABDC3C0CE41D5F3E72272DBCA2D57B0462EB949173F791D6BD2D",
                        nombreServicio = "Nombre Servicio",
                        descripcionServicio="Descripcion del servicio",
                        tiempo = 40,
                        numeroPersonas = 1,
                        tramiteVirtual =true,                        
                        tramitePresencial = true,
                        tipoPago = "Ventanilla"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}
