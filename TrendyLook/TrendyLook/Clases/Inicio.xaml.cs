using TrendyLook.Modelos;

namespace TrendyLook;

public partial class Inicio : ContentPage
{
    #region Propiedades

    // Acción del deslizamiento del Carrusel
    private IDispatcherTimer Timer = Application.Current.Dispatcher.CreateTimer();

    #endregion

    public Inicio()
    {
        InitializeComponent();

        // Verificar la conexión a internet al iniciar la aplicación
        ComprobarConexion();
        Connectivity.ConnectivityChanged += CambioDeRed;

        var items = new List<Carrusel>
        {
            new Carrusel { Titulo = "Signature De Chanel", Imagen = "eyeliner.png", Descripcion = "Un lápiz eyeliner de color intenso y larga duración que realza la mirada con un trazo modulable.\r\n\r\nSu aplicador en pincel es muy suave y permite una aplicación fácil y continua, se desliza con suavidad a lo largo de la línea de las pestañas.\r\nCon una forma alargada, dibuja un trazo a medida muy preciso, de más fino a más grueso.\r\nSu fórmula fluida altamente pigmentada ofrece un resultado homogéneo desde la primera pasada.\r\nEl resultado de maquillaje es intenso, satinado y resistente al agua.",Enlace = "https://www.amazon.es/Chanel-Liner-Liquid-Eyeliner-516-Rouge/dp/B08B7W63LL/ref=sr_1_3?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=25APBVDG363VL&dib=eyJ2IjoiMSJ9.30_ygFsES0eMXemqcb3Er_po0DHKCd1cZYDNGZQ3kCEKeqw3hhERXWNKud96Ui5C2BcaQb47XkxzNLTrY62zIGPSkZrRpzRNr6lU1it7vG9eFlitI1x_pQ5N6zFuFYFNkHfGTGTeOo5JY4d4Hf4nO-RzY5pwFMg9m7UD4sH-6paumPSxxz9erWGHLZRVPki_wIvBl2ZDDQL9oLvzx_LrMJKPNCo7LNgZPb2PuAHfur-Lrxac0k1XByBcAx8O7ACu4T8RX-s1v0Dt9MUEsgM-fjE44s5x4pYLJnnkXymRq80.Ox93U-yvvz7xG3s1XOHStcO2ExG1UDjCMKYSacyZPG4&dib_tag=se&keywords=eyeliner+SIGNATURE+DE+CHANEL&qid=1712053997&sprefix=eyeliner+signature+de+chanel%2Caps%2C76&sr=8-3" ,AlturaCarrusel = 380 },
            new Carrusel { Titulo = "Dior Vernis", Imagen = "esmalte.png", Descripcion = "Un verdadero tratamiento protector gracias a su fórmula enriquecida con extractos de peonía y un extracto de pistachero, Dior Vernis sublima las uñas con un color couture en cada manicura.\r\n\r\nFácil de aplicar con su pincel ergonómico, esta laca de uñas con acabado brillante y duración efecto gel asegura un resultado uniforme, sea cual sea la forma de las uñas.",Enlace = "https://www.amazon.es/DIOR-VERNIS-ESMALTE-N%C2%BA796-DENIM/dp/B0CLT9YPQR/ref=sr_1_7?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=3CAXSX88P7JSI&dib=eyJ2IjoiMSJ9.KsXnL4xY47RQdvZm7U8ZC7BMiObVJzEgs8lh7lBKRLoXAYrNPudRE1Jr9N6ZKIwrdi-LOwMnohO2-AZTc0s0mjwII2pCpJhsxUnid9KDosVh9094cttCqwPwzUGmShIpru-2V9OMKyQkGOJm7kAcuMbOhzC_Fmk8Jk_9xEsVXSbyf3C6qlfQ7az7J6ZgIpsNiFRD-m22D5mVHgbLcs7IgPzbnLr9FM7w0XUVu-S9el70QZhZG7TAidFvwlDb2oPFhxOW04J1lmhsIUh0csBSaRGKksUFT3h6wAFOkimsAoM.F3nvUBspx4se9YWtdEVtcfld-rXHiyg-PgRp6iUB0WY&dib_tag=se&keywords=DIOR+VERNIS&qid=1712053558&sprefix=dior+vernis%2Caps%2C93&sr=8-7" ,AlturaCarrusel = 380},
            new Carrusel { Titulo = "High Definition Serum", Imagen = "skincare.png", Descripcion = "Lifting facial Inhibit Definition Serum de última generación que inhibe, rellena y tensa las líneas de expresión y las arrugas. Su extraordinaria fórmula Skinform Molecular Technology®, altamente concentrada de ingredientes antiedad, corrige y reafirma la superficie de la piel. Efecto lifting progresivo y acumulativo visible desde la primera aplicación que lo convierte en un indispensable.",Enlace = "https://www.amazon.es/Natura-Biss%C3%A9-l%C3%ADquidos-diurnos-faciales/dp/B075S1KH5X/ref=sr_1_4?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=PBC9B12PRAO3&dib=eyJ2IjoiMSJ9.wAhb34rMujxbizR5Tpub5FSSiJbLMyl_f-H5ZpTw9s55u7SqXWeCYXmf9ffYJoBbRwakb9E_qGENDSwlP6qJFAAHYZAg94zOZp09-UrqnqyiDTmDcfVjklO4h03Cu_P_z2JX6SYnP_ndx-rn-VHyuU8Nb7knLFAE7jeL9VghpmY6h4rkGq-QiqC2LT28KHiN4fI2dVbkDEZ6BWcU1klvFXonEIN475aON-t9WMlBj-Y.AaSOpKhyPDZCdlD4uErV0VNuIe5HbS9escnYgNDng6w&dib_tag=se&keywords=High+Definition+Serum&qid=1712053776&sprefix=high+definition+serum%2Caps%2C168&sr=8-4" ,AlturaCarrusel = 380},
            new Carrusel { Titulo = "Color Vive", Imagen = "champu.png", Descripcion = "El champú Color-Vive con filtro nutritivo UV es un champú de cuidado protector especialmente concebido para cabello teñido o con mechas: lava con suavidad, nutre y protege la fibra capilar frente a las agresiones exteriores. Resultado: ¡el cabello teñido resplandece!",Enlace ="https://www.amazon.es/LOR%C3%89AL-Elvive-Champ%C3%BA-Protector-te%C3%B1ido/dp/B0C6QXB921/ref=sr_1_7?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=1PENPJIWE5JS2&dib=eyJ2IjoiMSJ9.LeYBx-8QU6LfITlnTjzNZwGPR8Q1_QuOLA3ygstPBFlPYE9S515GiAv7uK-HUYme9kEqgYimDO1rFVJepDly8YsZqB6PM8mC5ZhmGMEtYHf0Q-9dur6yG7zxayQJfsV75_BCd5cWjCcFy8JmWyqS3zSW_Ad8--CablICkfLoDI5Mkhp1w3hSdn5hVBTZI7y19FttfG7UYlrl5ibB63_kW8oonPIIxI_UT5v9lDICDPFky-R_12BDg1vTpHD9zUBZBix2yuZMFALijo3vbYu4_4rOnSiljK0QharTzlzS4dI.vh82H_OSyzz2UAvahayMiGLdUw5exUOHck2TosolIxM&dib_tag=se&keywords=Color+Vive&qid=1712053857&sprefix=color+vive%2Caps%2C85&sr=8-7" ,AlturaCarrusel = 380},
            new Carrusel { Titulo = "Sauna facial", Imagen = "sauna.png", Descripcion = "Sauna facial es el principal especialista en el mercado de la asistencia sanitaria a domicilio y una marca importante en el campo del masaje. Desde hace 40 años, la empresa alemana está comprometida con la salud de las personas bajo el lema \"Su salud en buenas manos\". Medisana es pionera en la tendencia de la gestión de la salud móvil y ofrece productos orientados al futuro para la vida cotidiana moderna en un mundo cada vez más interconectado.", Enlace = "https://www.amazon.es/Medisana-FSS-Sauna-facial-blanco/dp/B09LR29ZX1/ref=sr_1_5?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=3BRBWNZBISCCY&dib=eyJ2IjoiMSJ9.Mi-fE90RcjYp_qpoITwOeulb1a-l9i4-3MDMtLx2YuEwLu8RgFXJs3Q-0wtmBm4TtYHlXRoYDmSqfYJg3JKmrdjXnZKHb52iQU6TP2oSSL0n6PPX6WuWE4i73M1jjqp7yRgK9-47bCjFNkGW7IY59YLgtW1IRTxZPant9AhXnsbdpZQV8N0wg9DFQwCCyGPI_NTg2TNmLj8102dw7mm9MtBACM2uhqQMINSl9yMyUDIBWKdQzH6hMwnov9RdzNhjoq0xS06l5vwg7klMTK2ryS9HHnhTUUTEmbdbd0cpFYY.3rokeW05m2-Pbt-VB5G0F_tJl0UFbNiIIeC3LZuAAfk&dib_tag=se&keywords=Sauna%2Bfacial&qid=1712054480&sprefix=sauna%2Bfacial%2Caps%2C148&sr=8-5&th=1" ,AlturaCarrusel = 380}
        };
        carrusel.ItemsSource = items;

        // Declaraciones para mover el carrusel
        Timer.Interval = TimeSpan.FromSeconds(7);
        Timer.Tick += MovimientoCarrusel;

    }

    #region Carrusel

    // Método para ir a los enlaces de compra
    private async void Enlaces(object sender, EventArgs e)
    {
        try
        {
            if (sender is Button button && button.BindingContext is Carrusel carrusel)
            {
                await Launcher.OpenAsync(new Uri(carrusel.Enlace));
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }

    // Métodos para mover el carrusel
    private async void MovimientoCarrusel(object sender, EventArgs e)
    {
        try
        {
            if (carrusel.ItemsSource != null)
            {
                var itemCarrusel = carrusel.ItemsSource.Cast<object>().Count();
                if (itemCarrusel > 0)
                {
                    var nextPosition = (carrusel.Position + 1) % itemCarrusel;
                    carrusel.Position = nextPosition;
                }
            }
        }
        catch (Exception)
        {
            await DisplayAlert("Error", "Ha ocurrido un error, intentelo más tarde.", "OK");
        }
    }
    protected override void OnDisappearing()
    {
        base.OnDisappearing();
        Timer.Stop();
    }
    protected override void OnAppearing()
    {
        base.OnAppearing();
        Timer.Start();
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
                await DisplayAlert("Sin conexión a internet", "Por favor, conecta tu dispositivo a internet para continuar.", "Aceptar");
            }
            else
            {
                await DisplayAlert("Con conexión a internet", "Ha vuelto la conexión, disfrute.", "Aceptar");
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

    #region Mantener sesión iniciada

    // Guardar iduser
    public interface IAuthService
    {
        int GetCurrentUserId();
        void SetCurrentUserId(int userId);
    }

    public class AuthService : IAuthService
    {
        private int _currentUserId;

        public int GetCurrentUserId()
        {
            return _currentUserId;
        }

        public void SetCurrentUserId(int userId)
        {
            _currentUserId = userId;
        }
    }

    #endregion
}