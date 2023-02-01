using FxAgendamiento.Models.QR;

using System.Net.Http;
using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces
{
    public interface IHttpService
    {
        public Task<HttpResponseMessage> PostAsync(DataInput data);
    }
}