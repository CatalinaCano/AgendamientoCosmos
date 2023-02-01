using FxAgendamiento.Models.Input;

using System;
using System.Security.Cryptography;
using System.Text;

namespace FxAgendamiento.Utils
{
    public static class SecurityHelper
    {
        public static string SHA256Encrypt(string llave)
        {
            SHA256 sha256 = SHA256.Create();
            ASCIIEncoding encoding = new();
            StringBuilder sb = new();
            byte[] stream = sha256.ComputeHash(encoding.GetBytes(llave));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return "0x" + sb.ToString().ToUpper();
        }

        public static string CalcularLlave(AgendaInput request)
        {
            return SHA256Encrypt(
                                  string.Concat(request.IdUsuario,
                                                request.IdServicio,
                                                request.IdSede,
                                                request.IdSubSede,
                                                request.IdMalla,
                                                DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                                                Guid.NewGuid().ToString()
                                                ));
        }
    }
}