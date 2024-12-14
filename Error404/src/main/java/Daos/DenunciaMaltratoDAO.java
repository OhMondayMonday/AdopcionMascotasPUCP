package Daos;

import Beans.DenunciasMaltratoAnimal;
import Beans.Fotos;
import Beans.Mascotas;
import Beans.Razas;
import com.oracle.wls.shaded.org.apache.bcel.generic.NEW;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DenunciaMaltratoDAO extends BaseDao {

    public DenunciasMaltratoAnimal obtenerDenunciaMaltratoAnimal(int id) {
        String sql = "SELECT * FROM denuncias_maltrato_animal dma\n" +
                "INNER JOIN mascotas m ON m.mascota_id = dma.mascota_id\n" +
                "INNER JOIN razas r ON r.raza_id = m.raza_id\n" +
                "WHERE publicacion_id = ?";
        DenunciasMaltratoAnimal denunciaMaltrato = new DenunciasMaltratoAnimal();
        try (Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                denunciaMaltrato.setReportId(rs.getInt("dma.publicacion_id"));
                denunciaMaltrato.setUserId(rs.getInt("dma.user_id"));
                denunciaMaltrato.setTipoMaltrato(rs.getString("dma.tipo_maltrato"));
                denunciaMaltrato.setNombreMaltratador(rs.getString("dma.nombre_maltratador"));
                denunciaMaltrato.setDireccionMaltrato(rs.getString("dma.direccion_maltrato"));

                Mascotas mascota = new Mascotas();
                mascota.setMascotaId(rs.getInt("m.mascota_id"));
                mascota.setNombre(rs.getString("m.nombre"));
                mascota.setTamanio(rs.getString("m.tamanio"));

                Razas raza = new Razas();
                raza.setRazaId(rs.getInt("r.raza_id"));
                raza.setNombreRaza(rs.getString("r.nombre_raza"));
                raza.setTipoAnimal(rs.getString("r.tipo_animal"));
                mascota.setRaza(raza);

                mascota.setDescripcion(rs.getString("m.descripcion"));

                denunciaMaltrato.setMascota(mascota);

                denunciaMaltrato.setDenunciaPolicial(rs.getBoolean("dma.denuncia_policial"));
                denunciaMaltrato.setFechaDenuncia(rs.getTimestamp("dma.fecha_denuncia"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return denunciaMaltrato;
    }

    // Método para agregar una nueva denuncia de maltrato
    public void agregarDenunciaMaltrato(DenunciasMaltratoAnimal denuncia) {
        MascotaDAO mascotaDAO = new MascotaDAO();
        mascotaDAO.agregarMascota(denuncia.getMascota());
        denuncia.getMascota().setMascotaId(mascotaDAO.obtenerIdUltimaMascota());
        String query = "INSERT INTO denuncias_maltrato_animal (publicacion_id, user_id, tipo_maltrato, nombre_maltratador, direccion_maltrato, mascota_id, denuncia_policial) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1,denuncia.getReportId());
            pstmt.setInt(2, denuncia.getUserId());
            pstmt.setString(3, denuncia.getTipoMaltrato());
            pstmt.setString(4, denuncia.getNombreMaltratador());
            pstmt.setString(5, denuncia.getDireccionMaltrato());
            pstmt.setInt(6, denuncia.getMascota().getMascotaId());
            pstmt.setBoolean(7, denuncia.isDenunciaPolicial());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para descartar la denuncia de maltrato
    public void descartarDenunciaMaltrato(int denunciaId) {
        String query = "DELETE FROM denuncias_maltrato_animal WHERE report_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, denunciaId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Otros métodos CRUD para gestionar las denuncias de maltrato...
}
