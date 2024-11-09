package Beans;

public class LugaresEventos {
    private int lugarId;
    private Distritos distrito;
    private String nombreLugar;
    private Fotos foto;
    private int aforoMaximo;
    private String direccionLugar;
    private boolean activo;

    public int getLugarId() {
        return lugarId;
    }

    public void setLugarId(int lugarId) {
        this.lugarId = lugarId;
    }

    public Distritos getDistrito() { return distrito; }

    public void setDistrito(Distritos distrito) { this.distrito = distrito; }

    public String getNombreLugar() {
        return nombreLugar;
    }

    public void setNombreLugar(String nombreLugar) {
        this.nombreLugar = nombreLugar;
    }

    public Fotos getFoto() { return foto; }

    public void setFoto(Fotos foto) { this.foto = foto; }

    public int getAforoMaximo() {
        return aforoMaximo;
    }

    public void setAforoMaximo(int aforoMaximo) {
        this.aforoMaximo = aforoMaximo;
    }

    public String getDireccionLugar() {
        return direccionLugar;
    }

    public void setDireccionLugar(String direccionLugar) {
        this.direccionLugar = direccionLugar;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

}

