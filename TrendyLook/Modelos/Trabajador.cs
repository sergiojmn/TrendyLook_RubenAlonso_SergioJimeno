namespace TrendyLook.Modelos;

public partial class Trabajador
{
    #region Propiedades

    public int IdEmpleado { get; set; }

    public string Nombre { get; set; } = null!;

    public string Contraseña { get; set; } = null!;

    public string Rango { get; set; } = null!;

    public int UsuariosIdUsuario { get; set; }

    public int CitaIdFecha { get; set; }

    public int CitaUsuariosIdUsuario { get; set; }

    #endregion
}