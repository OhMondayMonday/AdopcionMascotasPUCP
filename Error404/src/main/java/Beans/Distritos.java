package Beans;

public class Distritos {
    private Integer distritoId;
    private String nombreDistrito;
    private Zonas zona;

    public Integer getDistritoId() {
        return distritoId;
    }


    public void setDistritoId(Integer distritoId) {
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

