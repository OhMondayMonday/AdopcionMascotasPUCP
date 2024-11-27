package Daos;

import Beans.PublicacionesDonaciones;
import Beans.TiposDonaciones;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DonacionesDAO extends BaseDao{

    public PublicacionesDonaciones obtenerPublicacionDonacion(int id){
        PublicacionesDonaciones publicacionDonacion = new PublicacionesDonaciones();

        String query = "SELECT * FROM publicaciones_donaciones pd\n" +
                "JOIN tipos_donaciones td ON pd.tipo_donacion_id = pd.tipo_donacion_id\n" +
                "WHERE pd.publicacion_id = ?";

        try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                publicacionDonacion.setPublicacion_id(rs.getInt("pd.publicacion_id"));
                publicacionDonacion.setPuntoAcopio(rs.getString("pd.punto_acopio"));

                TiposDonaciones tiposDonaciones = new TiposDonaciones();
                tiposDonaciones.setTipoDonacionId(rs.getInt("td.tipo_donacion_id"));
                tiposDonaciones.setTipoDonacion(rs.getString("td.tipo_donacion"));
                publicacionDonacion.setTipoDonacion(tiposDonaciones);

                if(rs.getDouble("pd.cantidad")!= 0){
                    publicacionDonacion.setCantidad(rs.getDouble("pd.cantidad"));
                }
                if(rs.getString("pd.marca")!=null){
                    publicacionDonacion.setMarca(rs.getString("pd.marca"));
                }
                publicacionDonacion.setFechaRecepcionInicio(rs.getDate("pd.fecha_recepcion_inicio"));
                publicacionDonacion.setFechaRecepcionFin(rs.getDate("pd.fecha_recepcion_fin"));
                publicacionDonacion.setHoraRecepcion(rs.getTime("pd.hora_recepcion"));
                publicacionDonacion.setTelefonoContacto(rs.getString("pd.telefono_contacto"));
                publicacionDonacion.setNombreContacto(rs.getString("pd.nombre_contacto"));
                if(rs.getString("pd.motivo_donacion")!=null){
                    publicacionDonacion.setMotivoDonacion(rs.getString("pd.motivo_donacion"));
                }
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return publicacionDonacion;
    }
}
