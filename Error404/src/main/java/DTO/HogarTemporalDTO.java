package DTO;
import java.util.Date;

public class HogarTemporalDTO {
    private int hogarId;
    private String nombre;
    private String apellido;
    private String direccion;
    private String estadoHogar;
    private Date fechaSolicitud;  // Usamos Date para almacenar la fecha
    private String tipoSolicitud;
    private int edad;  // Nuevo campo para edad
    private String genero;  // Nuevo campo para genero
    private String celular;  // Nuevo campo para celular

    // Constructor
    public HogarTemporalDTO(int hogarId, String nombre, String apellido, String direccion,
                            String estadoHogar, Date fechaSolicitud, String tipoSolicitud,
                            int edad, String genero, String celular) {
        this.hogarId = hogarId;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.estadoHogar = estadoHogar;
        this.fechaSolicitud = fechaSolicitud;
        this.tipoSolicitud = tipoSolicitud;
        this.edad = edad;
        this.genero = genero;
        this.celular = celular;
    }

    // Getters y setters
    public int getHogarId() {
        return hogarId;
    }

    public void setHogarId(int hogarId) {
        this.hogarId = hogarId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String usuarioNombre) {
        this.nombre = usuarioNombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEstadoHogar() {
        return estadoHogar;
    }

    public void setEstadoHogar(String estadoHogar) {
        this.estadoHogar = estadoHogar;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Date fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getTipoSolicitud() {
        return tipoSolicitud;
    }

    public void setTipoSolicitud(String tipoSolicitud) {
        this.tipoSolicitud = tipoSolicitud;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    @Override
    public String toString() {
        return "HogarTemporalDTO [hogarId=" + hogarId + ", nombre=" + nombre + ", apellido=" + apellido
                + ", direccion=" + direccion + ", estadoHogar=" + estadoHogar + ", fechaSolicitud=" + fechaSolicitud + ", tipoSolicitud=" + tipoSolicitud + "]";
    }
}


