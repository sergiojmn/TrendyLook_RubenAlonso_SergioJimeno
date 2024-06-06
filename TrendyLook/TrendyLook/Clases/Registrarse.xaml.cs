using Microsoft.Data.SqlClient;
using System.Text.RegularExpressions;

namespace TrendyLook;

public partial class Registrarse : ContentPage
{
    public Registrarse()
    {
        InitializeComponent();

        // Verificar la conexi�n a internet al iniciar la aplicaci�n
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;
    }

    #region Registrarse

    // Bot�n para registrarse
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

            // Validar que todos los campos est�n llenos
            if (string.IsNullOrEmpty(email))
            {
                await DisplayAlert("Error", "El campo de correo electr�nico est� vac�o", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(usuario))
            {
                await DisplayAlert("Error", "El campo de nombre de usuario est� vac�o", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(contrasena))
            {
                await DisplayAlert("Error", "El campo de contrase�a est� vac�o", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(telefono))
            {
                await DisplayAlert("Error", "El campo de tel�fono est� vac�o", "Aceptar");
                return;
            }

            if (string.IsNullOrEmpty(genero))
            {
                await DisplayAlert("Error", "Debes seleccionar un g�nero", "Aceptar");
                return;
            }

            // Validar el formato del correo electr�nico
            if (!ValidarCorreoElectronico(email))
            {
                await DisplayAlert("Error", "Debe insertar un correo electr�nico v�lido", "Aceptar");
                return;
            }

            // Validar los par�metros de seguridad de la contrase�a
            if (!ValidarContrasena(contrasena))
            {
                await DisplayAlert("Error", "La contrase�a no cumple con los requisitos m�nimos.\nDebe tener:\n- M�nimo 8 caracteres\n- Una letra may�scula\n- Un caracter especial (. , @ $ ...)", "Aceptar");
                return;
            }

            // Validar el formato del n�mero de tel�fono
            if (!ValidarTelefono(telefono))
            {
                await DisplayAlert("Error", "Debe insertar un n�mero de tel�fono v�lido (ej. 612345789)", "Aceptar");
                return;
            }

            // Verificar si el correo electr�nico ya est� registrado
            if (await CorreoYaRegistrado(email))
            {
                await DisplayAlert("Error", "El correo electr�nico ya est� registrado", "Aceptar");
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
                await DisplayAlert("Error", "Ocurri� un error durante el registro", "Aceptar");
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }

    // M�todo para verificar si el correo electr�nico ya est� registrado
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
            await DisplayAlert("Error", "Ocurri� un error al verificar el correo electr�nico", "Aceptar");
            return true;
        }
    }

    // M�todo para generar un nuevo ID de usuario
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

    // M�todo para obtener el g�nero seleccionado
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

    // M�todo para validar los par�metros del correo electr�nico
    private bool ValidarCorreoElectronico(string email)
    {
        string patron = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
        return Regex.IsMatch(email, patron);
    }

    // M�todo para validar los par�metros de seguridad de la contrase�a
    private bool ValidarContrasena(string contrasena)
    {
        string patron = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$";
        return Regex.IsMatch(contrasena, patron);
    }

    // M�todo para validar los par�metros del tel�fono
    private bool ValidarTelefono(string telefono)
    {
        // Ajusta el patr�n seg�n tus requisitos. Este patr�n acepta n�meros de 10 d�gitos.
        string patron = @"^\d{9}$";
        return Regex.IsMatch(telefono, patron);
    }

    // Bot�n para Ver/Ocultar contrase�a
    private async void VerContrase�a(object sender, EventArgs e)
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
                btnregistrarse.IsEnabled = false;
            }
            else
            {
                btnregistrarse.IsEnabled = true;
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