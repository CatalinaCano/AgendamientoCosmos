using Azure.Identity;
using Azure.Security.KeyVault.Secrets;

using FxDiasSemana;
using FxDiasSemana.DataContext;
using FxDiasSemana.Interfaces;
using FxDiasSemana.Services;

using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using Newtonsoft.Json;

using System;
using System.IO;

[assembly: FunctionsStartup(typeof(Startup))]

namespace FxDiasSemana
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

            builder.Services.AddSingleton<SecretClient>();
            builder.Services.AddAutoMapper(typeof(Startup));
            builder.Services.AddSingleton<DapperContext>();
            builder.Services.AddMvcCore().AddNewtonsoftJson(jsonOptions =>
            {
                jsonOptions.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
            });

            builder.Services.AddTransient<IDatabaseService, DatabaseService>();

            builder.Services.AddSingleton<IConfiguration>(configuration);
        }
    }
}