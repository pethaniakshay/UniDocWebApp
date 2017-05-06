package dbManager;

import java.sql.*;
import static dbManager.DbConnectionCredential.*;

public class DbConnectionProvider {
     private static Connection con = null;
    
    static{
        try{  
            Class.forName(DRIVER);  
            con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);  
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("\u001B[35m"+"Database Connection Error"+"\u001B[0m");
        }      
    }
    
    public static Connection getCon(){  
        return con;  
    }     
}
