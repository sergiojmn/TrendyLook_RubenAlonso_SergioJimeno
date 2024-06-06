namespace TrendyLook
{
    #region Propiedades

    using Xamarin.Essentials;

    #endregion

    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            // Verificar si el usuario está logueado
            bool userLoggedIn = Preferences.Get("UserLoggedIn", false);
            MainPage = new AppShell();

            if (userLoggedIn)
            {
                // Recuperar detalles del usuario
                int userId = Preferences.Get("UserId", 0);
                string userType = Preferences.Get("UserType", string.Empty);

                // Configurar la interfaz según el tipo de usuario
                switch (userType)
                {
                    case "1":
                        (MainPage as AppShell)?.MostrarTabsAdmin();
                        break;
                    case "2":
                        (MainPage as AppShell)?.MostrarTabsEmpleado();
                        break;
                    case "3":
                        (MainPage as AppShell)?.MostrarTabsCliente();
                        break;
                    default:
                        Shell.Current.GoToAsync("//Inicio");
                        break;
                }
            }
            else
            {
                // Navegar a la página de inicio si el usuario no está logueado
                Shell.Current.GoToAsync("//Inicio");
            }
        }
    }
}