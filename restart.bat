https://sigitov.de/how-to-restart-a-fritzbox-modem-router-over-the-internet-from-a-c-console-application/
using PS.FritzBox.API;

namespace RebootFritzbox
{
    class Program
    {
        static void Main(string[] args)
        {
            DeviceConfigClient client = new DeviceConfigClient("https://internet.address.of.fritzbox.net", 10000);
            client.UserName = "FritzBoxUser";
            client.Password = "FritzBoxPassword";
            client.Reboot();
        }
    }
}