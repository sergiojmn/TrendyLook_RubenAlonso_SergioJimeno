namespace TrendyLook;

public partial class Mapa : ContentPage
{
    string mapUrl = "https://www.google.com/maps/d/u/0/edit?mid=1kmgagjqRlX1s0hEUxEQSffN_EghVLG8&usp=sharing";

    public Mapa()
    {
        InitializeComponent();
        Connectivity.ConnectivityChanged += ComprobarConexion;
        CargarMapa();
    }

    private void CargarMapa()
    {
        if (Connectivity.NetworkAccess == NetworkAccess.Internet)
        {
            mapita.Source = mapUrl;
        }
        else
        {
            mapita.Source = "about:blank";
        }
    }

    private void ComprobarConexion(object sender, ConnectivityChangedEventArgs e)
    {
        if (e.NetworkAccess == NetworkAccess.Internet)
        {
            CargarMapa();
        }
    }
}