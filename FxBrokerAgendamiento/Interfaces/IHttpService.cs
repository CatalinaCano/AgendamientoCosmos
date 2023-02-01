using FxBrokerAgendamiento.Models;

using System.Net.Http;
using System.Threading.Tasks;

namespace FxBrokerAgendamiento.Interfaces
{
    public interface IHttpService
    {
        public Task<HttpResponseMessage> PostAsync(AgendaInput request);
    }
}