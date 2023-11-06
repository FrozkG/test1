
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    
    private static final String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
    private static final String user = "root";
    private static final String pass = "admin";
    
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch(Exception e){
            System.out.println("ERROR: "+e.getMessage());
        }
        return con;
    }
}
