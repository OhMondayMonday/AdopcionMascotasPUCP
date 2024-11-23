package Daos;

import java.sql.*;
import Beans.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Beans.*;

import javax.management.relation.Role;

public class RolesDAO extends BaseDao{

    public Roles obtenerRolPorId(int rol_id){
        String query = "SELECT * FROM roles";
        Roles rol = null;

        try (Connection connecion = this.getConnection();
             PreparedStatement pstmt = connecion.prepareStatement(query)){
            pstmt.setInt(1, rol_id);

            try (ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    rol = new Roles();
                    rol.setRolId(rs.getInt("rol_id"));
                    rol.setNombreRol(rs.getString("nombre_rol"));
                }
            }


        }catch (SQLException e){
            e.printStackTrace();
        }
        return rol;

    }

    public List<Roles> obtenerRoles(){
        List<Roles> roles = new ArrayList<>();
        String query = "SELECT * FROM roles";

        try (Connection connecion = this.getConnection();
             Statement stmt = connecion.createStatement();
             ResultSet rs = stmt.executeQuery(query)){
            while (rs.next()){
                Roles rol = new Roles();
                rol.setRolId(rs.getInt("rol_id"));
                rol.setNombreRol(rs.getString("nombre_rol"));
                roles.add(rol);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return roles;

    }

}
