using Microsoft.Data.SqlClient;
using System.Text.RegularExpressions;

namespace TrendyLook.Clases
{
    public static class AdminRolesHelper
    {
        #region Ayuda a la hora de crear Cliente/Empleado mediante Admin

        // Ayuda para registrar usuarios
        public static async Task<bool> RegistrarUsuarios(string email, string usuario, string contrasena, string telefono, int usertype, string genero)
        {
            try
            {
                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(contrasena) ||
                string.IsNullOrEmpty(telefono) || string.IsNullOrEmpty(genero))
                {
                    throw new ArgumentException("Debe rellenar todos los campos");
                }

                if (!ValidarCorreoElectronico(email))
                {
                    throw new ArgumentException("Debe insertar un correo electrónico válido");
                }

                if (!ValidarContrasena(contrasena))
                {
                    throw new ArgumentException("La contraseña no cumple con los requisitos mínimos.\nDebe tener:\n- Mínimo 8 caracteres\n- Una letra mayúscula\n- Un caracter especial (. , @ $ ...)");
                }

                if (!ValidarTelefono(telefono))
                {
                    throw new ArgumentException("Debe insertar un número de teléfono válido (ej. 612345789)");
                }

                if (await CorreoYaRegistrado(email))
                {
                    throw new ArgumentException("El correo electrónico ya está registrado");
                }

                try
                {
                    using (SqlConnection conexion = DatabaseConnection.GetConnection())
                    {
                        string consulta = "INSERT INTO usuarios (iduser, mail, name, password, usertype, genero, phone) VALUES (@iduser, @correo, @usuario, @contrasena, @usertype, @genero, @telefono)";
                        SqlCommand comando = new SqlCommand(consulta, conexion);
                        comando.Parameters.AddWithValue("@iduser", GenerarIdUsuario());
                        comando.Parameters.AddWithValue("@correo", email);
                        comando.Parameters.AddWithValue("@usuario", usuario);
                        comando.Parameters.AddWithValue("@contrasena", contrasena);
                        comando.Parameters.AddWithValue("@usertype", usertype);
                        comando.Parameters.AddWithValue("@genero", genero);
                        comando.Parameters.AddWithValue("@telefono", telefono);

                        int filasAfectadas = comando.ExecuteNonQuery();
                        return filasAfectadas > 0;
                    }
                }
                catch (Exception)
                {
                    throw new Exception("Ha ocurrido un error, intentelo de nuevo.");
                }
            }
            catch (Exception)
            {
                throw new Exception("Ha ocurrido un error, intentelo de nuevo.");
            }
        }

        // Método para comprobar si el correo ya está registrado
        private static async Task<bool> CorreoYaRegistrado(string email)
        {
            try
            {
                using (SqlConnection conexion = DatabaseConnection.GetConnection())
                {
                    string consulta = "SELECT COUNT(*) FROM usuarios WHERE mail = @correo";
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@correo", email);

                    int count = (int)await comando.ExecuteScalarAsync();
                    return count > 0;
                }
            }
            catch (Exception)
            {
                throw new Exception("Ha ocurrido un error, intentelo de nuevo.");
            }
        }

        // Método para generar IdUsuario
        private static int GenerarIdUsuario()
        {
            try
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
            catch (Exception)
            {
                throw new Exception("Ha ocurrido un error, intentelo de nuevo.");
            }
        }

        // Método para validar el correo
        private static bool ValidarCorreoElectronico(string email)
        {
            string patron = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, patron);
        }

        // Método para validar la contraseña
        private static bool ValidarContrasena(string contrasena)
        {
            string patron = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$";
            return Regex.IsMatch(contrasena, patron);
        }

        // Método para validar el telefono
        private static bool ValidarTelefono(string telefono)
        {
            string patron = @"^\d{9}$";
            return Regex.IsMatch(telefono, patron);
        }

        #endregion
    }
}