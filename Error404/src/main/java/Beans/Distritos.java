package Beans;

public class Distritos {
    private int distritoId;
    private String nombreDistrito;
    private Zonas zona;

    public int getDistritoId() {
        return distritoId;
    }

    public void setDistritoId(int distritoId) {
        this.distritoId = distritoId;
    }

    public String getNombreDistrito() {
        return nombreDistrito;
    }

    public void setNombreDistrito(String nombreDistrito) {
        this.nombreDistrito = nombreDistrito;
    }

    public Zonas getZona() { return zona;}

    public void setZona(Zonas zona) { this.zona = zona;}
}

