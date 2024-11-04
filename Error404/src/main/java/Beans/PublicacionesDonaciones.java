package Beans;

public class PublicacionesDonaciones {
    private int publicacionId;
    private String puntoAcopio;
    private int tipoDonacionId;
    private double cantidad;
    private String marca;
    private String fechaRecepcionInicio;
    private String fechaRecepcionFin;
    private String horaRecepcion;
    private String telefonoContacto;
    private String nombreContacto;
    private String motivoDonacion;

    public int getPublicacionId() {
        return publicacionId;
    }

    public void setPublicacionId(int publicacionId) {
        this.publicacionId = publicacionId;
    }

    public String getPuntoAcopio() {
        return puntoAcopio;
    }

    public void setPuntoAcopio(String puntoAcopio) {
        this.puntoAcopio = puntoAcopio;
    }

    public int getTipoDonacionId() {
        return tipoDonacionId;
    }

    public void setTipoDonacionId(int tipoDonacionId) {
        this.tipoDonacionId = tipoDonacionId;
    }

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

    public void setFechaRecepcionInicio(String fechaRecepcionInicio) {
        this.fechaRecepcionInicio = fechaRecepcionInicio;
    }

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

