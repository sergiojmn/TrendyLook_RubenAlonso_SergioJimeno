namespace TrendyLook;

public partial class AlmacenNotas : ContentPage
{
    public AlmacenNotas()
    {
        InitializeComponent();

        BindingContext = new Modelos.AlmacenandoNotas();
    }

    #region Funcionamiento Notas

    // Cargar las notas
    protected async override void OnAppearing()
    {
        try
        {

/* Cambio no fusionado mediante combinación del proyecto 'TrendyLook (net8.0-ios)'
Antes:
            ((Modelos.AlmacenandoNotas)BindingContext).CargarNotas();
Después:
            ((AlmacenandoNotas)BindingContext).CargarNotas();
*/

/* Cambio no fusionado mediante combinación del proyecto 'TrendyLook (net8.0-ios)'
Antes:
            ((Model.AlmacenandoNotas)BindingContext).CargarNotas();
Después:
            ((AlmacenandoNotas)BindingContext).CargarNotas();
*/

/* Cambio no fusionado mediante combinación del proyecto 'TrendyLook (net8.0-ios)'
Antes:
            ((TrendyLook.res.AlmacenandoNotas)BindingContext).CargarNotas();
Después:
            ((AlmacenandoNotas)BindingContext).CargarNotas();
*/
            ((TrendyLook.Modelos.AlmacenandoNotas)BindingContext).CargarNotas();
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    // Botón para añadir una nota
    private async void AgregarNota(object sender, EventArgs e)
    {
        try
        {
            await Shell.Current.GoToAsync(nameof(BlocNotas));
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    // Método para lograr seleccionar una u otra nota
    private async void SeleccionarNota(object sender, SelectionChangedEventArgs e)
    {
        try
        {
            if (e.CurrentSelection.Count != 0)
            {
                // Obtener el modelo de nota.

/* Cambio no fusionado mediante combinación del proyecto 'TrendyLook (net8.0-ios)'
Antes:
                var nota = (Modelos.Nota)e.CurrentSelection[0];
Después:
                var nota = (Nota)e.CurrentSelection[0];
*/

/* Cambio no fusionado mediante combinación del proyecto 'TrendyLook (net8.0-ios)'
Antes:
                var nota = (Model.Nota)e.CurrentSelection[0];
Después:
                var nota = (Nota)e.CurrentSelection[0];
*/

/* Cambio no fusionado mediante combinación del proyecto 'TrendyLook (net8.0-ios)'
Antes:
                var nota = (res.Nota)e.CurrentSelection[0];
Después:
                var nota = (Nota)e.CurrentSelection[0];
*/
                var nota = (Modelos.Nota)e.CurrentSelection[0];

                await Shell.Current.GoToAsync($"{nameof(BlocNotas)}?{nameof(BlocNotas.ItemId)}={nota.NombreArchivo}");

                // Deseleccionar la interfaz de usuario.
                notasCollection.SelectedItem = null;
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    #endregion
}