namespace TrendyLook.Modelos;

public partial class Citum
{
    public int Iddate { get; set; }

    public string Description { get; set; } = null!;

    public DateOnly Date { get; set; }

    public TimeOnly Hour { get; set; }

    public string State { get; set; }

    public int UsuariosIduser { get; set; }

    public int TrabajadorIdworker { get; set; }

    public int TrabajadorUsuariosIduser { get; set; }

    public int TrabajadorCitaIddate { get; set; }

    public int TrabajadorCitaUsuariosIduser { get; set; }
}