package Beans;

public class InscripcionesEventos {
    private int inscripcionId;
    private Eventos evento;
    private Usuarios usuario;
    private String fechaInscripcion;
    private boolean activa;

    public int getInscripcionId() {
        return inscripcionId;
    }

    public void setInscripcionId(int inscripcionId) {
        this.inscripcionId = inscripcionId;
    }

    public Eventos getEvento() { return evento; }

    public void setEvento(Eventos evento) { this.evento = evento; }

    public Usuarios getUsuario() { return usuario; }

    public void setUsuario(Usuarios usuario) { this.usuario = usuario; }

    public String getFechaInscripcion() {
        return fechaInscripcion;
    }

    public void setFechaInscripcion(String fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }

    public boolean isActiva() {
        return activa;
    }

    public void setActiva(boolean activa) {
        this.activa = activa;
    }

}

