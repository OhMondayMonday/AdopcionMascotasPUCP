package Beans;

import java.sql.Timestamp;

public class Publicaciones {
    private int publicacionId;
    private Usuarios usuario;
    private String titulo;
    private String descripcion;
    private Fotos foto;
    private String comentario;
    private Timestamp fechaCreacion;
    private TiposPublicaciones tipoPublicacion;
    private String estadoPublicacion;

    public int getPublicacionId() {
        return publicacionId;
    }

    public void setPublicacionId(int publicacionId) {
        this.publicacionId = publicacionId;
    }

    public Usuarios getUsuario() { return usuario; }

    public void setUsuario(Usuarios usuario) { this.usuario = usuario; }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Fotos getFoto() { return foto; }

    public void setFoto(Fotos foto) { this.foto = foto; }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public TiposPublicaciones getTipoPublicacion() { return tipoPublicacion; }

    public void setTipoPublicacion(TiposPublicaciones tipoPublicacion) { this.tipoPublicacion = tipoPublicacion; }

    public String getEstadoPublicacion() {
        return estadoPublicacion;
    }

    public void setEstadoPublicacion(String estadoPublicacion) {
        this.estadoPublicacion = estadoPublicacion;
    }

}

