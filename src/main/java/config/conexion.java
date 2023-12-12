package config;
import java.sql.Connection;
import java.sql.DriverManager;


public class conexion {
    Connection con;

    public conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://mysql_nuevo:3306/retroinventario?zeroDateTimeBehavior=convertToNull", "root", "root");
        } catch (Exception e) {
            System.err.println("ALGO SALIO MAL WEY" + e);
        }
    }

    public Connection getConnection() {
        return con;
    }
    
}
