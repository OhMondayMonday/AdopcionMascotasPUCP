package Beans;

import java.sql.Timestamp;

public class Comentarios {
    private int comentarioId; // Identificador único del comentario
    private int publicacionId; // ID de la publicación asociada
    private int usuarioId; // ID del coordinador que hizo el comentario
    private String comentario; // Contenido del comentario
    private Timestamp fechaActualizacion; // Fecha y hora del comentario

    public int getComentarioId() {
        return comentarioId;
    }
    public void setComentarioId(int comentarioId) {
        this.comentarioId = comentarioId;
    }
    public int getPublicacionId() {
        return publicacionId;
    }
    public void setPublicacionId(int publicacionId) {
        this.publicacionId = publicacionId;
    }
    public int getUsuarioId() {
        return usuarioId;
    }
    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }
    public String getComentario() {
        return comentario;
    }
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    public Timestamp getFechaActualizacion(){
        return fechaActualizacion;
    }
    public void setFechaActualizacion(Timestamp fechaActualizacion){
        this.fechaActualizacion = fechaActualizacion;
    }

}
