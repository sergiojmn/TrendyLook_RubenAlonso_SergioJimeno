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
            bienvenido.Text = $"¡Bienvenido {userName}!";
        }
        catch (Exception)
        {
            DisplayAlert("Error", "Ha ocurrido un error al obtener el nombre del usuario.", "OK");
        }
    }

    #endregion

    #region Cerrar sesión

    // Método para cerrar sesión
    private async void CerrarSesion(object sender, EventArgs e)
    {
        try
        {
            // Borrar los datos de sesión
            Xamarin.Essentials.Preferences.Remove("UserId");
            Xamarin.Essentials.Preferences.Remove("UserType");
            Xamarin.Essentials.Preferences.Remove("UserLoggedIn");
            Xamarin.Essentials.Preferences.Remove("UserName");

            // Restablecer el idUsuario
            UsuarioSesion.ResetIdUsuario();

            // Navegar a la página de inicio de sesión
            await Navigation.PushAsync(new Login());

            if (Application.Current.MainPage is AppShell appShell)
            {
                appShell.CerrarSesion();
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    #endregion


    private async void CambiarContrasena(object sender, EventArgs e)
    {
        try
        {
            string oldPassword = await DisplayPromptAsync("Cambiar Contraseña", "Introduce tu contraseña antigua", "Aceptar", "Cancelar", keyboard: Keyboard.Create(KeyboardFlags.None));
            if (string.IsNullOrWhiteSpace(oldPassword))
                return;

            string newPassword = await DisplayPromptAsync("Cambiar Contraseña", "Introduce tu nueva contraseña", "Aceptar", "Cancelar", keyboard: Keyboard.Create(KeyboardFlags.None));
            if (string.IsNullOrWhiteSpace(newPassword))
                return;

            string newPasswordConfirmation = await DisplayPromptAsync("Cambiar Contraseña", "Confirma tu nueva contraseña", "Aceptar", "Cancelar", keyboard: Keyboard.Create(KeyboardFlags.None));
            if (string.IsNullOrWhiteSpace(newPasswordConfirmation))
                return;

            if (newPassword != newPasswordConfirmation)
            {
                await DisplayAlert("Error", "Las contraseñas no coinciden", "Aceptar");
                return;
            }

            // Lógica para cambiar la contraseña aquí...

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
                    // La contraseña se actualizó correctamente
                    await DisplayAlert("Contraseña Cambiada", "Tu contraseña ha sido cambiada exitosamente", "Aceptar");
                }
                else
                {
                    // La contraseña antigua no coincide o el usuario no está autenticado
                    await DisplayAlert("Error", "La contraseña antigua no es correcta o el usuario no está autenticado", "Aceptar");
                }
            }

        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error al cambiar la contraseña", "Aceptar");
        }

    }


    private async void DarseDeBaja(object sender, EventArgs e)
    {
        try
        {
            // Pregunta de confirmación
            bool confirmacion = await DisplayAlert("Confirmación", "¿Estás seguro de que deseas darte de baja? Esta acción no se puede deshacer.", "Sí", "No");
            if (!confirmacion)
                return;

            // Lógica para darse de baja aquí...
            using (SqlConnection conexion = DatabaseConnection.GetConnection())
            {
                string consulta = "DELETE FROM usuarios WHERE iduser = @idUsuario";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@idUsuario", ObtenerIdUsuarioLogeado());

                int filasAfectadas = comando.ExecuteNonQuery();
                if (filasAfectadas > 0)
                {
                    // Eliminación exitosa
                    await DisplayAlert("Darse de Baja", "Te has dado de baja exitosamente", "Aceptar");

                    // Borrar las preferencias de sesión
                    Xamarin.Essentials.Preferences.Clear();

                    // Redirigir a la página de inicio de sesión
                    await Navigation.PushAsync(new Login());
                }
                else
                {
                    // Error al darse de baja
                    await DisplayAlert("Error", "No se pudo completar la acción. Inténtelo de nuevo más tarde.", "Aceptar");
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

    #region Comprobar conexión a la red

    // Método para comprobar la conexión a la red
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
