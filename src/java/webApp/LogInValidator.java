package webApp;

import dbManager.DbConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LogInValidator {
    
    public boolean validator(String uid, String passwd) throws SQLException{
        boolean status= false;
        Connection con = DbConnectionProvider.getCon();
        PreparedStatement stmnt = con.prepareStatement("select * from residentlogin where uid=? and passwd=?");
        stmnt.setString(1, uid);
        stmnt.setString(2, passwd);
        ResultSet rs =  stmnt.executeQuery();
        status = rs.next();
        return status;
    }
}
