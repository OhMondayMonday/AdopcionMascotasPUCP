package Beans;

import javax.xml.crypto.Data;
import java.sql.Timestamp;
import java.util.Date;

public class HogaresTemporales {
    private int temporalId;
    private Usuarios usuario;
    private Fotos foto;
    private int edad;
    private String genero;
    private String celular;
    private String direccion;
    private Distritos distrito;
    private int cantidadCuartos;
    private double metrajeVivienda;
    private boolean tieneMascotas;
    private int cantidadMascotas;
    private String tipoMascotas;
    private boolean tieneHijos;
    private boolean viveSolo;
    private String trabaja;
    private String personaReferencia;
    private String contactoReferencia;
    private int tiempoTemporal;
    private Date rangoFechaInicio;
    private Date rangoFechaFin;
    private String estadoTemporal;
    private Timestamp fechaAprobacion;

    public int getTemporalId() {
        return temporalId;
    }

    public void setTemporalId(int temporalId) {
        this.temporalId = temporalId;
    }

    public Usuarios getUsuario() { return usuario; }

    public void setUsuario(Usuarios usuario) { this.usuario = usuario; }

    public Fotos getFoto() { return foto; }

    public void setFoto(Fotos foto) { this.foto = foto; }

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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Distritos getDistrito() { return distrito; }

    public void setDistrito(Distritos distrito) { this.distrito = distrito; }

    public int getCantidadCuartos() {
        return cantidadCuartos;
    }

    public void setCantidadCuartos(int cantidadCuartos) {
        this.cantidadCuartos = cantidadCuartos;
    }

    public double getMetrajeVivienda() {
        return metrajeVivienda;
    }

    public void setMetrajeVivienda(double metrajeVivienda) {
        this.metrajeVivienda = metrajeVivienda;
    }

    public boolean isTieneMascotas() {
        return tieneMascotas;
    }

    public void setTieneMascotas(boolean tieneMascotas) {
        this.tieneMascotas = tieneMascotas;
    }

    public Integer getCantidadMascotas() {
        return cantidadMascotas;
    }

    public void setCantidadMascotas(Integer cantidadMascotas) {
        this.cantidadMascotas = cantidadMascotas;
    }

    public String getTipoMascotas() {
        return tipoMascotas;
    }

    public void setTipoMascotas(String tipoMascotas) {
        this.tipoMascotas = tipoMascotas;
    }

    public boolean isTieneHijos() {
        return tieneHijos;
    }

    public void setTieneHijos(boolean tieneHijos) {
        this.tieneHijos = tieneHijos;
    }

    public boolean isViveSolo() {
        return viveSolo;
    }

    public void setViveSolo(boolean viveSolo) {
        this.viveSolo = viveSolo;
    }

    public String getTrabaja() {
        return trabaja;
    }

    public void setTrabaja(String trabaja) {
        this.trabaja = trabaja;
    }

    public String getPersonaReferencia() {
        return personaReferencia;
    }

    public void setPersonaReferencia(String personaReferencia) {
        this.personaReferencia = personaReferencia;
    }

    public String getContactoReferencia() {
        return contactoReferencia;
    }

    public void setContactoReferencia(String contactoReferencia) {
        this.contactoReferencia = contactoReferencia;
    }

    public int getTiempoTemporal() {
        return tiempoTemporal;
    }

    public void setTiempoTemporal(int tiempoTemporal) {
        this.tiempoTemporal = tiempoTemporal;
    }

    public Date getRangoFechaInicio() {
        return rangoFechaInicio;
    }

    public void setRangoFechaInicio(Date rangoFechaInicio) {
        this.rangoFechaInicio = rangoFechaInicio;
    }

    public Date getRangoFechaFin() {
        return rangoFechaFin;
    }

    public void setRangoFechaFin(Date rangoFechaFin) {
        this.rangoFechaFin = rangoFechaFin;
    }

    public String getEstadoTemporal() {
        return estadoTemporal;
    }

    public void setEstadoTemporal(String estadoTemporal) {
        this.estadoTemporal = estadoTemporal;
    }

    public Timestamp getFechaAprobacion() {
        return fechaAprobacion;
    }

    public void setFechaAprobacion(Timestamp fechaAprobacion) {
        this.fechaAprobacion = fechaAprobacion;
    }

}

