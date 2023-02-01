using FxMalla.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMalla.Interfaces.RepositoryPattern
{
    public interface IUsuarioRepository
    {
        public Task<List<UsuarioDto>> ObtenerUsuario(string IdUsuario);
    }
}