using Microsoft.Data.SqlClient;
using TrendyLook.Modelos;

namespace TrendyLook;

public partial class Citas : ContentPage
{
    #region Propiedades

    private TimeOnly horaSeleccionada;
    private Tratamiento tratamientoSeleccionado;

    public DateTime Today { get; set; }

    #endregion

    public Citas()
    {
        InitializeComponent();

        // Verificar la conexión a internet al iniciar la aplicación
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;

        Today = DateTime.Now.Date;

        collectionView.ItemsSource = GetTratamientos();

        // Acciones para mostrar al pulsar
        collectionView.SelectionChanged += MostrarCalendario;
        horas1.CheckedChanged += ComprobarCheckRadioButton;
        horas2.CheckedChanged += ComprobarCheckRadioButton;
        horas3.CheckedChanged += ComprobarCheckRadioButton;
        horas4.CheckedChanged += ComprobarCheckRadioButton;
        horas5.CheckedChanged += ComprobarCheckRadioButton;
        horas6.CheckedChanged += ComprobarCheckRadioButton;
        horas7.CheckedChanged += ComprobarCheckRadioButton;
        horas8.CheckedChanged += ComprobarCheckRadioButton;

        // Día mínimo que se puede seleccionar
        calendario.MinimumDate = DateTime.Now.Date;
    }

    #region Lista tratamientos

    // Lista de los tratamientos
    private List<Tratamiento> GetTratamientos()
    {
        return new List<Tratamiento>
        {
            new Tratamiento {Imagen="maderoterapia.png" ,Nombre="Maderoterapia" ,Descripcion="¿QUÉ ES LA MADEROTERAPIA?\r\n\r\nEs una terapia natural que consiste en estimular el cuerpo mediante una técnica de masaje con utensilios de madera. Mediante movimientos y presión en puntos del cuerpo se busca una reacción de bienestar, reducir los niveles de estrés, y aliviar los dolores musculares y articulares.\r\n\r\nAunque se trata de una técnica holística, usado en la medicina oriental, ahora, tiene fines estéticos para combatir la CELULITIS, REAFIRMAR Y TONIFICAR el cuerpo.\r\n\r\nAPLICACIONES DE LA MADEROTERAPIA\r\nMADEROTERAPIA CORPORAL Y ANTICELULÍTICA, se aplica con finalidades estéticas para modelar la figura, pero también se puede realizar como técnica de relajación para reducir el nivel de estrés del paciente. Además, también se usa con el objetivo de tratar contracturas musculares o articulares. Tiene el objetivo de eliminar la grasa acumulada en zonas como el abdomen, muslos y caderas. De esta manera, permite eliminar la retención de líquidos y moldear y reafirmar dicha zona. \r\n\r\nLa madera es un material que se considera beneficioso para la salud. Tiene efectos reafirmantes y tonificantes. Además, activa la circulación sanguínea y linfática del rostro por lo que ayuda a mejorar el aspecto de la piel. También activa la producción de colágeno y elastina y puede actuar sobre los músculos del cuerpo (piernas completas, abdomen, espalda, brazos)" ,Componentes="Componentes\r\n- Rodillo curvo.\r\n- Rodillo estriado.\r\n- Rodillo de cubos.\r\n- Tabla moldeadora dentada.\r\n- Copa sueca pequeña.\r\n- Copa sueca grande.\r\n- Champiñón grande." ,Duracion="Duración: 1 hora" ,Precio="Precio: 185€"},
            new Tratamiento {Imagen="presoterapia.png" ,Nombre="Presoterapia" ,Descripcion="La presoterapia es un tratamiento que nos ayuda al hacer drenaje linfático, activación del sistema circulatorio-sanguíneo, alivio de piernas cansadas, apto para embarazadas siempre que el médico lo autorice." ,Componentes="Componentes\r\n- Unidad electrónica con compresor de aire\r\n- Tubos o mangueras\r\n- Traje, peto o pantalones de presoterapia, con cápsulas o celdas" ,Duracion="Duración: 55 minutos" ,Precio="Precio: 65€"},
            new Tratamiento {Imagen="prime.png" ,Nombre="Accent Prime Corporal" ,Descripcion="Trabaja a nivel superficial, medio y profundo, siempre tras un diagnóstico personalizado. Combina ondas ultrasónicas, que llegan a todas las células grasas persistentes para acabar con grasa localizada y celulitis, y radiofrecuencia, para tonificar y estimular la producción de colágeno y elastina para tensar la piel." ,Componentes="Componentes\r\n- Equipo de ondas ultrasonido\r\n- Plataforma láser" ,Duracion="Duración: 1 hora", Precio="Precio: 275€"},
            new Tratamiento {Imagen="masaje.png" ,Nombre="Masajes adelgazante" ,Descripcion="Es un protocolo reductor con técnicas manuales que combina las reglas básicas de la Fisioterapia, la Fisioterapia Estética y la Medicina Tradicional China. Se realiza sin el uso de productos cosméticos ni aparatología." ,Componentes="Componentes\r\n- No hay componentes más allá de las propias manos del profesional" ,Duracion="Duración: 1 hora", Precio="Precio: 150€"},
            new Tratamiento {Imagen="alidya.png" ,Nombre="Alidya" ,Descripcion="A nivel Linfático: Alidya es un antioxidante con efecto de rejuvenecimiento, que ayuda al drenaje del hierro y la eliminación de las toxinas contenidas en la celulitis. A nivel Celular: Alidya, actúa a nivel celular sobre el tejido adiposo, y estimula la liberación de su contenido en grasa." ,Componentes="Componentes\r\n- Mezcla de aminoácidos\r\n- Un quelante de hierro\r\n- Alcalinizantes\r\n- Vitamina C" ,Duracion="Duración: 50 minutos", Precio="Precio: 100€"},
            new Tratamiento {Imagen="bios.png" ,Nombre="Bioslimming" ,Descripcion="Con Bioslimming REDUCE, REAFIRMA y REMODELA desde la primera sesión." ,Componentes="Componentes\r\n- Envolturas para la piel\r\n- 3 cremas diferentes\r\n- Té" ,Duracion="Duración: 45 minutos", Precio="Precio: 180€"}
        };
    }

    #endregion

    #region Comprobar conexión a la red

    // Método para comprobar la conexión a la red
    private async void ComprobarConexion()
    {
        try
        {
            if (Connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                calendario.IsEnabled = false;
                btnCrearCita.IsEnabled = false;
            }
            else
            {
                calendario.IsEnabled = true;
                btnCrearCita.IsEnabled = true;
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    // Método para verificar la conexión a internet cuando cambia la conectividad
    private async void CambioDeRed(object sender, ConnectivityChangedEventArgs e)
    {
        try
        {
            ComprobarConexion();
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    #endregion

    #region Crear Citas

    // Método para crear citas en la BBDD
    private void CrearCitas(object sender, EventArgs e)
    {
        try
        {
            DateTime fechaSeleccionada = calendario.Date;
            TimeSpan horaSeleccionadaTimeSpan = horaSeleccionada.ToTimeSpan();

            // Obtener el último iddate y sumarle 1
            int nuevoIdDate;
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                SqlCommand getMaxIdCmd = new SqlCommand("SELECT MAX(Iddate) FROM Cita", conn);
                object maxIdObj = getMaxIdCmd.ExecuteScalar();
                if (maxIdObj != DBNull.Value)
                {
                    nuevoIdDate = (int)maxIdObj + 1;
                }
                else
                {
                    nuevoIdDate = 1;
                }
            }

            // Crear una nueva instancia de conexión
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                // Obtener el id del usuario de las preferencias
                int idUsuario = Xamarin.Essentials.Preferences.Get("UserId", 0);

                // Crear un nuevo comando SQL
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO Cita (Iddate, Description, Date, Hour, State, usuarios_iduser, trabajador_idworker, trabajador_usuarios_iduser, trabajador_cita_iddate, trabajador_cita_usuarios_iduser) VALUES (@Iddate, @Description, @Date, @Hour, @State, @UsuariosIduser, @TrabajadorIdworker, @TrabajadorUsuariosIduser, @TrabajadorCitaIddate, @TrabajadorCitaUsuariosIduser)";
                cmd.Parameters.AddWithValue("@Iddate", nuevoIdDate);
                cmd.Parameters.AddWithValue("@Description", tratamientoSeleccionado?.Nombre ?? "Descripción de la nueva cita");
                cmd.Parameters.AddWithValue("@Date", fechaSeleccionada);
                cmd.Parameters.AddWithValue("@Hour", horaSeleccionadaTimeSpan);
                cmd.Parameters.AddWithValue("@State", 1);
                cmd.Parameters.AddWithValue("@UsuariosIduser", idUsuario); // Usar el idUsuario obtenido de las preferencias
                cmd.Parameters.AddWithValue("@TrabajadorIdworker", 1);
                cmd.Parameters.AddWithValue("@TrabajadorUsuariosIduser", 1);
                cmd.Parameters.AddWithValue("@TrabajadorCitaIddate", 1);
                cmd.Parameters.AddWithValue("@TrabajadorCitaUsuariosIduser", 1);

                // Ejecutar el comando
                int rowsAffected = cmd.ExecuteNonQuery();

                DisplayAlert("", "Cita creada con éxito.", "OK");
            }

            // reiniciar la ventana
            RestablecerEstado();
        }
        catch (Exception)
        {
            DisplayAlert("Error", "Error al intentar crear la cita.", "OK");
        }
    }

    // Método para verificar si ya existe una cita en la misma fecha y hora
    private async Task<bool> ExisteCitaEnFechaHoraAsync(DateTime fecha, TimeSpan hora)
    {
        bool existeCita = false;

        try
        {
            using (SqlConnection conexion = DatabaseConnection.GetConnection())
            {
                SqlCommand comando = new SqlCommand("VerificarCredenciales", conexion);
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }


        return existeCita;
    }

    // Método para elegir la hora
    private async void ElegirHora(object sender, DateChangedEventArgs e)
    {
        try
        {
            fecha.IsVisible = true;
            horas1.IsVisible = true;
            horas2.IsVisible = true;
            horas3.IsVisible = true;
            horas4.IsVisible = true;
            horas5.IsVisible = true;
            horas6.IsVisible = true;
            horas7.IsVisible = true;
            horas8.IsVisible = true;
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    private void calendario_DateSelected(object sender, DateChangedEventArgs e)
    {
        try
        {
            // Your logic to handle the date selection event
            fecha.IsVisible = true;
            horas1.IsVisible = true;
            horas2.IsVisible = true;
            horas3.IsVisible = true;
            horas4.IsVisible = true;
            horas5.IsVisible = true;
            horas6.IsVisible = true;
            horas7.IsVisible = true;
            horas8.IsVisible = true;
        }
        catch (Exception)
        {
            DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }


    // Método para mostrar el calendario al pulsar un tratamiento
    private async void MostrarCalendario(object sender, SelectionChangedEventArgs e)
    {
        try
        {
            if (collectionView.SelectedItem != null)
            {
                tratamientoSeleccionado = (Tratamiento)collectionView.SelectedItem;
                calendarioStackLayout.IsVisible = true;
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    // Método para detectar el radioButton seleccionado
    private async void ComprobarCheckRadioButton(object sender, CheckedChangedEventArgs e)
    {
        try
        {
            if (sender is RadioButton radioButton && e.Value)
            {
                string horaContent = radioButton.Content.ToString();
                if (TimeOnly.TryParse(horaContent, out TimeOnly hora))
                {
                    horaSeleccionada = hora;
                }
                botones.IsVisible = true;
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    #endregion

    #region Reiniciar estado página

    // Método para restablecer a 0 la página Citas
    public async void RestablecerEstado()
    {
        try
        {
            // Desmarcar el tratamiento seleccionado
            collectionView.SelectedItem = null;

            // Ocultar el calendario y las horas
            calendarioStackLayout.IsVisible = false;
            fecha.IsVisible = false;
            horas1.IsVisible = false;
            horas2.IsVisible = false;
            horas3.IsVisible = false;
            horas4.IsVisible = false;
            horas5.IsVisible = false;
            horas6.IsVisible = false;
            horas7.IsVisible = false;
            horas8.IsVisible = false;

            // Restablecer la selección de fecha en el calendario
            calendario.Date = DateTime.Now.Date;

            // Restablecer el radio button seleccionado
            horas1.IsChecked = false;
            horas2.IsChecked = false;
            horas3.IsChecked = false;
            horas4.IsChecked = false;
            horas5.IsChecked = false;
            horas6.IsChecked = false;
            horas7.IsChecked = false;
            horas8.IsChecked = false;

            // Ocultar el botón de crear cita
            botones.IsVisible = false;

            // Restablecer las variables de selección
            tratamientoSeleccionado = null;
            horaSeleccionada = default;

            collectionView.ItemsSource = GetTratamientos();
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    #endregion
}