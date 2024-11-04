package beans;

public class Solicitudes {
    private int solicitudId;
    private int tipoSolicitudId;
    private int solicitanteId;
    private Integer solicitadoId;
    private String nombreAlbergue;
    private String nombreEncargado;
    private String apellidoEncargado;
    private String email;
    private String fechaSolicitud;
    private String estadoSolicitud;
    private String comentarioSolicitud;
    private Integer mascotaId;
    private double cantidad;
    private String fechaEntrega;
    private String puntoEntregaSeleccionado;
    private double dineroDonado;

    public int getSolicitudId() {
        return solicitudId;
    }

    public void setSolicitudId(int solicitudId) {
        this.solicitudId = solicitudId;
    }

    public int getTipoSolicitudId() {
        return tipoSolicitudId;
    }

    public void setTipoSolicitudId(int tipoSolicitudId) {
        this.tipoSolicitudId = tipoSolicitudId;
    }

    public int getSolicitanteId() {
        return solicitanteId;
    }

    public void setSolicitanteId(int solicitanteId) {
        this.solicitanteId = solicitanteId;
    }

    public Integer getSolicitadoId() {
        return solicitadoId;
    }

    public void setSolicitadoId(Integer solicitadoId) {
        this.solicitadoId = solicitadoId;
    }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public String getNombreEncargado() {
        return nombreEncargado;
    }

    public void setNombreEncargado(String nombreEncargado) {
        this.nombreEncargado = nombreEncargado;
    }

    public String getApellidoEncargado() {
        return apellidoEncargado;
    }

    public void setApellidoEncargado(String apellidoEncargado) {
        this.apellidoEncargado = apellidoEncargado;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(String fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }

    public String getComentarioSolicitud() {
        return comentarioSolicitud;
    }

    public void setComentarioSolicitud(String comentarioSolicitud) {
        this.comentarioSolicitud = comentarioSolicitud;
    }

    public Integer getMascotaId() {
        return mascotaId;
    }

    public void setMascotaId(Integer mascotaId) {
        this.mascotaId = mascotaId;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getPuntoEntregaSeleccionado() {
        return puntoEntregaSeleccionado;
    }

    public void setPuntoEntregaSeleccionado(String puntoEntregaSeleccionado) {
        this.puntoEntregaSeleccionado = puntoEntregaSeleccionado;
    }

    public double getDineroDonado() {
        return dineroDonado;
    }

    public void setDineroDonado(double dineroDonado) {
        this.dineroDonado = dineroDonado;
    }
}
