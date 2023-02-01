using Azure.Security.KeyVault.Secrets;

using FxBrokerAgendamiento;
using FxBrokerAgendamiento.Interfaces;
using FxBrokerAgendamiento.Services;

using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using Newtonsoft.Json;

using System;
using System.IO;
using System.Net.Http.Headers;

[assembly: FunctionsStartup(typeof(Startup))]

namespace FxBrokerAgendamiento
{
    internal class Startup : FunctionsStartup
    {
        public override void Configure(IFunctionsHostBuilder builder)
        {
            ConfigurationBuilder configurationBuilder = new();
            var configuration = configurationBuilder
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("local.settings.json", optional: true, reloadOnChange:
                true)
                .AddEnvironmentVariables()
                .Build();

            builder.Services.AddSingleton<SecretClient>();

            builder.Services.AddMvcCore().AddNewtonsoftJson(jsonOptions =>
            {
                jsonOptions.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
            });

            #region HttpClient

            string endpoint = configuration["Agendamiento:EndPoint"];

            builder.Services.AddHttpClient();
            builder.Services.AddHttpClient<IHttpService, HttpService>(client =>
            {
                client.BaseAddress = new Uri(endpoint);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            });

            #endregion HttpClient

            builder.Services.AddSingleton<IConfiguration>(configuration);
        }
    }
}