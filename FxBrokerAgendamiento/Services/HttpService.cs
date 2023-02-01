using FxBrokerAgendamiento.Interfaces;
using FxBrokerAgendamiento.Models;

using System.Net.Http;
using System.Threading.Tasks;

namespace FxBrokerAgendamiento.Services
{
    public class HttpService : IHttpService
    {
        private readonly HttpClient _client;

        public HttpService(HttpClient client)
        {
            _client = client;
        }

        public async Task<HttpResponseMessage> PostAsync(AgendaInput request)
        {
            return await _client.PostAsJsonAsync("", request);
        }
    }
}