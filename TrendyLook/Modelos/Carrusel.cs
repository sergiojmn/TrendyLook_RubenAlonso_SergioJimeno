namespace TrendyLook.Modelos
{
    internal class Carrusel
    {
        #region Propiedades

        public required string Titulo { get; set; }

        public required string Imagen { get; set; }

        public required string Descripcion { get; set; }

        public required string Enlace { get; set; }

        public int AlturaCarrusel { get; internal set; }

        #endregion
    }
}