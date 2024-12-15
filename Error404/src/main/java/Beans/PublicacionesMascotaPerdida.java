package Beans;

import java.util.Date;

public class PublicacionesMascotaPerdida {
    private int publicacion_id;
    private Mascotas mascota;
    private String lugarPerdida;
    private Date fechaPerdida;
    private String descripcionAdicional;
    private int telefonoContacto;
    private String nombreContacto;
    private String recompensa;
    private boolean mascotaEncontrada;
    private Usuarios usuarios;

    public Usuarios getUsuarios() {
        return usuarios;
    }
    public void setUsuarios(Usuarios usuarios) {
        this.usuarios = usuarios;
    }

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

    public Date getFechaPerdida() { return (Date) fechaPerdida; }

    public void setFechaPerdida(Date fechaPerdida) {
        this.fechaPerdida = fechaPerdida;
    }

    public String getDescripcionAdicional() {
        return descripcionAdicional;
    }

    public void setDescripcionAdicional(String descripcionAdicional) { this.descripcionAdicional = descripcionAdicional; }

    public int getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(int telefonoContacto) {
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

