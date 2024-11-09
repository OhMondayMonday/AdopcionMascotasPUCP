package Beans;

public class Mascotas {
    private int mascotaId;
    private String nombre;
    private Razas raza;
    private String descripcion;
    private Fotos foto;
    private int edadAproximada;
    private String genero;
    private String tamanio;
    private String distintivo;
    private boolean enHogarTemporal;

    public int getMascotaId() {
        return mascotaId;
    }

    public void setMascotaId(int mascotaId) {
        this.mascotaId = mascotaId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Razas getRaza() { return raza; }

    public void setRaza(Razas raza) { this.raza = raza; }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Fotos getFoto() { return foto; }

    public void setFoto(Fotos foto) { this.foto = foto; }

    public int getEdadAproximada() {
        return edadAproximada;
    }

    public void setEdadAproximada(int edadAproximada) {
        this.edadAproximada = edadAproximada;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTamanio() {
        return tamanio;
    }

    public void setTamanio(String tamanio) {
        this.tamanio = tamanio;
    }

    public String getDistintivo() {
        return distintivo;
    }

    public void setDistintivo(String distintivo) {
        this.distintivo = distintivo;
    }

    public boolean isEnHogarTemporal() {
        return enHogarTemporal;
    }

    public void setEnHogarTemporal(boolean enHogarTemporal) {
        this.enHogarTemporal = enHogarTemporal;
    }

}

