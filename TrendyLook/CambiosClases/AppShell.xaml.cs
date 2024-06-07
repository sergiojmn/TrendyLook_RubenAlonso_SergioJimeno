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

        #region Inicio de la aplicaci�n personalizado

        // M�todo para ocultar todas las pesta�as excepto Principal y Login
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
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para ir a la ventana Login 
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
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        #endregion

        #region TabBar Personalizado

        // M�todo para mostrar todas las pesta�as para cliente
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

                // Ocultar la pesta�a de login
                OcultarLoginTab();
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }   
        }

        // M�todo para mostrar todas las pesta�as para empleados
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

                // Ocultar la pesta�a de login
                OcultarLoginTab();
            }
            catch (Exception)
            {
                await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para mostrar todas las pesta�as para admin
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

                // Ocultar la pesta�a de login
                OcultarLoginTab();
            }
            catch (Exception)
            {
              await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        #endregion

        #region Cerrar Sesi�n

        // M�todo para cerrar sesi�n
        public async void CerrarSesion()
        {
            try
            {
                OnCerrarSesion?.Invoke();
            }
            catch (Exception)
            {
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para ocultar la pesta�a de login
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
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        // M�todo para mostrar la pesta�a de login
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
               await DisplayAlert("Error", "Ha ocurrido un error, intentelo m�s tarde.", "OK");
            }
        }

        #endregion
    }
}