package Beans;

public class TiposEventos {

    private int tipo_id;
    private String nombre_tipo;

    public int getTipoEventoId(){
        return tipo_id;
    }

    public void setTipoEventoId(int tipo_id){
        this.tipo_id = tipo_id;
    }

    public String getNombre_tipo(){
        return nombre_tipo;
    }

    public void setNombre_tipo(String nombre_tipo){
        this.nombre_tipo = nombre_tipo;
    }

}
