package Daos;

import Beans.Fotos;
import Beans.Mascotas;
import Beans.PublicacionesAdopcion;
import Beans.Razas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdopcionDAO extends BaseDao{

    // Metodo en UsuarioFinalPublicDAO para obtener datos de una publicacion de adopción
    public PublicacionesAdopcion obtenerPublicacionAdopcion(int publicacionId) {
        PublicacionesAdopcion publicacionAdopcion = new PublicacionesAdopcion();
        String query = "SELECT * FROM publicaciones_adopcion pa\n" +
                "INNER JOIN mascotas m ON m.mascota_id = pa.mascota_id\n" +
                "INNER JOIN razas r ON r.raza_id = m.raza_id\n" +
                "INNER JOIN fotos f ON m.foto_id = f.foto_id\n" +
                "WHERE pa.publicacion_id = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)){

            pstmt.setInt(1, publicacionId);

            try (ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    publicacionAdopcion.setPublicacion_id(rs.getInt("pa.publicacion_id"));

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

                    mascota.setEdadAproximada(rs.getInt("m.edad_aproximada"));
                    mascota.setGenero(rs.getString("m.genero"));
                    mascota.setTamanio(rs.getString("m.tamanio"));
                    mascota.setDistintivo(rs.getString("m.distintivo"));
                    mascota.setEnHogarTemporal(rs.getBoolean("m.en_hogar_temporal"));
                    publicacionAdopcion.setMascota(mascota);

                    publicacionAdopcion.setLugarEncontrado(rs.getString("pa.lugar_encontrado"));
                    publicacionAdopcion.setCondicionesAdopcion(rs.getString("pa.condiciones_adopcion"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicacionAdopcion;
    }

    public void agregarAdopcion(PublicacionesAdopcion publicacionAdopcion) {
        MascotaDAO mascotaDAO = new MascotaDAO();
        publicacionAdopcion.getMascota().setTamanio("pequeño");
        mascotaDAO.agregarMascota(publicacionAdopcion.getMascota());
        publicacionAdopcion.getMascota().setMascotaId(mascotaDAO.obtenerIdUltimaMascota());

        String sql = "INSERT INTO publicaciones_adopcion(publicacion_id, mascota_id, lugar_encontrado, condiciones_adopcion) VALUES(?,?,?,?)";
        try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, publicacionAdopcion.getPublicacion_id());
            pstmt.setInt(2, publicacionAdopcion.getMascota().getMascotaId());
            pstmt.setString(3, publicacionAdopcion.getLugarEncontrado());
            pstmt.setString(4, publicacionAdopcion.getCondicionesAdopcion());
            pstmt.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
