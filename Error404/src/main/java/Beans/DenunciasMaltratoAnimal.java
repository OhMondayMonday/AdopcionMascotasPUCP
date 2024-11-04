package Beans;

public class DenunciasMaltratoAnimal {
    private int reportId;
    private int userId;
    private String descripcion;
    private String tipoMaltrato;
    private String nombreMaltratador;
    private String direccionMaltrato;
    private String tamanio;
    private String animal;
    private String tipoRaza;
    private boolean denunciaPolicial;
    private String fechaDenuncia;

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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public String getTamanio() {
        return tamanio;
    }

    public void setTamanio(String tamanio) {
        this.tamanio = tamanio;
    }

    public String getAnimal() {
        return animal;
    }

    public void setAnimal(String animal) {
        this.animal = animal;
    }

    public String getTipoRaza() {
        return tipoRaza;
    }

    public void setTipoRaza(String tipoRaza) {
        this.tipoRaza = tipoRaza;
    }

    public boolean isDenunciaPolicial() {
        return denunciaPolicial;
    }

    public void setDenunciaPolicial(boolean denunciaPolicial) {
        this.denunciaPolicial = denunciaPolicial;
    }

    public String getFechaDenuncia() {
        return fechaDenuncia;
    }

    public void setFechaDenuncia(String fechaDenuncia) {
        this.fechaDenuncia = fechaDenuncia;
    }
// Getters y Setters para todos los campos

    public DenunciasMaltratoAnimal(int reportId, int userId, String descripcion, String tipoMaltrato, String ) {}

}

