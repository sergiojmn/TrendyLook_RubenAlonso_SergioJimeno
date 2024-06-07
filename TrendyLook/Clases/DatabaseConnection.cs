using Microsoft.Data.SqlClient;

namespace TrendyLook
{
    public static class DatabaseConnection
    {
        private static string connectionString = "Server=trendylook.duckdns.org,1433;Database=PRSDB;Persist Security Info=True;User Id=TrendyLook;Password=TrendyLook2024;Trust Server Certificate=True;";

        public static SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            return conn;
        }
    }
}