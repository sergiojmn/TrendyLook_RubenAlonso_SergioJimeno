namespace TrendyLook.Modelos;

internal class Nota
{
    #region Propiedades

    public string NombreArchivo { get; set; }

    public string Texto { get; set; }

    public string Titulo => CogerTitulo(Texto);

    public DateTime Fecha { get; set; }

    #endregion

    #region Obtener títulos

    // Método para sacar la primera palabra como título
    private string CogerTitulo(string texto)
    {
        if (string.IsNullOrWhiteSpace(texto))
            return string.Empty;

        // Buscar el primer carácter alfanumérico en el texto
        foreach (char c in texto)
        {
            if (char.IsLetterOrDigit(c))
            {
                // Si se encuentra un carácter alfanumérico, devolver el texto desde aquí hasta el próximo espacio en blanco o el final del texto
                int startIndex = texto.IndexOf(c);
                int endIndex = texto.IndexOfAny(new char[] { ' ', '\t', '\r', '\n' }, startIndex);
                if (endIndex == -1)
                    return texto.Substring(startIndex);
                else
                    return texto.Substring(startIndex, endIndex - startIndex);
            }
        }

        // Si no se encuentra ningún carácter alfanumérico, devolver cadena vacía
        return string.Empty;
    }

    #endregion
}