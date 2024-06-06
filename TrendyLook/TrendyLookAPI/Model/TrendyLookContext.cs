using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace TrendyLook.Model;

public partial class TrendyLookContext : DbContext
{
    private readonly IConfiguration _configuration;

    public TrendyLookContext(DbContextOptions<TrendyLookContext> options)
        : base(options)
    {
        _configuration = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .Build();

    }

    public TrendyLookContext()
    {
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer(_configuration.GetConnectionString("SQLCon"));
    }

    public virtual DbSet<Calendario> Calendarios { get; set; }

    public virtual DbSet<Cita> Citas { get; set; }

    public virtual DbSet<Citum> Cita { get; set; }

    public virtual DbSet<Trabajador> Trabajadors { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Calendario>(entity =>
        {
            entity.HasKey(e => e.Idcalendar).HasName("PK__calendar__18BA6F8CA8DCAFE7");

            entity.ToTable("calendario");

            entity.Property(e => e.Idcalendar)
                .ValueGeneratedNever()
                .HasColumnName("idcalendar");
            entity.Property(e => e.CitaIddate).HasColumnName("cita_iddate");
            entity.Property(e => e.Date).HasColumnName("date");
            entity.Property(e => e.Disponibility)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("disponibility");
            entity.Property(e => e.Hour).HasColumnName("hour");
            entity.Property(e => e.Iduser).HasColumnName("iduser");
        });

        modelBuilder.Entity<Cita>(entity =>
        {
            entity.HasKey(e => e.Iddate).HasName("PK__citas__C4FBF54A344C699E");

            entity.ToTable("citas");

            entity.Property(e => e.Iddate).HasColumnName("iddate");
            entity.Property(e => e.Date).HasColumnName("date");
            entity.Property(e => e.Description)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("description");
            entity.Property(e => e.Hour).HasColumnName("hour");
            entity.Property(e => e.State).HasColumnName("state");
        });

        modelBuilder.Entity<Citum>(entity =>
        {
            entity.HasKey(e => e.Iddate).HasName("PK__cita__C4FBF54A18BD1897");

            entity.ToTable("cita");

            entity.Property(e => e.Iddate)
                .ValueGeneratedNever()
                .HasColumnName("iddate");
            entity.Property(e => e.Date).HasColumnName("date");
            entity.Property(e => e.Description)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("description");
            entity.Property(e => e.Hour).HasColumnName("hour");
            entity.Property(e => e.State).HasColumnName("state");
            entity.Property(e => e.TrabajadorCitaIddate).HasColumnName("trabajador_cita_iddate");
            entity.Property(e => e.TrabajadorCitaUsuariosIduser).HasColumnName("trabajador_cita_usuarios_iduser");
            entity.Property(e => e.TrabajadorIdworker).HasColumnName("trabajador_idworker");
            entity.Property(e => e.TrabajadorUsuariosIduser).HasColumnName("trabajador_usuarios_iduser");
            entity.Property(e => e.UsuariosIduser).HasColumnName("usuarios_iduser");
        });

        modelBuilder.Entity<Trabajador>(entity =>
        {
            entity.HasKey(e => e.Idworker).HasName("PK__trabajad__046594075F0BBCFC");

            entity.ToTable("trabajador");

            entity.Property(e => e.Idworker)
                .ValueGeneratedNever()
                .HasColumnName("idworker");
            entity.Property(e => e.CitaIddate).HasColumnName("cita_iddate");
            entity.Property(e => e.CitaUsuariosIduser).HasColumnName("cita_usuarios_iduser");
            entity.Property(e => e.Name)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("name");
            entity.Property(e => e.Password)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Range)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("range");
            entity.Property(e => e.UsuariosIduser).HasColumnName("usuarios_iduser");
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.Iduser).HasName("PK__usuarios__2A50F1CE546A758B");

            entity.ToTable("usuarios");

            entity.Property(e => e.Iduser)
                .ValueGeneratedNever()
                .HasColumnName("iduser");
            entity.Property(e => e.Genero)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("genero");
            entity.Property(e => e.Mail)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("mail");
            entity.Property(e => e.Name)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("name");
            entity.Property(e => e.Password)
                .HasMaxLength(45)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Usertype).HasColumnName("usertype");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}