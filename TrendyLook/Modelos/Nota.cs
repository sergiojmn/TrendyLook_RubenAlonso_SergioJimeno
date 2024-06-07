namespace TrendyLook.Modelos;

internal class Nota
{ // Clase Objeto
    public string Filename { get; set; }

    public string Text { get; set; }

    public string Title => CogerTitulo(Text);

    public DateTime Date { get; set; }


    // Método para sacar la primera palabra como título
    private string CogerTitulo(string texto)
    {
        if (string.IsNullOrWhiteSpace(texto))
            return string.Empty;

        string espaciarTexto = texto.TrimStart();
        string[] palabras = espaciarTexto.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
        if (palabras.Length > 0)
            return palabras[0];
        else
            return string.Empty;
    }
}