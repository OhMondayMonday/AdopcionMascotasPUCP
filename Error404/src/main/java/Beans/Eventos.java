package Beans;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;
import java.time.Duration;

public class Eventos {
    private int eventId;
    private Usuarios usuario;
    private String nombreEvento;
    private Date fechaEvento;
    private Time horaEvento;
    private Fotos foto;
    private LugaresEventos lugarEvento;
    private String entrada;
    private String descripcionEvento;
    private String artistasProveedores;
    private String razonEvento;
    private Timestamp fechaCreacion;
    private String estadoEvento;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private Duration duracionEvento;

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public Usuarios getUsuario() { return usuario; }

    public void setUsuario(Usuarios usuario) { this.usuario = usuario; }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public Date getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(Date fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public Time getHoraEvento() {
        return horaEvento;
    }

    public void setHoraEvento(Time horaEvento) {
        this.horaEvento = horaEvento;
    }

    public Fotos getFoto() { return foto; }

    public void setFoto(Fotos foto) { this.foto = foto; }

    public LugaresEventos getLugarEvento() { return lugarEvento; }

    public void setLugarEvento(LugaresEventos lugarEvento) { this.lugarEvento = lugarEvento; }

    public String getEntrada() {
        return entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }

    public String getDescripcionEvento() {
        return descripcionEvento;
    }

    public void setDescripcionEvento(String descripcionEvento) {
        this.descripcionEvento = descripcionEvento;
    }

    public String getArtistasProveedores() {
        return artistasProveedores;
    }

    public void setArtistasProveedores(String artistasProveedores) {
        this.artistasProveedores = artistasProveedores;
    }

    public String getRazonEvento() {
        return razonEvento;
    }

    public void setRazonEvento(String razonEvento) {
        this.razonEvento = razonEvento;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getEstadoEvento() {
        return estadoEvento;
    }

    public void setEstadoEvento(String estadoEvento) {
        this.estadoEvento = estadoEvento;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
        calcularDuracion();
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
        calcularDuracion();
    }

    public Time getDuracionEvento() {
        return duracionEvento;
    }

    private void calcularDuracion() {
        if (horaInicio != null && horaFin != null) {
            duracionEvento = Duration.between(horaInicio, horaFin);
        }
    }

}

