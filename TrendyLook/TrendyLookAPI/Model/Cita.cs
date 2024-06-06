namespace TrendyLook.Model;

public partial class Cita
{
    public int Iddate { get; set; }

    public string Description { get; set; } = null!;

    public DateOnly Date { get; set; }

    public TimeOnly Hour { get; set; }

    public int State { get; set; }
}