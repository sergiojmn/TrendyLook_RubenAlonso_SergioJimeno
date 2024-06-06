using Microsoft.Data.SqlClient;

namespace TrendyLookAPI
{
    public static class DatabaseConnection
    {
        public static SqlConnection GetConnection()
        {
            string connectionString = "Server=trendylook.duckdns.org,1433;Database=PRSDB;User Id=TrendyLook;Password=TrendyLook2024;Trust Server Certificate=True;";
            return new SqlConnection(connectionString);
        }
    }
}
