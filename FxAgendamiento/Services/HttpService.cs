using FxAgendamiento.Interfaces;
using FxAgendamiento.Models.QR;

using Microsoft.Extensions.Configuration;

using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace FxAgendamiento.Services
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

       
        public async Task<HttpResponseMessage> PostAsync(DataInput data)
        {            
            return await _client.PostAsJsonAsync("", data);
        }
    }
}