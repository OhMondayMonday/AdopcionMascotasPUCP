package Beans;

import java.sql.Time;
import java.sql.Timestamp;

public class Fotos {
    private int fotoId;
    private String urlFoto;
    private Timestamp fechaSubida;

    // Constructor vacío
    public Fotos() {}

    // Constructor con urlFoto
    public Fotos(String urlFoto) {
        this.urlFoto = urlFoto;
    }

    public int getFotoId() {
        return fotoId;
    }

    public void setFotoId(int fotoId) {
        this.fotoId = fotoId;
    }

    public String getUrlFoto() {
        return urlFoto;
    }

    public void setUrlFoto(String urlFoto) {
        this.urlFoto = urlFoto;
    }

    public Timestamp getFechaSubida() {
        return fechaSubida;
    }

    public void setFechaSubida(Timestamp fechaSubida) {
        this.fechaSubida = fechaSubida;
    }

}

