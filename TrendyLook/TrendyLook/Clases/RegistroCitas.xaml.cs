using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using TrendyLook.Modelos;
using Xamarin.Essentials;


namespace TrendyLook;

public partial class RegistroCitas : ContentPage
{
    public RegistroCitas()
    {
        InitializeComponent();
    }

    // Moved method from Citas
    private List<Citum> ObtenerCitasPorFecha(DateTime fecha)
    {
        List<Citum> citas = new List<Citum>();

        try
        {
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                string query = "SELECT C.Iddate, C.Description, C.Date, C.Hour, U.Name " +
                               "FROM cita AS C " +
                               "INNER JOIN usuarios AS U ON C.trabajador_idworker = U.iduser " +
                               "WHERE CAST(C.date AS DATE) = @Fecha";

                if (UsuarioSesion.UserType == "3")
                {
                    query += " AND C.trabajador_idworker = @UserId";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Fecha", fecha.Date);

                if (UsuarioSesion.UserType == "3")
                {
                    cmd.Parameters.AddWithValue("@UserId", UsuarioSesion.GetIdUsuario());
                }

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string state = reader.IsDBNull(reader.GetOrdinal("Name")) ? "Sin asignar" : reader.GetString(reader.GetOrdinal("Name"));

                        Citum cita = new Citum
                        {
                            Iddate = reader.GetInt32(reader.GetOrdinal("Iddate")),
                            Description = reader.GetString(reader.GetOrdinal("Description")),
                            Date = DateOnly.FromDateTime(reader.GetDateTime(reader.GetOrdinal("Date"))),
                            Hour = TimeOnly.FromTimeSpan(reader.GetTimeSpan(reader.GetOrdinal("Hour"))),
                            State = state
                        };

                        citas.Add(cita);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al obtener las citas: {ex.Message}");
        }

        return citas;
    }




    private List<Citum> ObtenerCitasEmpleado()
    {
        List<Citum> citas = new List<Citum>();

        int idUsuario = Xamarin.Essentials.Preferences.Get("UserId", 0);

        try
        {
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                string query = "SELECT C.Iddate, C.Description, C.Date, C.Hour, U.Name " +
                               "FROM cita AS C " +
                               "INNER JOIN usuarios AS U ON C.trabajador_idworker = U.iduser " +
                               "WHERE trabajador_idworker = @WorkerId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@WorkerId", idUsuario);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Citum cita = new Citum
                        {
                            Iddate = reader.GetInt32(reader.GetOrdinal("Iddate")),
                            Description = reader.GetString(reader.GetOrdinal("Description")),
                            Date = DateOnly.FromDateTime(reader.GetDateTime(reader.GetOrdinal("Date"))),
                            Hour = TimeOnly.FromTimeSpan(reader.GetTimeSpan(reader.GetOrdinal("Hour"))),
                            State = reader.GetString(reader.GetOrdinal("Name")) // Usar el nombre en lugar del ID
                        };

                        citas.Add(cita);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al obtener las citas: {ex.Message}");
        }

        return citas;
    }


    private List<Citum> ObtenerCitasCliente()
    {
        List<Citum> citas = new List<Citum>();
        int idUsuario = Xamarin.Essentials.Preferences.Get("UserId", 0);

        try
        {
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                string query = "SELECT C.Iddate, C.Description, C.Date, C.Hour, U.Name " +
                               "FROM cita AS C " +
                               "INNER JOIN usuarios AS U ON C.trabajador_idworker = U.iduser " +
                               "WHERE C.usuarios_iduser = @UserId"; // Cambio en la condición WHERE

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", idUsuario);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Citum cita = new Citum
                        {
                            Iddate = reader.GetInt32(reader.GetOrdinal("Iddate")),
                            Description = reader.GetString(reader.GetOrdinal("Description")),
                            Date = DateOnly.FromDateTime(reader.GetDateTime(reader.GetOrdinal("Date"))),
                            Hour = TimeOnly.FromTimeSpan(reader.GetTimeSpan(reader.GetOrdinal("Hour"))),
                            State = reader.GetString(reader.GetOrdinal("Name")) // Usar el nombre en lugar del ID
                        };
                        citas.Add(cita);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al obtener las citas: {ex.Message}");
        }

        return citas;
    }



    private void Boton1_Clicked(object sender, EventArgs e)
    {
        DateTime fechaSeleccionada = calendario.Date;
        List<Citum> citasFecha = ObtenerCitasPorFecha(fechaSeleccionada);

        // Limpiar el StackLayout antes de agregar nuevas citas
        CitasStackLayout.Children.Clear();

        string userType = Xamarin.Essentials.Preferences.Get("UserType", String.Empty);

        // Depuración: Verificar el tipo de usuario
        Console.WriteLine($"Tipo de usuario: {UsuarioSesion.UserType}");

        if (citasFecha != null && citasFecha.Count > 0)
        {
            foreach (var cita in citasFecha)
            {
                // Crear un nuevo Frame para la cita
                var citaFrame = new Frame
                {
                    BorderColor = Colors.Black,
                    BackgroundColor = Colors.Pink,
                    Padding = 10,
                    CornerRadius = 10
                };

                // Crear un nuevo Grid para la cita
                var citaGrid = new Grid
                {
                    ColumnDefinitions =
            {
                new ColumnDefinition { Width = GridLength.Star },
                new ColumnDefinition { Width = GridLength.Auto }
            }
                };

                // Crear el Label para la información de la cita
                var citaLabel = new Label
                {
                    Text = $"Número de Cita: {cita.Iddate}\n" +
                           $"Tratamiento: {cita.Description}\n" +
                           $"Fecha: {cita.Date}\n" +
                           $"Hora: {cita.Hour}\n" +
                           $"Asignada: {cita.State}",
                    TextColor = Colors.Black,
                    VerticalOptions = LayoutOptions.Start,
                    Margin = new Thickness(0, 6)
                };

                // Crear el botón Cancelar Cita
                var cancelarButton = new Button
                {
                    Text = "Cancelar Cita",
                    TextColor = Colors.White,
                    BackgroundColor = Colors.Gray,
                    Opacity = 0.9,
                    HorizontalOptions = LayoutOptions.Fill,
                    Margin = new Thickness(0, 1)
                };

                // Agrega el comando para cancelar la cita
                cancelarButton.Clicked += (s, args) => CancelarCita(cita.Iddate, citaFrame);

                // Crear el botón Asignarme Cita
                var asignarButton = new Button
                {
                    Text = "Asignarme Cita",
                    TextColor = Colors.White,
                    BackgroundColor = Colors.Gray,
                    Opacity = 0.9,
                    HorizontalOptions = LayoutOptions.Fill,
                    Margin = new Thickness(0, 3)
                };

                // Depuración: Verificar si el botón debe estar habilitado o no
                if (userType != "3")
                {
                    Console.WriteLine("El usuario no es de tipo 3. Se habilitará el botón.");
                    asignarButton.Clicked += (s, args) => AsignarCita(cita.Iddate, citaFrame);
                }
                else
                {
                    Console.WriteLine("El usuario es de tipo 3. Se deshabilitará el botón.");
                    asignarButton.IsVisible = false;
                }

                // Crear un StackLayout para los botones
                var buttonsStack = new StackLayout
                {
                    Orientation = StackOrientation.Vertical,
                    VerticalOptions = LayoutOptions.Start,
                    Children = { cancelarButton, asignarButton }
                };

                // Añadir el Label y el StackLayout con los botones al Grid
                citaGrid.Children.Add(citaLabel);
                citaGrid.Children.Add(buttonsStack);
                Grid.SetColumn(buttonsStack, 1);

                // Agregar el Grid al Frame
                citaFrame.Content = citaGrid;

                // Agregar el nuevo Frame al StackLayout
                CitasStackLayout.Children.Add(citaFrame);
            }
        }
        else
        {
            // Mostrar un mensaje si no hay citas
            CitasStackLayout.Children.Add(new Label { Text = "No hay citas para la fecha seleccionada.", TextColor = Colors.Red });
        }
    }



    private void BotonMisCitas_Clicked(object sender, EventArgs e)
    {
        string userType = Xamarin.Essentials.Preferences.Get("UserType", "0");

        if (userType == "3")
        {
            List<Citum> citasCliente = ObtenerCitasCliente();

            // Limpiar el StackLayout antes de agregar nuevas citas
            CitasStackLayout.Children.Clear();

            if (citasCliente != null && citasCliente.Count > 0)
            {
                foreach (var cita in citasCliente)
                {
                    // Crear un nuevo Frame para la cita
                    var citaFrame = new Frame
                    {
                        BorderColor = Colors.Black,
                        BackgroundColor = Colors.Pink,
                        Padding = 10,
                        CornerRadius = 10
                    };

                    // Crear un nuevo Grid para la cita
                    var citaGrid = new Grid
                    {
                        ColumnDefinitions =
                    {
                        new ColumnDefinition { Width = GridLength.Star },
                        new ColumnDefinition { Width = GridLength.Auto }
                    }
                    };

                    // Crear el Label para la información de la cita
                    var citaLabel = new Label
                    {
                        Text = $"Número de Cita: {cita.Iddate}\n" +
                               $"Tratamiento: {cita.Description}\n" +
                               $"Fecha: {cita.Date}\n" +
                               $"Hora: {cita.Hour}\n" +
                               $"Asignado: {cita.State}",
                        TextColor = Colors.Black,
                        VerticalOptions = LayoutOptions.Start
                    };

                    // Crear el botón Cancelar Cita
                    var cancelarButton = new Button
                    {
                        Text = "Cancelar Cita",
                        TextColor = Colors.White,
                        BackgroundColor = Colors.Gray,
                        Opacity = 0.9,
                        HorizontalOptions = LayoutOptions.Fill,
                        Margin = new Thickness(0, 10)
                    };

                    // Agrega el comando para cancelar la cita
                    cancelarButton.Clicked += (s, args) => CancelarCita(cita.Iddate, citaFrame);

                    // Crear un StackLayout para el botón cancelar
                    var buttonsStack = new StackLayout
                    {
                        Orientation = StackOrientation.Vertical,
                        VerticalOptions = LayoutOptions.Start,
                        Children = { cancelarButton }
                    };

                    // Añadir el Label y el StackLayout con el botón cancelar al Grid
                    citaGrid.Children.Add(citaLabel);
                    citaGrid.Children.Add(buttonsStack);
                    Grid.SetColumn(buttonsStack, 1);

                    // Agregar el Grid al Frame
                    citaFrame.Content = citaGrid;

                    // Agregar el nuevo Frame al StackLayout
                    CitasStackLayout.Children.Add(citaFrame);
                }
            }
            else
            {
                // Mostrar un mensaje si no hay citas
                CitasStackLayout.Children.Add(new Label { Text = "No tienes citas asignadas.", TextColor = Colors.Red });
            }
        }
        else
        {
            List<Citum> citasEmpleado = ObtenerCitasEmpleado();

            // Limpiar el StackLayout antes de agregar nuevas citas
            CitasStackLayout.Children.Clear();

            if (citasEmpleado != null && citasEmpleado.Count > 0)
            {
                foreach (var cita in citasEmpleado)
                {
                    // Crear un nuevo Frame para la cita
                    var citaFrame = new Frame
                    {
                        BorderColor = Colors.Black,
                        BackgroundColor = Colors.Pink,
                        Padding = 10,
                        CornerRadius = 10
                    };

                    // Crear un nuevo Grid para la cita
                    var citaGrid = new Grid
                    {
                        ColumnDefinitions =
                    {
                        new ColumnDefinition { Width = GridLength.Star },
                        new ColumnDefinition { Width = GridLength.Auto }
                    }
                    };

                    // Crear el Label para la información de la cita
                    var citaLabel = new Label
                    {
                        Text = $"Número de Cita: {cita.Iddate}\n" +
                               $"Tratamiento: {cita.Description}\n" +
                               $"Fecha: {cita.Date}\n" +
                               $"Hora: {cita.Hour}\n" +
                               $"Asignado: {cita.State}",
                        TextColor = Colors.Black,
                        VerticalOptions = LayoutOptions.Start
                    };

                    // Crear el botón Cancelar Cita
                    var cancelarButton = new Button
                    {
                        Text = "Cancelar Cita",
                        TextColor = Colors.White,
                        BackgroundColor = Colors.Gray,
                        Opacity = 0.9,
                        HorizontalOptions = LayoutOptions.Fill,
                        Margin = new Thickness(0, 10)
                    };

                    // Agrega el comando para cancelar la cita
                    cancelarButton.Clicked += (s, args) => CancelarCita(cita.Iddate, citaFrame);

                    // Crear un StackLayout para el botón cancelar
                    var buttonsStack = new StackLayout
                    {
                        Orientation = StackOrientation.Vertical,
                        VerticalOptions = LayoutOptions.Start,
                        Children = { cancelarButton }
                    };

                    // Añadir el Label y el StackLayout con el botón cancelar al Grid
                    citaGrid.Children.Add(citaLabel);
                    citaGrid.Children.Add(buttonsStack);
                    Grid.SetColumn(buttonsStack, 1);

                    // Agregar el Grid al Frame
                    citaFrame.Content = citaGrid;

                    // Agregar el nuevo Frame al StackLayout
                    CitasStackLayout.Children.Add(citaFrame);
                }
            }
            else
            {
                // Mostrar un mensaje si no hay citas
                CitasStackLayout.Children.Add(new Label { Text = "No tienes citas asignadas.", TextColor = Colors.Red });
            }
        }
    }

    private void CancelarCita(int idCita, Frame citaFrame)
    {
        try
        {
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                string query = "DELETE FROM Cita WHERE Iddate = @Iddate";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Iddate", idCita);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    // Eliminar la cita de la interfaz de usuario
                    CitasStackLayout.Children.Remove(citaFrame);
                    DisplayAlert("Éxito", "La cita ha sido cancelada.", "OK");
                }
                else
                {
                    DisplayAlert("Error", "No se pudo cancelar la cita.", "OK");
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al cancelar la cita: {ex.Message}");
            DisplayAlert("Error", "Ocurrió un error al cancelar la cita.", "OK");
        }
    }

    private void AsignarCita(int idCita, Frame citaFrame)
    {
        try
        {
            // Obtener el iduser de las preferencias
            int idUsuario = Xamarin.Essentials.Preferences.Get("UserId", 0);

            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                string query = "UPDATE Cita SET trabajador_idworker = @IdUsuario WHERE Iddate = @Iddate";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@IdUsuario", idUsuario); // Utilizar el iduser obtenido de las preferencias
                cmd.Parameters.AddWithValue("@Iddate", idCita);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    // Actualizar la cita en la interfaz de usuario
                    DisplayAlert("Éxito", "La cita ha sido asignada.", "OK");
                }
                else
                {
                    DisplayAlert("Error", "No se pudo asignar la cita.", "OK");
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al asignar la cita: {ex.Message}");
            DisplayAlert("Error", "Ocurrió un error al asignar la cita.", "OK");
        }
    }

}
