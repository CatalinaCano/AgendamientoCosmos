using FxMalla.Interfaces;

using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace FxMalla.Services
{
    public class HttpService : IHttpService
    {
        private readonly HttpClient _client;
        public readonly IConfiguration _configuration;

        public HttpService(HttpClient client, IConfiguration configuration)
        {
            _client = client;
            _configuration = configuration;
        }

        public async Task<HttpResponseMessage> GetAsync(string fechaInicio, string fechaFin)
        {
            string url = ConstruirURL(fechaInicio, fechaFin);
            return await _client.GetAsync(url);
        }

        public string ConstruirURL(string fechaInicio, string fechaFin)
        {
            string urlBase = _configuration["ServicioFestivos:EndPoint"];

            Dictionary<string, string> values = new()
            {
                 { _configuration["ServicioFestivos:Parametro1"], fechaInicio},
                 { _configuration["ServicioFestivos:Parametro2"], fechaFin  }
            };

            var uri = QueryHelpers.AddQueryString(urlBase, values);
            string url = new Uri(uri).ToString();

            return url.Replace("%2F", "/");
        }
    }
}