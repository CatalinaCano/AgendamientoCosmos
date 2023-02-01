using Azure.Identity;
using Azure.Security.KeyVault.Secrets;

using FluentValidation;

using FxSede;
using FxSede.DataContext;
using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models.Input;
using FxSede.Repositories;
using FxSede.Validator;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Fluent;
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using Newtonsoft.Json;

using System;
using System.IO;

[assembly: FunctionsStartup(typeof(Startup))]

namespace FxSede
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

            #region Repositories

            builder.Services.AddScoped<ISedeRepository, SedeRepository>();
            builder.Services.AddScoped<IServicioRepository, ServicioRepository>();

            #endregion Repositories

            #region Validators

            builder.Services.AddScoped<IValidator<SedeInput>, SedeValidator>();
            builder.Services.AddScoped<IValidator<SubSedeInput>, SubSedeValidator>();
            builder.Services.AddScoped<IValidator<TiempoOfflineInput>, TiempoOfflineValidator>();
            builder.Services.AddScoped<IValidator<ServicioInput>, ServicioValidator>();

            #endregion Validators

            builder.Services.AddSingleton<IConfiguration>(configuration);
        }
    }
}