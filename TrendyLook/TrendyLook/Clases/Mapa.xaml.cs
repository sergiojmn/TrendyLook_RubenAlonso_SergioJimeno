namespace TrendyLook;

public partial class Mapa : ContentPage
{
	public Mapa()
	{
		InitializeComponent();

        // Cargar mapa
        string mapUrl = "https://www.google.com/maps/d/u/0/edit?mid=1kmgagjqRlX1s0hEUxEQSffN_EghVLG8&usp=sharing";
        mapita.Source = mapUrl;
    }
}