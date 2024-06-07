
namespace TrendyLook
{
    public static class UsuarioSesion
    {
        private static int idUsuario;

        public static string UserType { get; set; }


        public static void SetIdUsuario(int id)
        {
            idUsuario = id;
        }

        public static int GetIdUsuario()
        {
            return idUsuario;
        }

        public static void ResetIdUsuario()
        {
            idUsuario = 0;
        }
    }

}