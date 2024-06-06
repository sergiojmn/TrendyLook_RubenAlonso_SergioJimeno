namespace TrendyLook
{
    [QueryProperty(nameof(ItemId), nameof(ItemId))]
    public partial class BlocNotas : ContentPage
    {
        #region Propiedades

        // Propiedad para almacenar el ID
        public string ItemId
        {
            // Al asignarle un valor, carga la nota que corresponde
            set { CargarNota(value); }
        }

        #endregion

        public BlocNotas()
        {
            InitializeComponent();

            // Verificar la conexi�n a internet al iniciar la aplicaci�n
            ComprobarConexion();
            Connectivity.ConnectivityChanged += CambioDeRed;

            ConfigurarManejoEventoTextChanged();

            // Obtiene la ruta del directorio de datos de la aplicaci�n
            string ruta = FileSystem.AppDataDirectory;

            // Genera un nombre de archivo aleatorio para una nueva nota
            string nombreAleatorio = $"{Path.GetRandomFileName()}.notes.txt";

            // Carga la nota (nueva o existente)
            CargarNota(Path.Combine(ruta, nombreAleatorio));
        }

        #region Funcionamiento Bloc de Notas

        // Bot�n para guardar el bloc de notas
        private async void GuardarNota(object sender, EventArgs e)
        {
            try
            {
                if (BindingContext is Modelos.Nota nota)
                    File.WriteAllText(nota.NombreArchivo, TextEditor.Text);

                await Shell.Current.GoToAsync("..");
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // Bot�n para borrar el bloc de notas
        private async void BorrarNota(object sender, EventArgs e)
        {
            try
            {
                if (BindingContext is Modelos.Nota nota)
                {
                    // Eliminar el archivo.
                    if (File.Exists(nota.NombreArchivo))
                        File.Delete(nota.NombreArchivo);
                }

                await Shell.Current.GoToAsync("..");
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // Cargar la nota al seleccionarla
        private async void CargarNota(string nombreArchivo)
        {
            try
            {
                Modelos.Nota notaModelos = new Modelos.Nota();
                notaModelos.NombreArchivo = nombreArchivo;

                if (File.Exists(nombreArchivo))
                {
                    notaModelos.Fecha = File.GetCreationTime(nombreArchivo);
                    notaModelos.Texto = File.ReadAllText(nombreArchivo);
                }

                BindingContext = notaModelos;
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para comprobar la conexi�n a la red
        private async void ComprobarConexion()
        {
            try
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
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para verificar la conexi�n a internet cuando cambia la conectividad
        private async void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
        {
            try
            {
                ComprobarConexion();
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para verificar si el texto contiene al menos un car�cter alfanum�rico
        private bool ContieneCaracterAlfanumerico(string texto)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(texto))
                    return false;

                foreach (char c in texto)
                {
                    if (char.IsLetterOrDigit(c))
                        return true;
                }
            }
            catch (Exception)
            {

                 DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
            return false;
        }

        // Manejador del evento TextChanged del bloc de notas para actualizar el estado del bot�n "Guardar"
        private async void BlocNotas_TextChanged(object sender, EventArgs e)
        {
            try
            {
                // Obtener el contenido actual del bloc de notas
                string contenido = TextEditor.Text;

                // Verificar si el contenido contiene al menos un car�cter alfanum�rico
                bool contieneCaracterAlfanumerico = ContieneCaracterAlfanumerico(contenido);

                // Actualizar el estado del bot�n "Guardar" basado en si el contenido contiene al menos un car�cter alfanum�rico
                btnGuardar.IsEnabled = contieneCaracterAlfanumerico && !string.IsNullOrWhiteSpace(contenido);
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para el manejo del evento TextChanged
        private async void ConfigurarManejoEventoTextChanged()
        {
            try
            {
                // Asociar el manejador de eventos TextChanged al bloc de notas
                TextEditor.TextChanged += BlocNotas_TextChanged;

                // Configurar el estado inicial del bot�n "Guardar"
                btnGuardar.IsEnabled = false;
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        #endregion
    }
}