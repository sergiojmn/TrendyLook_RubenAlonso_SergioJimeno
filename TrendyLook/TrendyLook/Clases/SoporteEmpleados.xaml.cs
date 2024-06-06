namespace TrendyLook;

public partial class SoporteEmpleados : ContentPage
{
    public SoporteEmpleados()
    {
        InitializeComponent();

        // Verificar la conexión a internet al iniciar la aplicación
        //ComprobarConexion();
        //Connectivity.ConnectivityChanged += CambioDeRed;
    }

    #region Conexión con whatsapp
    
    // Método para las consultas que un empleado pueda tener
    private void SoporteTrabajadores(object sender, EventArgs e)
    {

    }

    #endregion

    #region Comprobar conexión a la red

    // Método para comprobar la conexión a la red
    //private async void ComprobarConexion()
    //{
    //    try
    //    {
    //        if (Connectivity.NetworkAccess != NetworkAccess.Internet)
    //        {
    //            whatsapp.IsEnabled = false;
    //            whatsappbaja.IsEnabled = false;
    //        }
    //        else
    //        {
    //            whatsapp.IsEnabled = true;
    //            whatsappbaja.IsEnabled = true;
    //        }
    //    }
    //    catch (Exception)
    //    {
    //        await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
    //    }
    //}

    // Método para verificar la conexión a internet cuando cambia la conectividad
    //private async void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
    //{
    //    try
    //    {
    //        ComprobarConexion();
    //    }
    //    catch (Exception)
    //    {
    //        await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
    //    }
    //}

    #endregion
  
}