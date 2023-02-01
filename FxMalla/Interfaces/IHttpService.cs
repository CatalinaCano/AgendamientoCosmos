using System.Net.Http;
using System.Threading.Tasks;

namespace FxMalla.Interfaces
{
    public interface IHttpService
    {
        public Task<HttpResponseMessage> GetAsync(string fechaInicio, string fechaFin);

        public string ConstruirURL(string fechaInicio, string fechaFin);
    }
}