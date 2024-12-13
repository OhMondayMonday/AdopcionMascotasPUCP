package Beans;

import java.sql.Timestamp;

public class DenunciasMaltratoAnimal {
    private int reportId;
    private int userId;
    private String tipoMaltrato;
    private String nombreMaltratador;
    private String direccionMaltrato;
    private Mascotas mascota;
    private boolean denunciaPolicial;
    private Timestamp fechaDenuncia;

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTipoMaltrato() {
        return tipoMaltrato;
    }

    public void setTipoMaltrato(String tipoMaltrato) {
        this.tipoMaltrato = tipoMaltrato;
    }

    public String getNombreMaltratador() {
        return nombreMaltratador;
    }

    public void setNombreMaltratador(String nombreMaltratador) {
        this.nombreMaltratador = nombreMaltratador;
    }

    public String getDireccionMaltrato() {
        return direccionMaltrato;
    }

    public void setDireccionMaltrato(String direccionMaltrato) {
        this.direccionMaltrato = direccionMaltrato;
    }

    public boolean isDenunciaPolicial() {
        return denunciaPolicial;
    }

    public void setDenunciaPolicial(boolean denunciaPolicial) {
        this.denunciaPolicial = denunciaPolicial;
    }

    public Timestamp getFechaDenuncia() {
        return fechaDenuncia;
    }

    public void setFechaDenuncia(Timestamp fechaDenuncia) {
        this.fechaDenuncia = fechaDenuncia;
    }

    public Mascotas getMascota() { return mascota; }

    public void setMascota(Mascotas mascota) { this.mascota = mascota; }
}

