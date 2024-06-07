using System.Collections.ObjectModel;

namespace TrendyLook.Modelos;

internal class AlmacenandoNotas
{
    public ObservableCollection<Nota> Notes { get; set; } = new ObservableCollection<Nota>();

    public AlmacenandoNotas() =>
        CargarNotas();

    // Método para cargar las notas
    public void CargarNotas()
    {
        Notes.Clear();

        //Obtiene la carpeta donde se almacenan las notas.
        string ruta = FileSystem.AppDataDirectory;

        // Utilice extensiones Linq para cargar los archivos "*.notes.txt".
        IEnumerable<Nota> notas = Directory

                                    //Seleccionamos los nombres de los archivos del directorio.
                                    .EnumerateFiles(ruta, "*.notes.txt")

                                    // Cada nombre de archivo se utiliza para crear una nueva nota.
                                    .Select(nombreArchivo => new Nota()
                                    {
                                        Filename = nombreArchivo,
                                        Text = File.ReadAllText(nombreArchivo),
                                        Date = File.GetLastWriteTime(nombreArchivo)
                                    })

                                    // Con la colección final de notas, ordenarlas por fecha.
                                    .OrderBy(nota => nota.Date);

        // Agrega cada nota a ObservableCollection
        foreach (Nota nota in notas)
            Notes.Add(nota);
    }
}