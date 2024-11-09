package Beans;

public class PublicacionesDonaciones {
    private Publicaciones publicacion;
    private String puntoAcopio;
    private TiposDonaciones tipoDonacion;
    private double cantidad;
    private String marca;
    private String fechaRecepcionInicio;
    private String fechaRecepcionFin;
    private String horaRecepcion;
    private String telefonoContacto;
    private String nombreContacto;
    private String motivoDonacion;

    public Publicaciones getPublicacion() { return publicacion; }

    public void setPublicacion(Publicaciones publicacion) { this.publicacion = publicacion; }

    public String getPuntoAcopio() {
        return puntoAcopio;
    }

    public void setPuntoAcopio(String puntoAcopio) {
        this.puntoAcopio = puntoAcopio;
    }

    public TiposDonaciones getTipoDonacion() { return tipoDonacion; }

    public void setTipoDonacion(TiposDonaciones tipoDonacion) { this.tipoDonacion = tipoDonacion; }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getFechaRecepcionInicio() {
        return fechaRecepcionInicio;
    }

    public void setFechaRecepcionInicio(String fechaRecepcionInicio) { this.fechaRecepcionInicio = fechaRecepcionInicio; }

    public String getFechaRecepcionFin() {
        return fechaRecepcionFin;
    }

    public void setFechaRecepcionFin(String fechaRecepcionFin) {
        this.fechaRecepcionFin = fechaRecepcionFin;
    }

    public String getHoraRecepcion() {
        return horaRecepcion;
    }

    public void setHoraRecepcion(String horaRecepcion) {
        this.horaRecepcion = horaRecepcion;
    }

    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getMotivoDonacion() {
        return motivoDonacion;
    }

    public void setMotivoDonacion(String motivoDonacion) {
        this.motivoDonacion = motivoDonacion;
    }


}

