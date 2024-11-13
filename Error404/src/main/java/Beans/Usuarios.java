package Beans;
import java.util.List;
import java.sql.Date;
import java.sql.Timestamp;

public class Usuarios {
    private int userId;
    private String username;
    private String contrasenia;
    private String nombre;
    private String apellido;
    private String email;
    private String dni;
    private String descripcion;
    private String direccion;
    private Fotos foto;
    private Distritos distrito;
    private String estadoCuenta;
    private Roles rol;
    private Timestamp fechaRegistro;
    private String nombreAlbergue;
    private int capacidadNuevosAnimales;
    private int animalesAlbergados;
    private Date anioCreacion;
    private String urlFacebook;
    private String urlInstagram;
    private String urlTwitter;
    private String puntoAcopio;
    private String direccionDonaciones;
    private String nombreContactoDonaciones;
    private String numeroContactoDonaciones;
    private String numeroYapePlin;
    private byte[] codigoQr;
    private Zonas zona;
    private String fechaNacimiento;
    private String fechaContratacion;


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Fotos getFoto() { return foto; }

    public void setFoto(Fotos foto) { this.foto = foto; }

    public Distritos getDistrito() { return distrito; }

    public void setDistrito(Distritos distrito) { this.distrito = distrito; }

    public String getEstadoCuenta() {
        return estadoCuenta;
    }

    public void setEstadoCuenta(String estadoCuenta) {
        this.estadoCuenta = estadoCuenta;
    }

    public Roles getRol() { return rol; }

    public void setRol(Roles rol) { this.rol = rol; }

    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) { this.fechaRegistro = fechaRegistro; }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public int getCapacidadNuevosAnimales() {
        return capacidadNuevosAnimales;
    }

    public void setCapacidadNuevosAnimales(int capacidadNuevosAnimales) { this.capacidadNuevosAnimales = capacidadNuevosAnimales; }

    public int getAnimalesAlbergados() {
        return animalesAlbergados;
    }

    public void setAnimalesAlbergados(int animalesAlbergados) {
        this.animalesAlbergados = animalesAlbergados;
    }

    public Date getAnioCreacion() {
        return anioCreacion;
    }

    public void setAnioCreacion(Date anioCreacion) {
        this.anioCreacion = anioCreacion;
    }

    public String getUrlFacebook() {
        return urlFacebook;
    }

    public void setUrlFacebook(String urlFacebook) {
        this.urlFacebook = urlFacebook;
    }

    public String getUrlInstagram() {
        return urlInstagram;
    }

    public void setUrlInstagram(String urlInstagram) {
        this.urlInstagram = urlInstagram;
    }

    public String getUrlTwitter() {
        return urlTwitter;
    }

    public void setUrlTwitter(String urlTwitter) {
        this.urlTwitter = urlTwitter;
    }

    public String getPuntoAcopio() {
        return puntoAcopio;
    }

    public void setPuntoAcopio(String puntoAcopio) {
        this.puntoAcopio = puntoAcopio;
    }

    public String getDireccionDonaciones() {
        return direccionDonaciones;
    }

    public void setDireccionDonaciones(String direccionDonaciones) {
        this.direccionDonaciones = direccionDonaciones;
    }

    public String getNombreContactoDonaciones() {
        return nombreContactoDonaciones;
    }

    public void setNombreContactoDonaciones(String nombreContactoDonaciones) { this.nombreContactoDonaciones = nombreContactoDonaciones; }

    public String getNumeroContactoDonaciones() {
        return numeroContactoDonaciones;
    }

    public void setNumeroContactoDonaciones(String numeroContactoDonaciones) { this.numeroContactoDonaciones = numeroContactoDonaciones; }

    public String getNumeroYapePlin() {
        return numeroYapePlin;
    }

    public void setNumeroYapePlin(String numeroYapePlin) {
        this.numeroYapePlin = numeroYapePlin;
    }

    public byte[] getCodigoQr() {
        return codigoQr;
    }

    public void setCodigoQr(byte[] codigoQr) {
        this.codigoQr = codigoQr;
    }

    public Zonas getZona() {return zona; }

    public void setZona(Zonas zona) {this.zona = zona; }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(String fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }
}

