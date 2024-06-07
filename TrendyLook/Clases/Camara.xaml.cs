namespace TrendyLook;

public partial class Camara : ContentPage
{
    private readonly IMediaPicker mediaPicker;

    public Camara(IMediaPicker mediaPicker)
    {
        InitializeComponent();

        // Verificar la conexi�n a internet al iniciar la aplicaci�n
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;

        this.mediaPicker = mediaPicker;
    }
    
    #region Funcionamiento Fotos

    // M�todo para realizar fotos dentro de la App
    private async void HacerFoto(object sender, EventArgs e)
    {
        try
        {
            if (mediaPicker.IsCaptureSupported)
            {
                FileResult foto = await mediaPicker.CapturePhotoAsync();

                if (foto != null)
                {
                    // Guarda el archivo en el almacenamiento local
                    string rutaLocal = Path.Combine(FileSystem.AppDataDirectory, foto.FileName);

                    using Stream origen = await foto.OpenReadAsync();
                    using FileStream origenLocal = File.OpenWrite(rutaLocal);

                    await origen.CopyToAsync(origenLocal);

                    // Mostrar en el recuadro de abajo
                    var memoria = await foto.OpenReadAsync();
                    imgFoto.Source = ImageSource.FromStream(() => memoria);
                }
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Permisos denegados", "Aceptar");
        }
    }

    // M�todo para ver fotos dentro de la App
    private async void VerFoto(object sender, EventArgs e)
    {
        try
        {
            var foto = await MediaPicker.PickPhotoAsync();

            if (foto != null)
            {
                // Mostrar en el recuadro de abajo
                var memoria = await foto.OpenReadAsync();
                imgFoto.Source = ImageSource.FromStream(() => memoria);
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Acceso denegado", "Error al intentar acceder a la galer�a", "Aceptar");
        }
    }

    // M�todo para comprobar la conexi�n a la red
    private async void ComprobarConexion()
    {
        if (Connectivity.NetworkAccess != NetworkAccess.Internet)
        {
            btnHacerFoto.IsEnabled = false;
            btnVerFoto.IsEnabled = false;
        }
        else
        {
            btnHacerFoto.IsEnabled = true;
            btnVerFoto.IsEnabled = true;
        }
    }

    // M�todo para verificar la conexi�n a internet cuando cambia la conectividad
    private void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
    {
        ComprobarConexion();
    }

    #endregion
}