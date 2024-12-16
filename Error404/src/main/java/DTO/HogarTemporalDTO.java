package DTO;

import java.util.Date;

public class HogarTemporalDTO {
    private int temporalId;
    private int solicitudId;
    private String nombre;
    private String apellido;
    private String direccion;
    private String estadoTemporal;
    private Date fechaSolicitud;
    private String tipoSolicitud;
    private String estado_publicacion;
    private int edad;
    private String genero;
    private String celular;
    private String mascota;  // Campo existente
    private Date fechaPerdida;      // Nuevo campo
    private String lugarPerdida;    // Nuevo campo
    private String descripcionAdicional; // Nuevo campo
    private String telefonoContacto; // Nuevo campo
    private String nombreContacto;   // Nuevo campo
    private String recompensa;       // Nuevo campo


    // Constructor actualizado con campos adicionales
    public HogarTemporalDTO(int solicitudId,int temporalId, String nombre, String apellido, String direccion,
                            String estadoTemporal, Date fechaSolicitud, String tipoSolicitud,
                            int edad, String genero, String celular, String mascota,
                            Date fechaPerdida, String lugarPerdida,
                            String descripcionAdicional, String telefonoContacto,
                            String nombreContacto, String recompensa, String estado_publicacion) {
        this.estado_publicacion = estado_publicacion;
        this.solicitudId = solicitudId;
        this.temporalId = temporalId;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.estadoTemporal = estadoTemporal;
        this.fechaSolicitud = fechaSolicitud;
        this.tipoSolicitud = tipoSolicitud;
        this.edad = edad;
        this.genero = genero;
        this.celular = celular;
        this.mascota = mascota;
        this.fechaPerdida = fechaPerdida;
        this.lugarPerdida = lugarPerdida;
        this.descripcionAdicional = descripcionAdicional;
        this.telefonoContacto = telefonoContacto;
        this.nombreContacto = nombreContacto;
        this.recompensa = recompensa;
    }


    // Getters y Setters para los nuevos campos
    public int getSolicitudId() {
        return solicitudId;
    }

    public void setSolicitudId(int solicitudId) {
        this.solicitudId = solicitudId;
    }


    public Date getFechaPerdida() {
        return fechaPerdida;
    }

    public void setFechaPerdida(Date fechaPerdida) {
        this.fechaPerdida = fechaPerdida;
    }

    public String getLugarPerdida() {
        return lugarPerdida;
    }

    public void setLugarPerdida(String lugarPerdida) {
        this.lugarPerdida = lugarPerdida;
    }

    public String getDescripcionAdicional() {
        return descripcionAdicional;
    }

    public void setDescripcionAdicional(String descripcionAdicional) {
        this.descripcionAdicional = descripcionAdicional;
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

    public String getRecompensa() {
        return recompensa;
    }

    public void setRecompensa(String recompensa) {
        this.recompensa = recompensa;
    }

    // Getters y setters existentes
    public String getMascota() {
        return mascota;
    }

    public void setMascota(String mascota) {
        this.mascota = mascota;
    }

    public int getTemporalId() {
        return temporalId;
    }

    public void setTemporalId(int temporalId) {
        this.temporalId = temporalId;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEstadoTemporal() {
        return estadoTemporal;
    }

    public void setEstadoTemporal(String estadoTemporal) {
        this.estadoTemporal = estadoTemporal;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Date fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getTipoSolicitud() {
        return tipoSolicitud;
    }

    public void setTipoSolicitud(String tipoSolicitud) {
        this.tipoSolicitud = tipoSolicitud;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    @Override
    public String toString() {
        return "HogarTemporalDTO [temporal_id=" + temporalId + ", nombre=" + nombre + ", apellido=" + apellido
                + ", direccion=" + direccion + ", estadoTemporal=" + estadoTemporal + ", fechaSolicitud="
                + fechaSolicitud + ", tipoSolicitud=" + tipoSolicitud + ", mascota=" + mascota
                + ", solicitudId=" + ", fechaPerdida=" + fechaPerdida
                + ", lugarPerdida=" + lugarPerdida + ", descripcionAdicional=" + descripcionAdicional
                + ", telefonoContacto=" + telefonoContacto + ", nombreContacto=" + nombreContacto
                + ", recompensa=" + recompensa + "]";
    }
}
