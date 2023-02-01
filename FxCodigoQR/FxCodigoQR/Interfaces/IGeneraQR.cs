using System.Drawing;

namespace FxCodigoQR.Interfaces
{
    public interface IGeneraQR
    {
        Image construyeQR(int barWidth, int leftMargin, int rigthMargin, int topMargin, int bottomMargin, string data);

        string construyeQR(string data);
    }
}