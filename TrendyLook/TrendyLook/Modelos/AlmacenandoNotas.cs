using System.Collections.ObjectModel;

namespace TrendyLook.Modelos;

internal class AlmacenandoNotas
{
    #region Propiedades

    public ObservableCollection<Nota> Notes { get; set; } = new ObservableCollection<Nota>();

    #endregion

    public AlmacenandoNotas() =>
        CargarNotas();

    #region Cargar notas creadas

    // Método para cargar las notas
    public void CargarNotas()
    {
        Notes.Clear();

        //Obtiene la carpeta donde se almacenan las notas.
        string ruta = FileSystem.AppDataDirectory;

        // Extensiones Linq para cargar los archivos "*.notes.txt".
        IEnumerable<Nota> notas = Directory

                                    //Seleccionamos los nombres de los archivos del directorio.
                                    .EnumerateFiles(ruta, "*.notes.txt")

                                    // Cada nombre de archivo se utiliza para crear una nueva nota.
                                    .Select(nombreArchivo => new Nota()
                                    {
                                        NombreArchivo = nombreArchivo,
                                        Texto = File.ReadAllText(nombreArchivo),
                                        Fecha = File.GetLastWriteTime(nombreArchivo)
                                    })

                                    // Ordenarlas por fecha.
                                    .OrderBy(nota => nota.Fecha);

        // Agrega cada nota a ObservableCollection
        foreach (Nota nota in notas)
            Notes.Add(nota);
    }

    #endregion
}