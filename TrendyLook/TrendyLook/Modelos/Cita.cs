namespace TrendyLook.Modelos;

public partial class Cita
{
    #region Propiedades

    public int IdFecha { get; set; }

    public string Description { get; set; } = null!;

    public DateOnly Fecha { get; set; }

    public TimeOnly Hora { get; set; }

    public int Estado { get; set; }

    #endregion
}