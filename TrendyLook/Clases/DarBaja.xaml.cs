using Microsoft.Data.SqlClient;

namespace TrendyLook;

public partial class DarBaja : ContentPage
{
    public DarBaja()
    {
        InitializeComponent();
    }

    #region Dar de baja

    // Bot�n para dar de baja al usuario
    private async void DarDeBajaUsuario(object sender, EventArgs e)
    {
        try
        {
            string correo = entryCorreo.Text;

            if (string.IsNullOrWhiteSpace(correo))
            {
                await DisplayAlert("Error", "Debe ingresar un correo electr�nico", "Aceptar");
                return;
            }

            try
            {
                using (SqlConnection conexion = DatabaseConnection.GetConnection())
                {
                    SqlCommand comando = new SqlCommand("DELETE FROM usuarios WHERE mail = @correo", conexion);
                    comando.Parameters.AddWithValue("@correo", correo);

                    int filasAfectadas = comando.ExecuteNonQuery();
                    if (filasAfectadas > 0)
                    {
                        await DisplayAlert("�xito", "El usuario ha sido dado de baja correctamente", "Aceptar");
                        entryCorreo.Text = string.Empty;
                    }
                    else
                    {
                        await DisplayAlert("Error", "No se encontr� ning�n usuario con el correo especificado", "Aceptar");
                    }
                }
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ocurri� un error al dar de baja al usuario", "Aceptar");
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
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
                btnDarBaja.IsEnabled = false;
            }
            else
            {
                btnDarBaja.IsEnabled = true;
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