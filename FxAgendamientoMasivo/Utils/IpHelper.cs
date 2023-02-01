using System.Linq;
using System.Net;
using System.Net.Sockets;

namespace FxAgendamientoMasivo.Utils
{
    public static class IpHelper
    {
        public static string LocalIPAddress()
        {
            if (!System.Net.NetworkInformation.NetworkInterface.GetIsNetworkAvailable())
            {
                return "0.0.0.0";
            }

            IPHostEntry host = Dns.GetHostEntry(Dns.GetHostName());

            return host
                .AddressList?
                .FirstOrDefault(ip => ip.AddressFamily == AddressFamily.InterNetwork).ToString();
        }
    }
}