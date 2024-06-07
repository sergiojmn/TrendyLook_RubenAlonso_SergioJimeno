
using Microsoft.Data.SqlClient;
using TrendyLook.Modelos;

namespace TrendyLook
{
    public class DataStore
    {
        private static DataStore _instance;
        private static readonly object _lock = new object();

        public List<Citum> Citas { get; private set; }

        private DataStore()
        {
            Citas = new List<Citum>();
        }

        public static DataStore Instance
        {
            get
            {
                lock (_lock)
                {
                    if (_instance == null)
                    {
                        _instance = new DataStore();
                    }
                    return _instance;
                }
            }
        }

        public void LoadData()
        {
            try
            {
                using (SqlConnection conn = DatabaseConnection.GetConnection())
                {
                    string query = "SELECT C.Iddate, C.Description, C.Date, C.Hour, U.Name " +
                                   "FROM cita AS C " +
                                   "INNER JOIN usuarios AS U ON C.trabajador_idworker = U.iduser";

                    SqlCommand cmd = new SqlCommand(query, conn);
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

                            Citas.Add(cita);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al cargar los datos: {ex.Message}");
            }
        }
    }


}