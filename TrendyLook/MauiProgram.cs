using Microsoft.Extensions.Logging;

namespace TrendyLook
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
            builder.Logging.AddDebug();
#endif
            builder.Services.AddSingleton<Citas>();
            builder.Services.AddSingleton<Inicio>();
            builder.Services.AddSingleton<Login>();
            builder.Services.AddSingleton<Registrarse>();

            builder.Services.AddSingleton<ILauncher>(Launcher.Default); // Whatsapp
            builder.Services.AddSingleton<Soporte>(); // Whatsapp
            builder.Services.AddSingleton<IMediaPicker>(MediaPicker.Default); // Cámara
            builder.Services.AddTransient<Camara>(); // Cámara

            return builder.Build();
        }
    }
}