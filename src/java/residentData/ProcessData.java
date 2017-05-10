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
                
                PreparedStatement parents = con.prepareStatement("insert into parents values(?,?,?)");
                
                PreparedStatement email = con.prepareStatement("insert into contact_email values(?,?)");
               
                PreparedStatement mobile = con.prepareStatement("insert into contact_mobile values(?,?)");
                
                PreparedStatement maritial = con.prepareStatement("insert into maritaldeatials values(?,?,?,NULL)");
                
                resident.setString(1, uid);
                resident.setString(2, getData.getString(4));
                resident.setString(3, getData.getString(1));
                resident.setString(4, getData.getString(2));
                resident.setString(5, getData.getString(3));
                resident.setString(6, getData.getString(5));
                resident.setDate(7, getData.getDate(6));
                resident.setString(8, getData.getString(34));
                resident.executeUpdate();
                
                if(getData.getString(15) != null){
                    PreparedStatement uidaddr = con.prepareStatement("select * from address where uid = ?");    
                    uidaddr.setString(1, uid);            
                    ResultSet getAddr = uidaddr.executeQuery();
                    getData.next();
                    address.setString(1, uid);
                    address.setString(2, getAddr.getString(2));
                    address.setString(3, getAddr.getString(3));
                    address.setString(4, getAddr.getString(4));
                    address.setString(5, getAddr.getString(5));
                    address.setString(6, getAddr.getString(6));
                    address.setString(7, getAddr.getString(7));
                    address.setString(8, getAddr.getString(8));
                    address.setString(9, getAddr.getString(9));
                    address.setString(10, getAddr.getString(10));
                    address.setString(11, getAddr.getString(11));
                }
                else{
                    address.setString(1, uid);
                    address.setString(2, getData.getString(14));
                    address.setString(3, getData.getString(16));
                    address.setString(4, getData.getString(17));
                    address.setString(5, getData.getString(18));
                    address.setString(6, getData.getString(19));
                    address.setString(7, getData.getString(21));
                    address.setString(8, getData.getString(22));
                    address.setString(9, getData.getString(23));
                    address.setString(10, getData.getString(24));
                    address.setString(11, getData.getString(20));        
                }
                address.executeUpdate();
                
                //if("Paretns".equals(getData.getString(7))){
                    parents.setString(1, uid);
                    parents.setString(2, getData.getString(8));
                    parents.setString(3, getData.getString(9));         
                //}
                parents.executeUpdate();
                
                email.setString(1, uid);
                email.setString(2,getData.getString(25));
                email.executeUpdate();
                
                mobile.setString(1, uid);
                mobile.setString(2,getData.getString(26));
                mobile.executeUpdate();
                 
                maritial.setString(1, uid);
                maritial.setString(2, getData.getString(13));
                maritial.setString(3, getData.getString(12));
                maritial.executeUpdate();  
                
                PreparedStatement updates = con.prepareStatement("update newregistereddata set isprocessed =? where pre_enroll = ?");
                updates.setString(1, "yes");
                updates.setInt(2, preEnroll);
                updates.executeUpdate();
                
                con.commit();
                con.close();
                
        } catch (SQLException ex) {
            Logger.getLogger(ProcessData.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("\u001B[35m"+"SQLExcleption: "+ ex+"\u001B[0m");
        }    
    }   
}
