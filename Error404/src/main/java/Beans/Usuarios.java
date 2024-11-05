package Beans;

public class Usuarios {
    private int userId;
    private String username;
    private String contrasena;
    private String nombre;
    private String apellido;
    private String email;
    private String dni;
    private String descripcion;
    private String direccion;
    private int distritoId;
    private String estadoCuenta;
    private int rolId;
    private String fechaRegistro;
    private String nombreAlbergue;
    private int capacidadNuevosAnimales;
    private int animalesAlbergados;
    private int anioCreacion;
    private String urlFacebook;
    private String urlInstagram;
    private String urlTwitter;
    private String puntoAcopio;
    private String direccionDonaciones;
    private String nombreContactoDonaciones;
    private String numeroContactoDonaciones;
    private String numeroYapePlin;
    private byte[] codigoQr;
    private int zonaId;
    private String fechaNacimiento;
    private String fechaContratacion;

    // Constructor vacío
    public Usuarios() {
        // Este constructor no hace nada, solo permite crear objetos sin parámetros
    }

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

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
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

    public int getDistritoId() {
        return distritoId;
    }

    public void setDistritoId(int distritoId) {
        this.distritoId = distritoId;
    }

    public String getEstadoCuenta() {
        return estadoCuenta;
    }

    public void setEstadoCuenta(String estadoCuenta) {
        this.estadoCuenta = estadoCuenta;
    }

    public int getRolId() {
        return rolId;
    }

    public void setRolId(int rolId) {
        this.rolId = rolId;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public int getCapacidadNuevosAnimales() {
        return capacidadNuevosAnimales;
    }

    public void setCapacidadNuevosAnimales(int capacidadNuevosAnimales) {
        this.capacidadNuevosAnimales = capacidadNuevosAnimales;
    }

    public int getAnimalesAlbergados() {
        return animalesAlbergados;
    }

    public void setAnimalesAlbergados(int animalesAlbergados) {
        this.animalesAlbergados = animalesAlbergados;
    }

    public int getAnioCreacion() {
        return anioCreacion;
    }

    public void setAnioCreacion(int anioCreacion) {
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

    public void setNombreContactoDonaciones(String nombreContactoDonaciones) {
        this.nombreContactoDonaciones = nombreContactoDonaciones;
    }

    public String getNumeroContactoDonaciones() {
        return numeroContactoDonaciones;
    }

    public void setNumeroContactoDonaciones(String numeroContactoDonaciones) {
        this.numeroContactoDonaciones = numeroContactoDonaciones;
    }

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

    public int getZonaId() {
        return zonaId;
    }

    public void setZonaId(int zonaId) {
        this.zonaId = zonaId;
    }

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

    public Usuarios(int userId, String username, String contrasena, String estadoCuenta, int rolId, String fechaRegistro) {
        this.userId = userId;
        this.username = username;
        this.contrasena = contrasena;
        this.estadoCuenta = estadoCuenta;
        this.rolId = rolId;
        this.fechaRegistro = fechaRegistro;
    }
}

