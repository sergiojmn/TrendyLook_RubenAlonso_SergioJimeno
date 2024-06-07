using Microsoft.Data.SqlClient;

namespace TrendyLook;

public partial class Perfil : ContentPage
{
    public Perfil()
    {
        InitializeComponent();
        SetWelcomeMessage();
    }

    #region Set Welcome Message

    private void SetWelcomeMessage()
    {
        try
        {
            // Get the user's name from session preferences
            string userName = Xamarin.Essentials.Preferences.Get("UserName", "Usuario");

            // Set the welcome message
            bienvenido.Text = $"�Bienvenido {userName}!";
        }
        catch (Exception)
        {
            DisplayAlert("Error", "Ha ocurrido un error al obtener el nombre del usuario.", "OK");
        }
    }

    #endregion

    #region Cerrar sesi�n

    // M�todo para cerrar sesi�n
    private async void CerrarSesion(object sender, EventArgs e)
    {
        try
        {
            // Borrar los datos de sesi�n
            Xamarin.Essentials.Preferences.Remove("UserId");
            Xamarin.Essentials.Preferences.Remove("UserType");
            Xamarin.Essentials.Preferences.Remove("UserLoggedIn");
            Xamarin.Essentials.Preferences.Remove("UserName");

            // Restablecer el idUsuario
            UsuarioSesion.ResetIdUsuario();

            // Navegar a la p�gina de inicio de sesi�n
            await Navigation.PushAsync(new Login());

            if (Application.Current.MainPage is AppShell appShell)
            {
                appShell.CerrarSesion();
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }

    #endregion


    private async void CambiarContrasena(object sender, EventArgs e)
    {
        try
        {
            string oldPassword = await DisplayPromptAsync("Cambiar Contrase�a", "Introduce tu contrase�a antigua", "Aceptar", "Cancelar", keyboard: Keyboard.Create(KeyboardFlags.None));
            if (string.IsNullOrWhiteSpace(oldPassword))
                return;

            string newPassword = await DisplayPromptAsync("Cambiar Contrase�a", "Introduce tu nueva contrase�a", "Aceptar", "Cancelar", keyboard: Keyboard.Create(KeyboardFlags.None));
            if (string.IsNullOrWhiteSpace(newPassword))
                return;

            string newPasswordConfirmation = await DisplayPromptAsync("Cambiar Contrase�a", "Confirma tu nueva contrase�a", "Aceptar", "Cancelar", keyboard: Keyboard.Create(KeyboardFlags.None));
            if (string.IsNullOrWhiteSpace(newPasswordConfirmation))
                return;

            if (newPassword != newPasswordConfirmation)
            {
                await DisplayAlert("Error", "Las contrase�as no coinciden", "Aceptar");
                return;
            }

            // L�gica para cambiar la contrase�a aqu�...

            using (SqlConnection conexion = DatabaseConnection.GetConnection())
            {
                string consulta = "UPDATE usuarios SET password = @nuevaContrasena WHERE password = @contrasenaAntigua AND iduser = @idUsuario";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@nuevaContrasena", newPassword);
                comando.Parameters.AddWithValue("@contrasenaAntigua", oldPassword);
                comando.Parameters.AddWithValue("@idUsuario", ObtenerIdUsuarioLogeado());

                int filasAfectadas = comando.ExecuteNonQuery();
                if (filasAfectadas > 0)
                {
                    // La contrase�a se actualiz� correctamente
                    await DisplayAlert("Contrase�a Cambiada", "Tu contrase�a ha sido cambiada exitosamente", "Aceptar");
                }
                else
                {
                    // La contrase�a antigua no coincide o el usuario no est� autenticado
                    await DisplayAlert("Error", "La contrase�a antigua no es correcta o el usuario no est� autenticado", "Aceptar");
                }
            }

        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error al cambiar la contrase�a", "Aceptar");
        }

    }


    private async void DarseDeBaja(object sender, EventArgs e)
    {
        try
        {
            // Pregunta de confirmaci�n
            bool confirmacion = await DisplayAlert("Confirmaci�n", "�Est�s seguro de que deseas darte de baja? Esta acci�n no se puede deshacer.", "S�", "No");
            if (!confirmacion)
                return;

            // L�gica para darse de baja aqu�...
            using (SqlConnection conexion = DatabaseConnection.GetConnection())
            {
                string consulta = "DELETE FROM usuarios WHERE iduser = @idUsuario";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@idUsuario", ObtenerIdUsuarioLogeado());

                int filasAfectadas = comando.ExecuteNonQuery();
                if (filasAfectadas > 0)
                {
                    // Eliminaci�n exitosa
                    await DisplayAlert("Darse de Baja", "Te has dado de baja exitosamente", "Aceptar");

                    // Borrar las preferencias de sesi�n
                    Xamarin.Essentials.Preferences.Clear();

                    // Redirigir a la p�gina de inicio de sesi�n
                    await Navigation.PushAsync(new Login());
                }
                else
                {
                    // Error al darse de baja
                    await DisplayAlert("Error", "No se pudo completar la acci�n. Int�ntelo de nuevo m�s tarde.", "Aceptar");
                }
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error al procesar la solicitud", "Aceptar");
        }
    }



    private int ObtenerIdUsuarioLogeado()
    {
        return Xamarin.Essentials.Preferences.Get("UserId", 0);
    }

    #region Comprobar conexi�n a la red

    // M�todo para comprobar la conexi�n a la red
    private async void ComprobarConexion()
    {
        try
        {
            if (Connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                btnCambiarContrasena.IsEnabled = false;
                btnCerrar.IsEnabled = false;
                btnDarBaja.IsEnabled = false;
            }
            else
            {
                btnCambiarContrasena.IsEnabled = true;
                btnCerrar.IsEnabled = true;
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
