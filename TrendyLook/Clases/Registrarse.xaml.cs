using Microsoft.Data.SqlClient;
using System.Text.RegularExpressions;

namespace TrendyLook;

public partial class Registrarse : ContentPage
{
    public Registrarse()
    {
        InitializeComponent();

        // Verificar la conexión a internet al iniciar la aplicación
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;
    }

    #region Registrarse

    // Botón para registrarse
    private async void RegistrarseBBDD(object sender, EventArgs e)
    {
        try
        {
            string email = entryemail.Text;
            string usuario = entryuserregister.Text;
            string contrasena = entrypasswordregister.Text;
            string telefono = entryphone.Text;
            int usertype = 3;
            string genero = ObtenerGeneroSeleccionado();

            // Validar que todos los campos están llenos
            if (string.IsNullOrEmpty(email))
            {
                await DisplayAlert("Error", "El campo de correo electrónico está vacío", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(usuario))
            {
                await DisplayAlert("Error", "El campo de nombre de usuario está vacío", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(contrasena))
            {
                await DisplayAlert("Error", "El campo de contraseña está vacío", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(telefono))
            {
                await DisplayAlert("Error", "El campo de teléfono está vacío", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(genero))
            {
                await DisplayAlert("Error", "Debes seleccionar un género", "Aceptar");
                return;
            }

            // Validar el formato del correo electrónico
            if (!ValidarCorreoElectronico(email))
            {
                await DisplayAlert("Error", "Debe insertar un correo electrónico válido", "Aceptar");
                return;
            }

            // Validar los parámetros de seguridad de la contraseña
            if (!ValidarContrasena(contrasena))
            {
                await DisplayAlert("Error", "La contraseña no cumple con los requisitos mínimos.\nDebe tener:\n- Mínimo 8 caracteres\n- Una letra mayúscula\n- Un caracter especial (. , @ $ ...)", "Aceptar");
                return;
            }

            // Validar el formato del número de teléfono
            if (!ValidarTelefono(telefono))
            {
                await DisplayAlert("Error", "Debe insertar un número de teléfono válido (ej. 612345789)", "Aceptar");
                return;
            }

            // Verificar si el correo electrónico ya está registrado
            if (await CorreoYaRegistrado(email))
            {
                await DisplayAlert("Error", "El correo electrónico ya está registrado", "Aceptar");
                return;
            }

            try
            {
                using (SqlConnection conexion = DatabaseConnection.GetConnection())
                {
                    string consulta = "INSERT INTO usuarios (iduser, mail, name, password, usertype, genero, phone) VALUES (@iduser, @correo, @usuario, @contrasena, @usertype, @genero, @telefono)";
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@iduser", GenerarIdUsuario()); // Genera un nuevo ID de usuario
                    comando.Parameters.AddWithValue("@correo", email);
                    comando.Parameters.AddWithValue("@usuario", usuario);
                    comando.Parameters.AddWithValue("@contrasena", contrasena);
                    comando.Parameters.AddWithValue("@usertype", usertype);
                    comando.Parameters.AddWithValue("@genero", genero);
                    comando.Parameters.AddWithValue("@telefono", telefono);

                    int filasAfectadas = comando.ExecuteNonQuery();
                    if (filasAfectadas > 0)
                    {
                        await DisplayAlert("Registro exitoso", "Te has registrado correctamente", "Aceptar");

                        if (Application.Current.MainPage is AppShell appShell)
                        {
                            appShell.MostrarTabsCliente();
                        }
                        await Shell.Current.GoToAsync("//Inicio");

                        entryemail.Text = "";
                        entrypasswordregister.Text = "";
                        entryphone.Text = "";
                        entryuserregister.Text = "";
                    }
                    else
                    {
                        await DisplayAlert("Error", "No se pudo completar el registro", "Aceptar");
                    }
                }
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ocurrió un error durante el registro", "Aceptar");
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    // Método para verificar si el correo electrónico ya está registrado
    private async Task<bool> CorreoYaRegistrado(string email)
    {
        try
        {
            using (SqlConnection conexion = DatabaseConnection.GetConnection())
            {
                string consulta = "SELECT COUNT(*) FROM usuarios WHERE mail = @correo";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@correo", email);

                int count = (int)comando.ExecuteScalar();
                return count > 0;
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ocurrió un error al verificar el correo electrónico", "Aceptar");
            return true;
        }
    }

    // Método para generar un nuevo ID de usuario
    private int GenerarIdUsuario()
    {
        int nuevoIdUsuario = 1;

        using (SqlConnection conexion = DatabaseConnection.GetConnection())
        {
            string consulta = "SELECT MAX(iduser) FROM usuarios";
            SqlCommand comando = new SqlCommand(consulta, conexion);

            object resultado = comando.ExecuteScalar();
            if (resultado != DBNull.Value && resultado != null)
            {
                nuevoIdUsuario = Convert.ToInt32(resultado) + 1;
            }
        }

        return nuevoIdUsuario;
    }

    // Método para obtener el género seleccionado
    private string ObtenerGeneroSeleccionado()
    {
        if (rbHombre.IsChecked)
        {
            return "Hombre";
        }
        else if (rbMujer.IsChecked)
        {
            return "Mujer";
        }
        else if (rbOtro.IsChecked)
        {
            return "Otro";
        }
        else
        {
            return string.Empty;
        }
    }

    // Método para validar los parámetros del correo electrónico
    private bool ValidarCorreoElectronico(string email)
    {
        string patron = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
        return Regex.IsMatch(email, patron);
    }

    // Método para validar los parámetros de seguridad de la contraseña
    private bool ValidarContrasena(string contrasena)
    {
        string patron = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$";
        return Regex.IsMatch(contrasena, patron);
    }

    // Método para validar los parámetros del teléfono
    private bool ValidarTelefono(string telefono)
    {
        // Ajusta el patrón según tus requisitos. Este patrón acepta números de 10 dígitos.
        string patron = @"^\d{9}$";
        return Regex.IsMatch(telefono, patron);
    }

    // Botón para Ver/Ocultar contraseña
    private async void VerContraseña(object sender, EventArgs e)
    {
        try
        {
            if (entrypasswordregister.IsPassword)
            {
                entrypasswordregister.IsPassword = false;
                ((ImageButton)sender).Source = "ojoabierto.png";
            }
            else
            {
                entrypasswordregister.IsPassword = true;
                ((ImageButton)sender).Source = "ojocerrado.png";
            }
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
            if (Connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                btnregistrarse.IsEnabled = false;
            }
            else
            {
                btnregistrarse.IsEnabled = true;
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