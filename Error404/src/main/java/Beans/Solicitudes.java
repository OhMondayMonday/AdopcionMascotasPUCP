package Beans;

import java.util.Date;

public class Solicitudes {
    private int solicitudId;
    private TiposSolicitudes tipoSolicitud;
    private Usuarios solicitante;
    private Usuarios solicitado;
    private String nombreAlbergue;
    private String nombreEncargado;
    private String apellidoEncargado;
    private String email;
    private String fechaSolicitud;
    private String estadoSolicitud;
    private String comentarioSolicitud;
    private Mascotas mascota;
    private double cantidad;
    private Date fechaEntrega;
    private String puntoEntregaSeleccionado;
    private double dineroDonado;

    public int getSolicitudId() {
        return solicitudId;
    }

    public void setSolicitudId(int solicitudId) {
        this.solicitudId = solicitudId;
    }

    public TiposSolicitudes getTipoSolicitud() { return tipoSolicitud; }

    public void setTipoSolicitud(TiposSolicitudes tipoSolicitud) { this.tipoSolicitud = tipoSolicitud; }

    public Usuarios getSolicitante() { return solicitante; }

    public void setSolicitante(Usuarios solicitante) { this.solicitante = solicitante; }

    public Usuarios getSolicitado() { return solicitado; }

    public void setSolicitado(Usuarios solicitado) { this.solicitado = solicitado; }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public String getNombreEncargado() {
        return nombreEncargado;
    }

    public void setNombreEncargado(String nombreEncargado) {
        this.nombreEncargado = nombreEncargado;
    }

    public String getApellidoEncargado() {
        return apellidoEncargado;
    }

    public void setApellidoEncargado(String apellidoEncargado) {
        this.apellidoEncargado = apellidoEncargado;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(String fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }

    public String getComentarioSolicitud() {
        return comentarioSolicitud;
    }

    public void setComentarioSolicitud(String comentarioSolicitud) {
        this.comentarioSolicitud = comentarioSolicitud;
    }

    public Mascotas getMascota() { return mascota; }

    public void setMascota(Mascotas mascota) { this.mascota = mascota; }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getPuntoEntregaSeleccionado() {
        return puntoEntregaSeleccionado;
    }

    public void setPuntoEntregaSeleccionado(String puntoEntregaSeleccionado) { this.puntoEntregaSeleccionado = puntoEntregaSeleccionado; }

    public double getDineroDonado() {
        return dineroDonado;
    }

    public void setDineroDonado(double dineroDonado) {
        this.dineroDonado = dineroDonado;
    }
}
