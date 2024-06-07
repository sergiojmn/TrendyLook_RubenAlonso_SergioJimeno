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

        // Verificar la conexi�n a internet al iniciar la aplicaci�n
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

        // D�a m�nimo que se puede seleccionar
        calendario.MinimumDate = DateTime.Now.Date;
    }

    #region Lista tratamientos

    // Lista de los tratamientos
    private List<Tratamiento> GetTratamientos()
    {
        return new List<Tratamiento>
        {
            new Tratamiento {Imagen="maderoterapia.png" ,Nombre="Maderoterapia" ,Descripcion="�QU� ES LA MADEROTERAPIA?\r\n\r\nEs una terapia natural que consiste en estimular el cuerpo mediante una t�cnica de masaje con utensilios de madera. Mediante movimientos y presi�n en puntos del cuerpo se busca una reacci�n de bienestar, reducir los niveles de estr�s, y aliviar los dolores musculares y articulares.\r\n\r\nAunque se trata de una t�cnica hol�stica, usado en la medicina oriental, ahora, tiene fines est�ticos para combatir la CELULITIS, REAFIRMAR Y TONIFICAR el cuerpo.\r\n\r\nAPLICACIONES DE LA MADEROTERAPIA\r\nMADEROTERAPIA CORPORAL Y ANTICELUL�TICA, se aplica con finalidades est�ticas para modelar la figura, pero tambi�n se puede realizar como t�cnica de relajaci�n para reducir el nivel de estr�s del paciente. Adem�s, tambi�n se usa con el objetivo de tratar contracturas musculares o articulares. Tiene el objetivo de eliminar la grasa acumulada en zonas como el abdomen, muslos y caderas. De esta manera, permite eliminar la retenci�n de l�quidos y moldear y reafirmar dicha zona. \r\n\r\nLa madera es un material que se considera beneficioso para la salud. Tiene efectos reafirmantes y tonificantes. Adem�s, activa la circulaci�n sangu�nea y linf�tica del rostro por lo que ayuda a mejorar el aspecto de la piel. Tambi�n activa la producci�n de col�geno y elastina y puede actuar sobre los m�sculos del cuerpo (piernas completas, abdomen, espalda, brazos)" ,Componentes="Componentes\r\n- Rodillo curvo.\r\n- Rodillo estriado.\r\n- Rodillo de cubos.\r\n- Tabla moldeadora dentada.\r\n- Copa sueca peque�a.\r\n- Copa sueca grande.\r\n- Champi��n grande." ,Duracion="Duraci�n: 1 hora" ,Precio="Precio: 185�"},
            new Tratamiento {Imagen="presoterapia.png" ,Nombre="Presoterapia" ,Descripcion="La presoterapia es un tratamiento que nos ayuda al hacer drenaje linf�tico, activaci�n del sistema circulatorio-sangu�neo, alivio de piernas cansadas, apto para embarazadas siempre que el m�dico lo autorice." ,Componentes="Componentes\r\n- Unidad electr�nica con compresor de aire\r\n- Tubos o mangueras\r\n- Traje, peto o pantalones de presoterapia, con c�psulas o celdas" ,Duracion="Duraci�n: 55 minutos" ,Precio="Precio: 65�"},
            new Tratamiento {Imagen="prime.png" ,Nombre="Accent Prime Corporal" ,Descripcion="Trabaja a nivel superficial, medio y profundo, siempre tras un diagn�stico personalizado. Combina ondas ultras�nicas, que llegan a todas las c�lulas grasas persistentes para acabar con grasa localizada y celulitis, y radiofrecuencia, para tonificar y estimular la producci�n de col�geno y elastina para tensar la piel." ,Componentes="Componentes\r\n- Equipo de ondas ultrasonido\r\n- Plataforma l�ser" ,Duracion="Duraci�n: 1 hora", Precio="Precio: 275�"},
            new Tratamiento {Imagen="masaje.png" ,Nombre="Masajes adelgazante" ,Descripcion="Es un protocolo reductor con t�cnicas manuales que combina las reglas b�sicas de la Fisioterapia, la Fisioterapia Est�tica y la Medicina Tradicional China. Se realiza sin el uso de productos cosm�ticos ni aparatolog�a." ,Componentes="Componentes\r\n- No hay componentes m�s all� de las propias manos del profesional" ,Duracion="Duraci�n: 1 hora", Precio="Precio: 150�"},
            new Tratamiento {Imagen="alidya.png" ,Nombre="Alidya" ,Descripcion="A nivel Linf�tico: Alidya es un antioxidante con efecto de rejuvenecimiento, que ayuda al drenaje del hierro y la eliminaci�n de las toxinas contenidas en la celulitis. A nivel Celular: Alidya, act�a a nivel celular sobre el tejido adiposo, y estimula la liberaci�n de su contenido en grasa." ,Componentes="Componentes\r\n- Mezcla de amino�cidos\r\n- Un quelante de hierro\r\n- Alcalinizantes\r\n- Vitamina C" ,Duracion="Duraci�n: 50 minutos", Precio="Precio: 100�"},
            new Tratamiento {Imagen="bios.png" ,Nombre="Bioslimming" ,Descripcion="Con Bioslimming REDUCE, REAFIRMA y REMODELA desde la primera sesi�n." ,Componentes="Componentes\r\n- Envolturas para la piel\r\n- 3 cremas diferentes\r\n- T�" ,Duracion="Duraci�n: 45 minutos", Precio="Precio: 180�"}
        };
    }

    #endregion

    #region Comprobar conexi�n a la red

    // M�todo para comprobar la conexi�n a la red
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

    #endregion

    #region Crear Citas

    // M�todo para crear citas en la BBDD
    private void CrearCitas(object sender, EventArgs e)
    {
        try
        {
            DateTime fechaSeleccionada = calendario.Date;
            TimeSpan horaSeleccionadaTimeSpan = horaSeleccionada.ToTimeSpan();

            // Obtener el �ltimo iddate y sumarle 1
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

            // Crear una nueva instancia de conexi�n
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                // Obtener el id del usuario de las preferencias
                int idUsuario = Xamarin.Essentials.Preferences.Get("UserId", 0);

                // Crear un nuevo comando SQL
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO Cita (Iddate, Description, Date, Hour, State, usuarios_iduser, trabajador_idworker, trabajador_usuarios_iduser, trabajador_cita_iddate, trabajador_cita_usuarios_iduser) VALUES (@Iddate, @Description, @Date, @Hour, @State, @UsuariosIduser, @TrabajadorIdworker, @TrabajadorUsuariosIduser, @TrabajadorCitaIddate, @TrabajadorCitaUsuariosIduser)";
                cmd.Parameters.AddWithValue("@Iddate", nuevoIdDate);
                cmd.Parameters.AddWithValue("@Description", tratamientoSeleccionado?.Nombre ?? "Descripci�n de la nueva cita");
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

                DisplayAlert("", "Cita creada con �xito.", "OK");
            }

            // reiniciar la ventana
            RestablecerEstado();
        }
        catch (Exception)
        {
            DisplayAlert("Error", "Error al intentar crear la cita.", "OK");
        }
    }

    // M�todo para verificar si ya existe una cita en la misma fecha y hora
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
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }


        return existeCita;
    }

    // M�todo para elegir la hora
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
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
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
            DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }


    // M�todo para mostrar el calendario al pulsar un tratamiento
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
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }

    // M�todo para detectar el radioButton seleccionado
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
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }

    #endregion

    #region Reiniciar estado p�gina

    // M�todo para restablecer a 0 la p�gina Citas
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

            // Restablecer la selecci�n de fecha en el calendario
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

            // Ocultar el bot�n de crear cita
            botones.IsVisible = false;

            // Restablecer las variables de selecci�n
            tratamientoSeleccionado = null;
            horaSeleccionada = default;

            collectionView.ItemsSource = GetTratamientos();
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
        }
    }

    #endregion
}