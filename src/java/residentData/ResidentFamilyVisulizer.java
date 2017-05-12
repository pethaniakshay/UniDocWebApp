package residentData;

import dbManager.DbConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResidentFamilyVisulizer {
    
    private String uid;
   
    private String firstNameMother;
    private String firstNameFather;
    private String firstNamePartner;
    
    private ArrayList<String> childs = new ArrayList<>();
    private List<ArrayList<String>> sons = new ArrayList<>();
    private List<ArrayList<String>> daughters = new ArrayList<>();
    
    public ResidentFamilyVisulizer(String uid){
        
        this.uid =uid;
        
        ResidentDataProvider provider = new ResidentDataProvider(uid);
        
        ResidentDataProvider getMother = new ResidentDataProvider(provider.getMotherUid());
        ResidentDataProvider getFather = new ResidentDataProvider(provider.getFatherUid());
        
        this.firstNameMother = getMother.getResidentFirstName();
        this.firstNameFather = getFather.getResidentFirstName();
        
        if("married".equals(provider.getMaritialStatus())){
            ResidentDataProvider getPartner = new ResidentDataProvider(provider.getUidPartner());
            this.firstNamePartner = getPartner.getResidentFirstName();
        }
        
        
        Connection con = DbConnectionProvider.getCon();
        
        try{
            con.setAutoCommit(false);
            
            PreparedStatement getChild = con.prepareStatement("select uid from parents where mother_uid = ? or father_uid= ?");
            getChild.setString(1, uid);
            getChild.setString(2, uid);
            ResultSet getChilds = getChild.executeQuery();
            
            while(getChilds.next()){
                childs.add(getChilds.getString("uid"));
             
            }
            
          
            for(String obj : childs){
                ResidentDataProvider temp = new ResidentDataProvider(obj);
                ArrayList<String> t = new ArrayList<>();

                t.add(obj); // uid
                t.add(temp.getResidentFirstName()); // First Name

                if("male".equals(temp.getResidentGender())){
                    sons.add(t);
                }
                if("female".equals(temp.getResidentGender())){
                    daughters.add(t);
                }  
           }
            
        }
        catch(SQLException e){
            System.out.println("\u001B[32m"+"SQLExcleption: "+ e+"\u001B[0m");    
        }       
    }
    
    public String getMotherFirstName(){
        return this.firstNameMother;
    }
    
    public String getPartnerFirstName(){
        return this.firstNamePartner;
    }
    
    public String getFatherFirstName(){
        return this.firstNameFather;
    }
    
    public List<ArrayList<String>> getSons(){
        return this.sons;
    }
    
    public List<ArrayList<String>> getDaughters(){
        return this.daughters;
    }
    
}
