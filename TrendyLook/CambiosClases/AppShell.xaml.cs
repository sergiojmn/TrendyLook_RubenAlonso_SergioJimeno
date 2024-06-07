namespace TrendyLook
{
    public partial class AppShell : Shell
    {
        #region Propiedades

        public event Action OnCerrarSesion;

        #endregion

        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute(nameof(Login), typeof(Login));
            Routing.RegisterRoute(nameof(BlocNotas), typeof(BlocNotas));
            Routing.RegisterRoute(nameof(Citas), typeof(Citas));

            OnCerrarSesion += HandleCerrarSesion;

            OcultarTabs();
        }

        #region Inicio de la aplicación personalizado

        // Método para ocultar todas las pestañas excepto Principal y Login
        private async void OcultarTabs()
        {
            try
            {
                var tabsToHide = new string[] { "perfilTab", "citasTab", "registroTab", "camaraTab", "notasTab", "soporteTab", "darBajaTab", "soporteEmpleadosTab", "adminRegistrosTab" };

                foreach (var tabName in tabsToHide)
                {
                    var tab = this.FindByName<ShellContent>(tabName);
                    if (tab != null)
                    {
                        tab.IsVisible = false;
                    }
                }
            }
            catch (Exception)
            {
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        // Método para ir a la ventana Login 
        private async void HandleCerrarSesion()
        {
            try
            {
                MostrarLoginTab();
                OcultarTabs();
                await Current.GoToAsync("//Login");
            }
            catch (Exception)
            {
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        #endregion

        #region TabBar Personalizado

        // Método para mostrar todas las pestañas para cliente
        public async void MostrarTabsCliente()
        {
            try
            {
                var tabsToShow = new string[] { "perfilTab", "citasTab", "registroTab", "notasTab", "soporteTab" };

                foreach (var tabName in tabsToShow)
                {
                    var tab = this.FindByName<ShellContent>(tabName);
                    if (tab != null)
                    {
                        tab.IsVisible = true;
                    }
                }

                // Ocultar la pestaña de login
                OcultarLoginTab();
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }   
        }

        // Método para mostrar todas las pestañas para empleados
        public async void MostrarTabsEmpleado()
        {
            try
            {
                var tabsToShow = new string[] { "perfilTab", "citasTab", "registroTab", "notasTab", "soporteEmpleadosTab" };

                foreach (var tabName in tabsToShow)
                {
                    var tab = this.FindByName<ShellContent>(tabName);
                    if (tab != null)
                    {
                        tab.IsVisible = true;
                    }
                }

                // Ocultar la pestaña de login
                OcultarLoginTab();
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        // Método para mostrar todas las pestañas para admin
        public async void MostrarTabsAdmin()
        {
            try
            {
                var tabsToShow = new string[] { "perfilTab", "citasTab", "registroTab", "notasTab", "soporteEmpleadosTab", "darBajaTab", "adminRegistrosTab" };

                foreach (var tabName in tabsToShow)
                {
                    var tab = this.FindByName<ShellContent>(tabName);
                    if (tab != null)
                    {
                        tab.IsVisible = true;
                    }
                }

                // Ocultar la pestaña de login
                OcultarLoginTab();
            }
            catch (Exception)
            {
              await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        #endregion

        #region Cerrar Sesión

        // Método para cerrar sesión
        public async void CerrarSesion()
        {
            try
            {
                OnCerrarSesion?.Invoke();
            }
            catch (Exception)
            {
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        // Método para ocultar la pestaña de login
        private async void OcultarLoginTab()
        {
            try
            {
                var loginTab = this.FindByName<ShellContent>("loginTab");
                var registrarseTab = this.FindByName<ShellContent>("registrarseTab");
                if (loginTab != null && registrarseTab != null)
                {
                    loginTab.IsVisible = false;
                    registrarseTab.IsVisible = false;
                }
            }
            catch (Exception)
            {
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        // Método para mostrar la pestaña de login
        private async void MostrarLoginTab()
        {
            try
            {
                var loginTab = this.FindByName<ShellContent>("loginTab");
                var registrarseTab = this.FindByName<ShellContent>("registrarseTab");
                if (loginTab != null && registrarseTab != null)
                {
                    loginTab.IsVisible = true;
                    registrarseTab.IsVisible = true;
                }
            }
            catch (Exception)
            {
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
            }
        }

        #endregion
    }
}