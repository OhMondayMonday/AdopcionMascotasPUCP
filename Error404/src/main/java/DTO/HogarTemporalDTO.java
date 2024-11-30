package DTO;
import java.util.Date;

public class HogarTemporalDTO {
    private int hogarId;
    private String nombre;
    private String apellido;
    private String direccion;
    private String estadoTemporal;
    private Date fechaSolicitud;
    private String tipoSolicitud;
    private int edad;
    private String genero;
    private String celular;
    private String mascota;  // Nuevo campo

    // Constructor actualizado con el nuevo campo `mascota`
    public HogarTemporalDTO(int hogarId, String nombre, String apellido, String direccion,
                            String estadoTemporal, Date fechaSolicitud, String tipoSolicitud,
                            int edad, String genero, String celular, String mascota) {
        this.hogarId = hogarId;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.estadoTemporal = estadoTemporal;
        this.fechaSolicitud = fechaSolicitud;
        this.tipoSolicitud = tipoSolicitud;
        this.edad = edad;
        this.genero = genero;
        this.celular = celular;
        this.mascota = mascota;  // Establecer el nuevo campo `mascota`
    }

    // Getters y setters
    public String getMascota() {
        return mascota;
    }

    public void setMascota(String mascota) {
        this.mascota = mascota;
    }
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

    public String getEstadoTemporal() {
        return estadoTemporal ;
    }

    public void setEstadoTemporal(String estadoHogar) {
        this.estadoTemporal  = estadoHogar;
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
                + ", direccion=" + direccion + ", estadoHogar=" + estadoTemporal  + ", fechaSolicitud=" + fechaSolicitud + ", tipoSolicitud=" + tipoSolicitud + "]";
    }
}


