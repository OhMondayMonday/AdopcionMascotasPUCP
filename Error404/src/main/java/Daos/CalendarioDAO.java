package Daos;

import Beans.Eventos;
import Beans.Usuarios;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CalendarioDAO extends BaseDao {

    public List<Eventos> obtenerEventosActivos() {
        List<Eventos> eventos = new ArrayList<>();
        String sql = "SELECT event_id, user_id, username, nombre_evento, fecha_evento, hora_evento, estado_evento " +
                "FROM eventos INNER JOIN usuarios ON eventos.user_id = usuarios.user_id " +
                "WHERE estado_evento = 'activa'";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Eventos evento = new Eventos();
                evento.setEventId(resultSet.getInt("event_id"));

                // Usuario
                Usuarios usuario = new Usuarios();
                usuario.setUserId(resultSet.getInt("user_id"));
                usuario.setUsername(resultSet.getString("username"));
                evento.setUsuario(usuario);

                evento.setNombreEvento(resultSet.getString("nombre_evento"));
                evento.setFechaEvento(resultSet.getDate("fecha_evento"));
                evento.setHoraEvento(resultSet.getTime("hora_evento"));
                evento.setEstadoEvento(resultSet.getString("estado_evento"));

                eventos.add(evento);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventos;
    }
}

