package Daos;

import Beans.Fotos;
import Beans.Mascotas;
import Beans.PublicacionesMascotaPerdida;
import Beans.Razas;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MascotaPerdidaDAO extends BaseDao {

    public PublicacionesMascotaPerdida obtenerPublicacionMascotaPerdida(int publicacionId) {
        PublicacionesMascotaPerdida mascotaPerdida = new PublicacionesMascotaPerdida();
        String query = "SELECT * FROM publicaciones_mascota_perdida mp\n" +
                "INNER JOIN mascotas m ON m.mascota_id = mp.mascota_id\n" +
                "INNER JOIN razas r ON r.raza_id = m.raza_id\n" +
                "INNER JOIN fotos f ON m.foto_id = f.foto_id\n" +
                "WHERE mp.publicacion_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)){

            pstmt.setInt(1, publicacionId);

            try (ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    mascotaPerdida.setPublicacion_id(rs.getInt("mp.publicacion_id"));

                    Mascotas mascota = new Mascotas();
                    mascota.setMascotaId(rs.getInt("m.mascota_id"));
                    mascota.setNombre(rs.getString("m.nombre"));

                    Razas raza = new Razas();
                    raza.setRazaId(rs.getInt("r.raza_id"));
                    raza.setNombreRaza(rs.getString("r.nombre_raza"));
                    raza.setTipoAnimal(rs.getString("r.tipo_animal"));
                    mascota.setRaza(raza);

                    mascota.setDescripcion(rs.getString("m.descripcion"));

                    Fotos foto = new Fotos();
                    foto.setFotoId(rs.getInt("f.foto_id"));
                    foto.setUrlFoto(rs.getString("f.url_foto"));
                    foto.setFechaSubida(rs.getTimestamp("f.fecha_subida"));
                    mascota.setFoto(foto);

                    mascota.setGenero(rs.getString("m.genero"));
                    mascota.setTamanio(rs.getString("m.tamanio"));
                    mascota.setDistintivo(rs.getString("m.distintivo"));
                    if(rs.getInt("m.edad_aproximada")!= 0){
                        mascota.setEdadAproximada(rs.getInt("m.edad_aproximada"));
                    }
                    mascotaPerdida.setLugarPerdida(rs.getString("mp.lugar_perdida"));
                    mascotaPerdida.setFechaPerdida(rs.getDate("mp.fecha_perdida"));
                    if(rs.getString("mp.descripcion_adicional") != null){
                        mascotaPerdida.setDescripcionAdicional(rs.getString("mp.descripcion_adicional"));
                    }
                    mascotaPerdida.setNombreContacto(rs.getString("mp.nombre_contacto"));
                    mascotaPerdida.setTelefonoContacto(rs.getInt("mp.telefono_contacto"));
                    if(rs.getString("mp.recompensa")!= null){
                        mascotaPerdida.setRecompensa(rs.getString("mp.recompensa"));
                    }
                    mascotaPerdida.setMascotaEncontrada(rs.getBoolean("mp.mascota_encontrada"));
                    mascotaPerdida.setMascota(mascota);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mascotaPerdida;
    }

    public void agregarMascotaPerdida(PublicacionesMascotaPerdida mascotaPerdida){
        MascotaDAO mascotaDAO = new MascotaDAO();
        mascotaDAO.agregarMascota(mascotaPerdida.getMascota());
        mascotaPerdida.getMascota().setMascotaId(mascotaDAO.obtenerIdUltimaMascota());

        String sql = "INSERT INTO publicaciones_mascota_perdida(publicacion_id, mascota_id, lugar_perdida, fecha_perdida, descripcion_adicional, telefono_contacto, nombre_contacto, recompensa) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, mascotaPerdida.getPublicacion_id());
            pstmt.setInt(2, mascotaPerdida.getMascota().getMascotaId());
            pstmt.setString(3, mascotaPerdida.getLugarPerdida());
            pstmt.setDate(4, mascotaPerdida.getFechaPerdida());
            pstmt.setString(5, mascotaPerdida.getDescripcionAdicional());
            pstmt.setInt(6, mascotaPerdida.getTelefonoContacto());
            pstmt.setString(7, mascotaPerdida.getNombreContacto());
            pstmt.setString(8, mascotaPerdida.getRecompensa());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para descartar la publicación de Mascota Perdida
    public void descartarPublicacionMascotaPerdida(int publicacionId) {
        String query = "UPDATE publicaciones SET estado_publicacion = ? WHERE publicacion_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, "eliminada");
            pstmt.setInt(2, publicacionId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Otros métodos CRUD para gestionar las publicaciones de mascotas perdidas...
}

