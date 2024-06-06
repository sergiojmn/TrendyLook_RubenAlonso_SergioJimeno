using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace TrendyLookAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UsuariosController : ControllerBase
    {
        [HttpPost("login")]
        public async Task<IActionResult> VerificarCredenciales([FromBody] LoginRequest request)
        {
            using (SqlConnection conexion = DatabaseConnection.GetConnection())
            {
                string consulta = "SELECT COUNT(*) FROM usuarios WHERE name = @username AND password = @password";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@username", request.Username);
                comando.Parameters.AddWithValue("@password", request.Password);

                int cuenta = (int)await comando.ExecuteScalarAsync();

                if (cuenta > 0)
                {
                    return Ok(new { Success = true, Message = "Credenciales válidas" });
                }
                else
                {
                    return Unauthorized(new { Success = false, Message = "Credenciales inválidas" });
                }
            }
        }

        public class LoginRequest
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }
    }
}
