namespace TrendyLook;

public partial class SoporteEmpleados : ContentPage
{
    public SoporteEmpleados()
    {
        InitializeComponent();

        // Verificar la conexi�n a internet al iniciar la aplicaci�n
        //ComprobarConexion();
        //Connectivity.ConnectivityChanged += CambioDeRed;
    }

    #region Conexi�n con whatsapp
    
    // M�todo para las consultas que un empleado pueda tener
    private void SoporteTrabajadores(object sender, EventArgs e)
    {

    }

    #endregion

    #region Comprobar conexi�n a la red

    // M�todo para comprobar la conexi�n a la red
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
    //        await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
    //    }
    //}

    // M�todo para verificar la conexi�n a internet cuando cambia la conectividad
    //private async void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
    //{
    //    try
    //    {
    //        ComprobarConexion();
    //    }
    //    catch (Exception)
    //    {
    //        await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
    //    }
    //}

    #endregion
  
}