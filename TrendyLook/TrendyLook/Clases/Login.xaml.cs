using Microsoft.Data.SqlClient;
using System.Data;

namespace TrendyLook
{
    public partial class Login : ContentPage
    {
        public Login()
        {
            InitializeComponent();

            // Verificar la conexión a internet al iniciar la aplicación
            ComprobarConexion();
            Microsoft.Maui.Networking.Connectivity.ConnectivityChanged += CambioDeRed;

            // Reconocer el gesto al pulsar el label olvidado contraseña
            TapGestureRecognizer tgr = new TapGestureRecognizer();
            tgr.Tapped += async (s, e) =>
            {
                var numero = "+34632967412";
                var url = $"https://wa.me/{numero}?text=Nombre de usuario: \r\nCorreo electrónico: " +
                $"\r\nNueva contraseña: \r\nRepita su contraseña: ";
                await Microsoft.Maui.ApplicationModel.Launcher.OpenAsync(url);
            };

            // Cambiar contraseña
            lblpassword.GestureRecognizers.Add(tgr);
        }

        #region Iniciar sesión

        // Botón para iniciar Sesión
        private async void IniciarSesion(object sender, EventArgs e)
        {
            try
            {
                string usuario = entryuser.Text;
                string contrasena = entrypassword.Text;

                (bool credencialesValidas, string userType, int userId, string userName) = await VerificarCredenciales(usuario, contrasena);
                if (credencialesValidas)
                {
                    // Guardar los detalles del usuario en Preferences
                    Xamarin.Essentials.Preferences.Set("UserId", userId);
                    Xamarin.Essentials.Preferences.Set("UserType", userType);
                    Xamarin.Essentials.Preferences.Set("UserName", userName); // Almacenar el nombre del usuario
                    Xamarin.Essentials.Preferences.Set("UserLoggedIn", true);

                    await MostrarMensajeDeInicioDeSesion(userName, userType);

                    switch (userType)
                    {
                        case "1":
                            if (Application.Current.MainPage is AppShell appShell1)
                            {
                                appShell1.MostrarTabsAdmin();
                            }
                            break;
                        case "2":
                            if (Application.Current.MainPage is AppShell appShell2)
                            {
                                appShell2.MostrarTabsEmpleado();
                            }
                            break;
                        case "3":
                            if (Application.Current.MainPage is AppShell appShell3)
                            {
                                appShell3.MostrarTabsCliente();
                            }
                            break;
                        default:
                            break;
                    }

                    await Shell.Current.GoToAsync("//Inicio");

                    entrypassword.Text = "";
                    entryuser.Text = "";
                }
                else
                {
                    await DisplayAlert("Inicio de sesión fallido", "Nombre de usuario o contraseña incorrectos", "Aceptar");
                }
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        // Método para iniciar sesión
        private async Task<(bool, string, int, string)> VerificarCredenciales(string email, string password)
        {
            bool credencialesValidas = false;
            string userType = null;
            int userId = 0;
            string userName = null;

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                using (SqlConnection conexion = DatabaseConnection.GetConnection())
                {
                    SqlCommand comando = new SqlCommand("VerificarCredenciales", conexion);
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@mail", email);
                    comando.Parameters.AddWithValue("@password", password);

                    SqlDataReader reader = await comando.ExecuteReaderAsync();
                    if (reader.Read())
                    {
                        credencialesValidas = true;
                        userType = reader["usertype"].ToString();
                        userId = reader.GetInt32(reader.GetOrdinal("iduser"));
                        userName = reader["name"].ToString(); // Capturar el nombre del usuario
                    }
                    reader.Close();
                }
            }
            else
            {
                throw new ArgumentException("El correo electrónico y la contraseña no pueden estar vacíos");
            }

            return (credencialesValidas, userType, userId, userName);
        }

        // Botón para Ver/Ocultar contraseña
        private async void VerContraseña(object sender, EventArgs e)
        {
            try
            {
                if (entrypassword.IsPassword)
                {
                    entrypassword.IsPassword = false;
                    ((ImageButton)sender).Source = "ojoabierto.png";
                }
                else
                {
                    entrypassword.IsPassword = true;
                    ((ImageButton)sender).Source = "ojocerrado.png";
                }
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        // Método para mostrar el mensaje de inicio de sesión
        private async Task MostrarMensajeDeInicioDeSesion(string userName, string userType)
        {
            try
            {
                string tipoUsuario = string.Empty;

                switch (userType)
                {
                    case "1":
                        tipoUsuario = "Admin";
                        break;
                    case "2":
                        tipoUsuario = "Empleado";
                        break;
                    case "3":
                        tipoUsuario = "";
                        break;
                    default:
                        tipoUsuario = "Desconocido";
                        break;
                }

                string mensaje = $"Bienvenido {userName} ({tipoUsuario})"; // Usar el nombre del usuario
                await DisplayAlert("Inicio de sesión", mensaje, "Aceptar");
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        #endregion

        #region Comprobar conexión a la red

        // Método para comprobar la conexión a la red
        private async void ComprobarConexion()
        {
            try
            {
                if (Microsoft.Maui.Networking.Connectivity.NetworkAccess != Microsoft.Maui.Networking.NetworkAccess.Internet)
                {
                    btnlogin.IsEnabled = false;
                }
                else
                {
                    btnlogin.IsEnabled = true;
                }
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        // Método para verificar la conexión a internet cuando cambia la conectividad
        private async void CambioDeRed(object sender, Microsoft.Maui.Networking.ConnectivityChangedEventArgs e)
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
}
