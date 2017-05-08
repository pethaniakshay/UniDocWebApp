package residentData;
import java.sql.*;
import dbManager.DbConnectionProvider;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProcessData {
    
    public void getPreEnrolledData(int preEnroll){
        Connection con = DbConnectionProvider.getCon();
        String uid;
        try {
                con.setAutoCommit(false);
               
                Statement getOne = con.createStatement();
                ResultSet getUid = getOne.executeQuery("select * from uidbuffered ORDER BY rand() LIMIT 1");
                getUid.next();
                uid = getUid.getString(2);
                
                PreparedStatement deleteUid = con.prepareStatement("delete from uidbuffered where uid = ?");
                deleteUid.setString(1, uid);
                deleteUid.executeUpdate();
           
                PreparedStatement preEnrolled = con.prepareStatement("select * from newregistereddata where pre_enroll = ?");    
                preEnrolled.setInt(1, preEnroll);            
                ResultSet getData = preEnrolled.executeQuery();
                getData.next();
                
                PreparedStatement resident = con.prepareStatement("insert into resident values(?,?,?,?,?,?,?,NULL,NULL,?)"); 
                
                PreparedStatement address = con.prepareStatement("insert into address values(?,?,?,?,?,?,?,?,?,?,?)");
                
                PreparedStatement paretns = con.prepareStatement("insert into parents values(?,?,?)");
                
                PreparedStatement email = con.prepareStatement("insert into contact_email values(?,?)");
               
                PreparedStatement mobile = con.prepareStatement("insert into contact_mobile values(?,?)");
                
                PreparedStatement maritial = con.prepareStatement("insert into maritaldeatials values(?,?,?,NULL)");
                
                
                
                
            
            
            
            
            
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProcessData.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("\u001B[35m"+"SQLExcleption: "+ ex+"\u001B[0m");
        }    
    }   
}
