namespace TrendyLook.Modelos;

public partial class Calendario
{
    #region Propiedades

    public int Idcalendar { get; set; }

    public DateOnly Date { get; set; }

    public TimeOnly Hour { get; set; }

    public string Disponibility { get; set; } = null!;

    public int CitaIddate { get; set; }

    public int Iduser { get; set; }

    #endregion
}