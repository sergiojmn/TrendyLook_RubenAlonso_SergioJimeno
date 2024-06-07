namespace TrendyLook;

[QueryProperty(nameof(ItemId), nameof(ItemId))]
public partial class BlocNotas : ContentPage
{
    // Propiedad para almacenar el ID del ítem
    public string ItemId
    {
        // Al asignarle un valor, carga la nota correspondiente
        set { CargarNota(value); }
    }

    public BlocNotas()
    {
        InitializeComponent();

        // Verificar la conexión a internet al iniciar la aplicación
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;

        // Obtiene la ruta del directorio de datos de la aplicación
        string ruta = FileSystem.AppDataDirectory;

        // Genera un nombre de archivo aleatorio para una nueva nota
        string nombreAleatorio = $"{Path.GetRandomFileName()}.notes.txt";

        // Carga la nota (nueva o existente)
        CargarNota(Path.Combine(ruta, nombreAleatorio));
    }

    // Botón para guardar el bloc de notas
    private async void GuardarNota(object sender, EventArgs e)
    {
        if (BindingContext is Modelos.Nota nota)
            File.WriteAllText(nota.Filename, TextEditor.Text);

        await Shell.Current.GoToAsync("..");
    }

    // Botón para borrar el bloc de notas
    private async void BorrarNota(object sender, EventArgs e)
    {
        if (BindingContext is Modelos.Nota nota)
        {
            // Eliminar el archivo.
            if (File.Exists(nota.Filename))
                File.Delete(nota.Filename);
        }

        await Shell.Current.GoToAsync("..");
    }

    // Cargar la nota al seleccionarla
    private void CargarNota(string nombreArchivo)
    {
        Modelos.Nota notaModelos = new Modelos.Nota();
        notaModelos.Filename = nombreArchivo;

        if (File.Exists(nombreArchivo))
        {
            notaModelos.Date = File.GetCreationTime(nombreArchivo);
            notaModelos.Text = File.ReadAllText(nombreArchivo);
        }

        BindingContext = notaModelos;
    }

    // Método para comprobar la conexión a la red
    private async void ComprobarConexion()
    {
        if (Connectivity.NetworkAccess != NetworkAccess.Internet)
        {
            btnBorrar.IsEnabled = false;
            btnGuardar.IsEnabled = false;
        }
        else
        {
            btnBorrar.IsEnabled = true;
            btnGuardar.IsEnabled = true;
        }
    }

    // Método para verificar la conexión a internet cuando cambia la conectividad
    private void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
    {
        ComprobarConexion();
    }
}