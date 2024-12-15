package Beans;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

public class Solicitudes {
    private int solicitudId;
    private TiposSolicitudes tipoSolicitud;
    private Usuarios solicitante;
    private Usuarios solicitado;
    private String username;
    private String nombre;
    private String apellido;
    private String email;
    private String DNI;
    private String direccion;
    private int distrito_id;
    private String nombreAlbergue;
    private String nombreEncargado;
    private String apellidoEncargado;
    private String medioPago;
    private String email_albergue;
    private Timestamp fechaSolicitud;
    private String estadoSolicitud;
    private String comentarioSolicitud;
    private Mascotas mascota;
    private double cantidad;
    private Date fechaEntrega;
    private String puntoEntregaSeleccionado;
    private double dineroDonado;


    public Timestamp getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Timestamp fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getEmail_albergue() {
        return email_albergue;
    }

    public void setEmail_albergue(String email_albergue) {
        this.email_albergue = email_albergue;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getDistrito_id() {
        return distrito_id;
    }

    public void setDistrito_id(int distrito_id) {
        this.distrito_id = distrito_id;
    }

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
