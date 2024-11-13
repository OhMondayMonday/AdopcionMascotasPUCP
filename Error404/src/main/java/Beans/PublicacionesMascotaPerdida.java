package Beans;

import java.util.Date;

public class PublicacionesMascotaPerdida {
    private int publicacion_id;
    private Mascotas mascota;
    private String lugarPerdida;
    private Date fechaPerdida;
    private String descripcionAdicional;
    private String telefonoContacto;
    private String nombreContacto;
    private String recompensa;
    private boolean mascotaEncontrada;

    public int getPublicacion_id() { return publicacion_id; }

    public void setPublicacion_id(int publicacion_id) { this.publicacion_id = publicacion_id; }

    public Mascotas getMascota() { return mascota; }

    public void setMascota(Mascotas mascota) { this.mascota = mascota; }

    public String getLugarPerdida() {
        return lugarPerdida;
    }

    public void setLugarPerdida(String lugarPerdida) {
        this.lugarPerdida = lugarPerdida;
    }

    public Date getFechaPerdida() {
        return fechaPerdida;
    }

    public void setFechaPerdida(Date fechaPerdida) {
        this.fechaPerdida = fechaPerdida;
    }

    public String getDescripcionAdicional() {
        return descripcionAdicional;
    }

    public void setDescripcionAdicional(String descripcionAdicional) { this.descripcionAdicional = descripcionAdicional; }

    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getRecompensa() {
        return recompensa;
    }

    public void setRecompensa(String recompensa) {
        this.recompensa = recompensa;
    }

    public boolean isMascotaEncontrada() {
        return mascotaEncontrada;
    }

    public void setMascotaEncontrada(boolean mascotaEncontrada) {
        this.mascotaEncontrada = mascotaEncontrada;
    }

}

