namespace TrendyLook.Modelos;

public partial class Usuario
{
    public int Iduser { get; set; }

    public string Name { get; set; } = null!;

    public string Mail { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int Usertype { get; set; }

    public string? Genero { get; set; }
}