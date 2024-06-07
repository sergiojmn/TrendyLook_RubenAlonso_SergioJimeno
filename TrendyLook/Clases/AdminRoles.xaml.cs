using TrendyLook.Clases;

namespace TrendyLook
{
    public partial class AdminRoles : ContentPage
    {
        public AdminRoles()
        {
            InitializeComponent();
        }

        #region Crear Cliente/Empleado

        // M�todo para registrar Cliente/Empleado mediante un Admin
        private async void RegistroAdmin(object sender, EventArgs e)
        {
            try
            {
                string email = entryemail.Text;
                string usuario = entryuserregister.Text;
                string contrasena = entrypasswordregister.Text;
                string telefono = entryphone.Text;
                string genero = ObtenerGeneroSeleccionado();
                int usertype = ObtenerUserTypeSeleccionado();

                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(contrasena) || string.IsNullOrEmpty(telefono) || string.IsNullOrEmpty(genero) || usertype == 0)
                {
                    await DisplayAlert("Error", "Todos los campos deben ser completados", "OK");
                    return;
                }

                if (!ValidarCorreoElectronico(email))
                {
                    await DisplayAlert("Error", "Debe insertar un correo electr�nico v�lido", "OK");
                    return;
                }

                if (!ValidarContrasena(contrasena))
                {
                    await DisplayAlert("Error", "La contrase�a no cumple con los requisitos m�nimos.\nDebe tener:\n- M�nimo 8 caracteres\n- Una letra may�scula\n- Un caracter especial (. , @ $ ...)", "OK");
                    return;
                }

                if (!ValidarTelefono(telefono))
                {
                    await DisplayAlert("Error", "Debe insertar un n�mero de tel�fono v�lido (ej. 612345789)", "OK");
                    return;
                }

                try
                {
                    bool registroExitoso = await AdminRolesHelper.RegistrarUsuarios(email, usuario, contrasena, telefono, usertype, genero);
                    if (registroExitoso)
                    {
                        await DisplayAlert("Registro exitoso", "Usuario registrado correctamente", "OK");
                        entryemail.Text = "";
                        entryuserregister.Text = "";
                        entrypasswordregister.Text = "";
                        entryphone.Text = "";
                    }
                    else
                    {
                        await DisplayAlert("Error", "No se pudo completar el registro", "OK");
                    }
                }
                catch (Exception ex)
                {
                    await DisplayAlert("Error", "Ocurri� un error durante el registro", "OK");
                }
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para sacar el userType
        private int ObtenerUserTypeSeleccionado()
        {
            if (rolesPicker.SelectedIndex == -1)
            {
                return 0;
            }

            string selectedRole = rolesPicker.SelectedItem.ToString();
            if (selectedRole == "Empleado") return 2;
            else if (selectedRole == "Administrador") return 1;
            else return 0;
        }

        // M�todo para obtener el g�nero seleccionado
        private string ObtenerGeneroSeleccionado()
        {
            if (rbHombre.IsChecked) return "Hombre";
            else if (rbMujer.IsChecked) return "Mujer";
            else if (rbOtro.IsChecked) return "Otro";
            else return string.Empty;
        }

        // M�todo para poder ver la contrase�a
        private void VerContrase�a(object sender, EventArgs e)
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
                DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para validar el correo
        private bool ValidarCorreoElectronico(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch (Exception)
            {
                DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
                return false;
            }
        }

        // M�todo para validar la contrase�a
        private bool ValidarContrasena(string contrasena)
        {
            if (contrasena.Length < 8) return false;
            if (!contrasena.Any(char.IsUpper)) return false;
            if (!contrasena.Any(char.IsSymbol) && !contrasena.Any(char.IsPunctuation)) return false;
            return true;
        }

        // M�todo para validar el tel�fono
        private bool ValidarTelefono(string telefono)
        {
            return telefono.Length == 9 && telefono.All(char.IsDigit);
        }

        #endregion

        #region Comprobar conexi�n a la red

        // M�todo para comprobar la conexi�n a la red
        private async void ComprobarConexion()
        {
            try
            {
                if (Microsoft.Maui.Networking.Connectivity.NetworkAccess != Microsoft.Maui.Networking.NetworkAccess.Internet)
                {
                    btnRegistrosAdmin.IsEnabled = false;
                }
                else
                {
                    btnRegistrosAdmin.IsEnabled = true;
                }
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para verificar la conexi�n a internet cuando cambia la conectividad
        private async void CambioDeRed(object sender, Microsoft.Maui.Networking.ConnectivityChangedEventArgs e)
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
}