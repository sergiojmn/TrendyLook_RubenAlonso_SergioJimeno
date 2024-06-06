namespace TrendyLook;

public partial class Soporte : ContentPage
{
    #region Propiedades

    private readonly ILauncher launcher;

    #endregion

    public Soporte(ILauncher launcher)
    {
        InitializeComponent();

        // Verificar la conexión a internet al iniciar la aplicación
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;

        this.launcher = launcher;
    }

    #region Conexión con whatsapp

    // Botón para ir a Whatsapp y soporte
    private async void IrWhatsapp(object sender, EventArgs e)
    {
        try
        {
            var numero = "34632967412";
            var url = $"https://wa.me/{numero}?text=Hola buenas, tengo un problema.";
            await launcher.OpenAsync(url);
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Estamos trabajando en los problemas...", "Aceptar");
        }
    }

    // Botón para ir a Whatsapp y darse de baja
    private async void IrWhatsappBaja(object sender, EventArgs e)
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
                await DisplayAlert("Atención", "Rellene los motivos para poder continuar", "Aceptar");
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Estamos trabajando en los problemas...", "Aceptar");
        }
    }

    #endregion

    #region Comprobar conexión a la red

    // Método para comprobar la conexión a la red
    private async void ComprobarConexion()
    {
        try
        {
        if (Connectivity.NetworkAccess != NetworkAccess.Internet)
        {
            whatsapp.IsEnabled = false;
            whatsappbaja.IsEnabled = false;
        }
        else
        {
            whatsapp.IsEnabled = true;
            whatsappbaja.IsEnabled = true;
        }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    // Método para verificar la conexión a internet cuando cambia la conectividad
    private async void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
    {
        try
        {
        ComprobarConexion();
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    #endregion
}