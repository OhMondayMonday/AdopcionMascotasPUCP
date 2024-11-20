package Beans;
import java.sql.Date;
import java.sql.Time;

public class Eventos {

    private int eventId;

    private Usuarios usuario;
    private TiposEventos tipoEvento;
    private LugaresEventos lugarEvento;
    private Fotos foto;

    private String nombreEvento;
    private Date fechaEvento;
    private Time horaEvento;
    private Date fechaFin;
    private Time horaFin;
    private String entrada;
    private String descripcionEvento;
    private String artistasProveedores;
    private String razonEvento;
    private Date fechaCreacion;
    private String estadoEvento;
    private String urlFoto;

    // eventID
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    // Usuario
    public Usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }

    // Tipo Evento
    public TiposEventos getTipoEvento() {
        return tipoEvento;
    }

    public void setTipoEvento(TiposEventos tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

    // Lugar Evento
    public LugaresEventos getLugarEvento() { return lugarEvento; }

    public void setLugarEvento(LugaresEventos lugarEvento) {
        this.lugarEvento = lugarEvento;
    }

    // Fotos
    public Fotos getFoto() {
        return foto;
    }

    public void setFoto(Fotos foto) {
        this.foto = foto;
    }

    // Nombre Evento
    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    // Fecha Evento
    public Date getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(Date fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    // Hora Inicio Evento
    public Time getHoraEvento() {
        return horaEvento;
    }

    public void setHoraEvento(Time horaEvento) {
        this.horaEvento = horaEvento;
    }

    // Fecha Fin
    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    // Hora Fin
    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
    }

    // Entrada
    public String getEntrada() {
        return entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }

    // Descripción Evento
    public String getDescripcionEvento() {
        return descripcionEvento;
    }

    public void setDescripcionEvento(String descripcionEvento) {
        this.descripcionEvento = descripcionEvento;
    }

    // Artistas
    public String getArtistasProveedores() {
        return artistasProveedores;
    }

    public void setArtistasProveedores(String artistasProveedores) {
        this.artistasProveedores = artistasProveedores;
    }

    // Razón del Evento
    public String getRazonEvento() {
        return razonEvento;
    }

    public void setRazonEvento(String razonEvento) {
        this.razonEvento = razonEvento;
    }

    // Fecha Creación Evento
    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    // Estado del evento
    public String getEstadoEvento() {
        return estadoEvento;
    }

    public void setEstadoEvento(String estadoEvento) {
        this.estadoEvento = estadoEvento;
    }

    // Foto del Evento
    public String getUrlFoto() {
        return urlFoto;
    }

    public void setUrlFoto(String urlFoto) {
        this.urlFoto = urlFoto;
    }
}

