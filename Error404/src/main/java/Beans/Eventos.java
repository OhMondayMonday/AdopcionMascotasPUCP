package Beans;

public class Eventos {
    private int eventId;
    private Usuarios usuario;
    private String nombreEvento;
    private String fechaEvento;
    private String horaEvento;
    private Fotos foto;
    private LugaresEventos lugarEvento;
    private String entrada;
    private String descripcionEvento;
    private String artistasProveedores;
    private String razonEvento;
    private String fechaCreacion;
    private String estadoEvento;

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

    public String getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(String fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public String getHoraEvento() {
        return horaEvento;
    }

    public void setHoraEvento(String horaEvento) {
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

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getEstadoEvento() {
        return estadoEvento;
    }

    public void setEstadoEvento(String estadoEvento) {
        this.estadoEvento = estadoEvento;
    }


// Getters y Setters para todos los campos
}

