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
                publicacionDonacion.setTelefonoContacto(rs.getInt("pd.telefono_contacto"));
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

    public void agregarPublicacion(PublicacionesDonaciones donacion){
        String sql = "INSERT INTO publicaciones_donaciones(publicacion_id, punto_acopio, tipo_donacion_id, cantidad, marca, fecha_recepcion_inicio, fecha_recepcion_fin, hora_recepcion,  telefono_contacto, nombre_contacto, motivo_donacion) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, donacion.getPublicacion_id());
            pstmt.setString(2, donacion.getPuntoAcopio());
            pstmt.setInt(3, donacion.getTipoDonacion().getTipoDonacionId());
            pstmt.setDouble(4, donacion.getCantidad());
            pstmt.setString(5, donacion.getMarca());
            pstmt.setDate(6, new java.sql.Date(donacion.getFechaRecepcionInicio().getTime()));
            pstmt.setDate(7, new java.sql.Date(donacion.getFechaRecepcionFin().getTime()));
            pstmt.setTime(8, donacion.getHoraRecepcion());
            pstmt.setInt(9, donacion.getTelefonoContacto());
            pstmt.setString(10, donacion.getNombreContacto());
            pstmt.setString(11, donacion.getMotivoDonacion());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarDonacion (PublicacionesDonaciones donacion){
        String sql = "UPDATE publicaciones_donaciones SET punto_acopio=?, tipo_donacion_id=?, cantidad=?, marca=?, fecha_recepción_inicio=?, fecha_recepcion_fin=?, hora_recepcion=?, telefono_contacto=?, nombre_contacto=?, motivo_donacion=? WHERE publicacion_id=?";
        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, donacion.getPuntoAcopio());
            pstmt.setInt(2, donacion.getTipoDonacion().getTipoDonacionId());
            pstmt.setDouble(3, donacion.getCantidad());
            pstmt.setString(4, donacion.getMarca());
            pstmt.setDate(5, new java.sql.Date(donacion.getFechaRecepcionInicio().getTime()));
            pstmt.setDate(6, new java.sql.Date(donacion.getFechaRecepcionFin().getTime()));
            pstmt.setTime(7, donacion.getHoraRecepcion());
            pstmt.setInt(8, donacion.getTelefonoContacto());
            pstmt.setString(9, donacion.getNombreContacto());
            pstmt.setString(10, donacion.getMotivoDonacion());
            pstmt.setInt(11, donacion.getPublicacion_id());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
