package Beans;

import java.sql.Time;
import java.util.Date;

public class PublicacionesDonaciones {
    private int publicacion_id;
    private String puntoAcopio;
    private TiposDonaciones tipoDonacion;
    private double cantidad;
    private String marca;
    private Date fechaRecepcionInicio;
    private Date fechaRecepcionFin;
    private Time horaRecepcion;
    private String telefonoContacto;
    private String nombreContacto;
    private String motivoDonacion;

    public int getPublicacion_id() { return publicacion_id; }

    public void setPublicacion_id(int publicacion_id) { this.publicacion_id = publicacion_id; }

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

    public Date getFechaRecepcionInicio() {
        return fechaRecepcionInicio;
    }

    public void setFechaRecepcionInicio(Date fechaRecepcionInicio) { this.fechaRecepcionInicio = fechaRecepcionInicio; }

    public Date getFechaRecepcionFin() {
        return fechaRecepcionFin;
    }

    public void setFechaRecepcionFin(Date fechaRecepcionFin) {
        this.fechaRecepcionFin = fechaRecepcionFin;
    }

    public Time getHoraRecepcion() {
        return horaRecepcion;
    }

    public void setHoraRecepcion(Time horaRecepcion) {
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

