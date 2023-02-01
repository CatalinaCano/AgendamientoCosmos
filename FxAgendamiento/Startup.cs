using Azure.Identity;
using Azure.Security.KeyVault.Secrets;

using FluentValidation;

using FxAgendamiento;
using FxAgendamiento.DataContext;
using FxAgendamiento.Interfaces;
using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.Input;
using FxAgendamiento.Repositories;
using FxAgendamiento.Services;
using FxAgendamiento.Validator;

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

namespace FxAgendamiento
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
                jsonOptions.SerializerSettings.NullValueHandling = NullValueHandling.Include;
            });

            #region HttpClient

            string ApiKeyName = configuration["SecretsNames:ApiKeyQR"];
            string ApiKey = configuration[ApiKeyName];
            string URLBase = configuration["ServicioQR:EndPoint"];


            builder.Services.AddHttpClient();
            builder.Services.AddHttpClient<IHttpService, HttpService>(client =>
            {
                client.BaseAddress = new Uri(URLBase);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                client.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", ApiKey);
            });

            #endregion HttpClient

            #region Repositories

            builder.Services.AddScoped<IMallaRepository, MallaRepository>();
            builder.Services.AddScoped<ISedeRepository, SedeRepository>();
            builder.Services.AddScoped<IServicioRepository, ServicioRepository>();
            builder.Services.AddScoped<ITramiteRepository, TramiteRepository>();
            builder.Services.AddScoped<IEmailRepository, EmailRepository>();
            builder.Services.AddScoped<IUsuarioRepository, UsuarioRepository>();

            #endregion Repositories

            #region validadores

            builder.Services.AddScoped<IValidator<AgendaInput>, AgendaInputValidator>();
            builder.Services.AddScoped<IValidator<NuevoEstadoInput>, NuevoEstadoValidator>();
            builder.Services.AddScoped<IValidator<CancelacionInput>, CancelacionValidator>();
            builder.Services.AddScoped<IValidator<Tuple<string, string>>, ListarTramitesValidator>();

            #endregion validadores

            builder.Services.AddTransient<IUnitOfWork, UnitOfWork>();
            builder.Services.AddSingleton<IServiceBusService, ServiceBusService>();
            builder.Services.AddTransient<IMessageService, MessageService>();

            builder.Services.AddSingleton<IConfiguration>(configuration);
        }
    }
}