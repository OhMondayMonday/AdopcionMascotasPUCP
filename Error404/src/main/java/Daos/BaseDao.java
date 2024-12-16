package Daos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseDao {
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        String user = "root";
        String pass = "Iweb_Proyecto2024";
        String url = "jdbc:mysql://34.27.46.244:3306/IWEB_DB";
        return DriverManager.getConnection(url, user, pass);
    }
}
