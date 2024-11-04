package beans;

public class PublicacionesAdopcion {
    private int publicacionId;
    private int mascotaId;
    private String lugarEncontrado;
    private String condicionesAdopcion;

    public PublicacionesAdopcion(int publicacionId, int mascotaId, String lugarEncontrado, String condicionesAdopcion) {
        this.publicacionId = publicacionId;
        this.mascotaId = mascotaId;
        this.lugarEncontrado = lugarEncontrado;
        this.condicionesAdopcion = condicionesAdopcion;
    }

    public int getPublicacionId() {
        return publicacionId;
    }

    public void setPublicacionId(int publicacionId) {
        this.publicacionId = publicacionId;
    }

    public int getMascotaId() {
        return mascotaId;
    }

    public void setMascotaId(int mascotaId) {
        this.mascotaId = mascotaId;
    }

    public String getLugarEncontrado() {
        return lugarEncontrado;
    }

    public void setLugarEncontrado(String lugarEncontrado) {
        this.lugarEncontrado = lugarEncontrado;
    }

    public String getCondicionesAdopcion() {
        return condicionesAdopcion;
    }

    public void setCondicionesAdopcion(String condicionesAdopcion) {
        this.condicionesAdopcion = condicionesAdopcion;
    }
}

