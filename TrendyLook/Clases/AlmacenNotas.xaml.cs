namespace TrendyLook;

public partial class AlmacenNotas : ContentPage
{
    public AlmacenNotas()
    {
        InitializeComponent();

        BindingContext = new Modelos.AlmacenandoNotas();
    }

    // Cargar las notas
    protected override void OnAppearing()
    {
        ((Modelos.AlmacenandoNotas)BindingContext).CargarNotas();
    }

    // Botón para añadir una nota
    private async void AgregarNota(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync(nameof(BlocNotas));
    }

    // Método para lograr seleccionar una u otra nota
    private async void SeleccionarNota(object sender, SelectionChangedEventArgs e)
    {
        if (e.CurrentSelection.Count != 0)
        {
            // Obtener el modelo de nota.
            var nota = (Modelos.Nota)e.CurrentSelection[0];

            await Shell.Current.GoToAsync($"{nameof(BlocNotas)}?{nameof(BlocNotas.ItemId)}={nota.Filename}");

            // Deseleccionar la interfaz de usuario.
            notasCollection.SelectedItem = null;
        }
    }
}