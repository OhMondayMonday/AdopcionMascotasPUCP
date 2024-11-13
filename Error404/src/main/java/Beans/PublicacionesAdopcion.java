package Beans;

public class PublicacionesAdopcion {
    private int publicacion_id;
    private Mascotas mascota;
    private String lugarEncontrado;
    private String condicionesAdopcion;

    public int getPublicacion_id() { return publicacion_id; }

    public void setPublicacion_id(int publicacion_id) { this.publicacion_id = publicacion_id; }

    public Mascotas getMascota() { return mascota; }

    public void setMascota(Mascotas mascota) { this.mascota = mascota; }

    public String getLugarEncontrado() { return lugarEncontrado; }

    public void setLugarEncontrado(String lugarEncontrado) { this.lugarEncontrado = lugarEncontrado; }

    public String getCondicionesAdopcion() { return condicionesAdopcion; }

    public void setCondicionesAdopcion(String condicionesAdopcion) { this.condicionesAdopcion = condicionesAdopcion; }

}

