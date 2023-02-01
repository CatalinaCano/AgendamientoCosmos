using Azure.Identity;
using Azure.Security.KeyVault.Secrets;

using FluentValidation;

using FxMalla;
using FxMalla.DataContext;
using FxMalla.Interfaces;
using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models.Input;
using FxMalla.Repositories;
using FxMalla.Services;
using FxMalla.Validator;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Fluent;
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using Newtonsoft.Json;

using System;
using System.IO;
using System.Net.Http.Headers;

[assembly: FunctionsStartup(typeof(Startup))]

namespace FxMalla
{
    public class Startup : FunctionsStartup
    {
        public override void Configure(IFunctionsHostBuilder builder)
        {
            var keyVaultName = Environment.GetEnvironmentVariable("KEY_VAULT_NAME");
            var kvUri = $"https://{keyVaultName}.vault.azure.net/";

            var tenant = new DefaultAzureCredentialOptions
            {
                VisualStudioTenantId = Environment.GetEnvironmentVariable("AzureTenantId")
            };

            ConfigurationBuilder configurationBuilder = new();
            var configuration = configurationBuilder
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("local.settings.json", optional: true, reloadOnChange:
                true)
                .AddAzureKeyVault(vaultUri: new Uri(kvUri), credential: new DefaultAzureCredential(tenant))
                .AddEnvironmentVariables()
                .Build();

            string nombreAccount = configuration["SecretsNames:EndpointUri"];
            string nombreSecreto = configuration["SecretsNames:Key"];

            string account = configuration[nombreAccount];
            string key = configuration[nombreSecreto];
            string databaseName = configuration["CosmosDB:NombreBD"];

            builder.Services.AddSingleton<SecretClient>();
            builder.Services.AddSingleton<DapperContext>();
            builder.Services.AddAutoMapper(typeof(Startup));

            CosmosClientBuilder clientBuilder = new(account, key);
            CosmosClient client = clientBuilder
                .WithApplicationName(databaseName)
                .WithApplicationName(Regions.EastUS2)
                .WithConnectionModeDirect()
                .WithSerializerOptions(new CosmosSerializationOptions() { PropertyNamingPolicy = CosmosPropertyNamingPolicy.CamelCase })
                .Build();

            builder.Services.AddSingleton(serviceProvider =>
            {
                return client;
            });

            builder.Services.AddMvcCore().AddNewtonsoftJson(jsonOptions =>
            {
                jsonOptions.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
            });

            builder.Services.AddTransient<IUnitOfWork, UnitOfWork>();
            builder.Services.AddTransient<IDataService, DataService>();

            #region HttpClient

            string ApiKey = configuration["SecretsNames:ApiKeyFestivos"];
            string valueApiKey = configuration[ApiKey];

            builder.Services.AddHttpClient();
            builder.Services.AddHttpClient<IHttpService, HttpService>(client =>
            {
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                client.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", valueApiKey);
            });

            #endregion HttpClient

            #region Repositories

            builder.Services.AddScoped<IMallaRepository, MallaRepository>();
            builder.Services.AddScoped<ISedeRepository, SedeRepository>();
            builder.Services.AddScoped<IServicioRepository, ServicioRepository>();
            builder.Services.AddScoped<ITramiteRepository, TramiteRepository>();
            builder.Services.AddScoped<IUsuarioRepository, UsuarioRepository>();

            #endregion Repositories

            #region Validadores

            builder.Services.AddScoped<IValidator<MallaInput>, MallaInputValidator>();
    
            builder.Services.AddScoped<IValidator<Tuple<string, string, string>>, TiemposValidator>();
            builder.Services.AddScoped<IValidator<Tuple<string, string>>, DiasValidator>();
            builder.Services.AddScoped<IValidator<FechaInput>, FechaInputValidator>();

            #endregion Validadores

            builder.Services.AddSingleton<IConfiguration>(configuration);
        }
    }
}