using FxCodigoQR.Interfaces;

using QRCoder;

using Spire.Barcode;

using System.Drawing;

namespace FxCodigoQR.Services
{
    public class GeneraQR : IGeneraQR
    {
        private readonly BarcodeSettings settings;

        public GeneraQR()
        {
            settings = new BarcodeSettings();
            settings.Type = BarCodeType.QRCode;

            settings.ShowText = false;
            settings.ResolutionType = ResolutionType.UseDpi;
        }

        public Image construyeQR(int barWidth, int leftMargin, int rigthMargin, int topMargin, int bottomMargin, string data)
        {
            settings.X = barWidth;
            settings.LeftMargin = leftMargin;
            settings.RightMargin = rigthMargin;
            settings.TopMargin = topMargin;
            settings.BottomMargin = bottomMargin;
            settings.QRCodeECL = QRCodeECL.M;
            settings.Data = data;
            BarCodeGenerator generator = new(settings);
            return generator.GenerateImage();
        }

        public string construyeQR(string data)
        {
            var imgType = Base64QRCode.ImageType.Jpeg;
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(data, QRCodeGenerator.ECCLevel.Q);
            Base64QRCode qrCode = new Base64QRCode(qrCodeData);
            return qrCode.GetGraphic(20, Color.Black, Color.White, true, imgType);
        }
    }
}