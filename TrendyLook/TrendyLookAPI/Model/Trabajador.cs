namespace TrendyLook.Model;

public partial class Trabajador
{
    public int Idworker { get; set; }

    public string Name { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string Range { get; set; } = null!;

    public int UsuariosIduser { get; set; }

    public int CitaIddate { get; set; }

    public int CitaUsuariosIduser { get; set; }
}