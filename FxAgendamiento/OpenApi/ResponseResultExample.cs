using FxAgendamiento.Models;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;

using Newtonsoft.Json.Serialization;

using System;

namespace FxAgendamiento.OpenApi
{
    public class ResponseResultExample : OpenApiExample<ResponseResult>
    {
        public override IOpenApiExample<ResponseResult> Build(NamingStrategy namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new ResponseResult()
                    {
                        IsError = true,
                        Message = "Mensaje de la operación",
                        Timestamp = DateTime.Now
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}