using Microsoft.Maui.Controls;

namespace TrendyLook;

public partial class SoporteEmpleados : ContentPage
{
    #region Propiedades

    private readonly ILauncher launcher;

    #endregion

    public SoporteEmpleados()
    {
        InitializeComponent();

        //Verificar la conexi�n a internet al iniciar la aplicaci�n
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;

        this.launcher = launcher;
    }

    #region Conexi�n con whatsapp

    // M�todo para las consultas que un empleado pueda tener
    private async void SoporteTrabajadores(object sender, EventArgs e)
    {
        try
        {
            if (!editor.Text.Equals(string.Empty))
            {
                string datos = editor.Text;

                var numero = "34632967412";
                var url = $"https://wa.me/{numero}?text=" + datos;
                await launcher.OpenAsync(url);
            }
            else
            {
                await DisplayAlert("Atenci�n", "Rellene los motivos para poder continuar", "Aceptar");
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Estamos trabajando en los problemas...", "Aceptar");
        }
    }

    #endregion

    #region Comprobar conexi�n a la red

    // M�todo para comprobar la conexi�n a la red
    private async void ComprobarConexion()
    {
        try
        {
            if (Connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                btnSoporte.IsEnabled = false;
            }
            else
            {
                btnSoporte.IsEnabled = true;
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }

    // M�todo para verificar la conexi�n a internet cuando cambia la conectividad
    private async void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
    {
        try
        {
            ComprobarConexion();
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }

    #endregion
}