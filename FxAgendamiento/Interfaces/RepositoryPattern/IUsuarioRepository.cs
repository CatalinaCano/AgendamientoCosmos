using FxAgendamiento.Models.DataTransferObjects;

using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces.RepositoryPattern
{
    public interface IUsuarioRepository
    {
        public Task<UsuarioDto> ObtenerUsuario(string IdUsuario);
        public Task<UsuarioDto> ObtenerUsuarioPorNumeroIdenticacion(string numeroIdentificacion ,int digitoVerificacion);
    }
}