package residentData;

import dbManager.DbConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResidentDataProvider {
    
    private String fullName;
    private String firstName;
    private String middleName;
    private String lastName;
    private String gender;
    private String birthDate;
    private String preEnrollNumber;
    
    private String isAlive;
    private String deathDate;
    private String causeOfDeath;
    private String uidInformedDeath;
    
    private String addressTitle ;
    private String addressHouseNo;
    private String addressStreet;
    private String addressVillag;
    private String addressArea;
    private String addressCity;
    private String addressDistrict;
    private String addressSatate;
    private String addressCountry;
    private String addressPincode;
    
    List<ArrayList<String>> bankAccounts = new ArrayList<>();
    
    ArrayList<String> email = new ArrayList<String>();
    
    ArrayList<String> mobile = new ArrayList<String>();
    
    private String drivingLicenceNo;
    private String drivingLicenceCdoi;
    private String drivinLicenceDoi;
    private String drivingLicenceExpDate;
    private String drivingLicenceIsVerified;
    
    private String eciSerialNo;
    private String eciIsVerified;
   
    private String maritialsatus;
    private String martialUidPartner;
    private String maritialdate;
    
    private String panNumber;
    private String panIsVerified;
    
    private String parentMotherUid;
    private String parentFatherUid;
   
    List<ArrayList<String>> schoolCollegedeatial = new ArrayList<>();
    
    private final String uid;
    
    public ResidentDataProvider(String uid){
        this.uid = uid; 
        Connection con = DbConnectionProvider.getCon();
        
        try{
            con.setAutoCommit(false);
            PreparedStatement resident = con.prepareStatement("select * from resident where uid = ?");    
            resident.setString(1, uid);            
            ResultSet getResident = resident.executeQuery();
            getResident.next();
            this.fullName = getResident.getString(2);
            this.firstName = getResident.getString(3);
            this.middleName = getResident.getString(4);
            this.lastName = getResident.getString(5);
            this.gender = getResident.getString(6);
            this.birthDate = getResident.getDate(7).toString();
            
            PreparedStatement address = con.prepareStatement("select * from address where uid = ?");
            address.setString(1, uid);
            ResultSet getAddress = address.executeQuery();
            getAddress.next();
            this.addressTitle = getAddress.getString(2);
            this.addressHouseNo = getAddress.getString(3);
            this.addressStreet = getAddress.getString(4);
            this.addressArea = getAddress.getString(5);
            this.addressVillag = getAddress.getString(6);
            this.addressCity = getAddress.getString(7);
            this.addressDistrict = getAddress.getString(8);
            this.addressSatate = getAddress.getString(9);
            this.addressCountry = getAddress.getString(10);
            this.addressPincode = getAddress.getString(11);
            
            PreparedStatement banAccount = con.prepareStatement("select * from bank_accounts where uid = ?");
            banAccount.setString(1, uid);
            ResultSet getBankAccount = banAccount.executeQuery(); 
            while(getBankAccount.next()){
                ArrayList<String> a = new ArrayList<String>();
                a.add(getBankAccount.getString(1)); //Account Number
                a.add(getBankAccount.getString(3)); //Bank Names
                a.add(getBankAccount.getString(4)); //IFSC
                a.add(getBankAccount.getString(5)); //Branch Name
                a.add(getBankAccount.getString(6)); //Is Verified 
                this.bankAccounts.add(a);
            }
            
            PreparedStatement emails = con.prepareStatement("select * from contact_email where uid = ?");
            emails.setString(1, uid);
            ResultSet getEmail = banAccount.executeQuery();
            while(getEmail.next()){
                this.email.add(getEmail.getString(2));
            }
            
            PreparedStatement mobiles = con.prepareStatement("select * from contact_mobile where uid = ?");
            mobiles.setString(1, uid);
            ResultSet getMobile = banAccount.executeQuery();
            while(getMobile.next()){
                this.mobile.add(getEmail.getString(2));
            }
            
            PreparedStatement drivingLicence = con.prepareStatement("select * from driving_licence where uid = ?");    
            drivingLicence.setString(1, uid);            
            ResultSet getDriLiceData= resident.executeQuery();
            getDriLiceData.next();
            this.drivingLicenceNo = getDriLiceData.getString(1);
            this.drivingLicenceCdoi = getDriLiceData.getDate(3).toString();
            this.drivinLicenceDoi = getDriLiceData.getDate(4).toString();
            this.drivingLicenceExpDate = getDriLiceData.getDate(5).toString();
            this.drivingLicenceIsVerified = getDriLiceData.getString(6);
            
            PreparedStatement eciId = con.prepareStatement("select * from eci_id where uid = ?");    
            eciId.setString(1, uid);            
            ResultSet getEciId= resident.executeQuery();
            getEciId.next();
            eciSerialNo = getEciId.getString(1);
            eciIsVerified = getEciId.getString(3);
            
            PreparedStatement isAlives = con.prepareStatement("select * from isalive where uid = ?");    
            isAlives.setString(1, uid);            
            ResultSet getIsAlive= resident.executeQuery();
            getIsAlive.next();
            this.isAlive = getIsAlive.getString(2);
            this.deathDate = getIsAlive.getString(3);
            this.causeOfDeath = getIsAlive.getString(4);
            this.uidInformedDeath = getIsAlive.getString(5);
            
            
            PreparedStatement maritialInfo = con.prepareStatement("select * from maritaldeatials where uid = ?");    
            maritialInfo.setString(1, uid);            
            ResultSet getMaritialInfo= resident.executeQuery();
            getMaritialInfo.next();
            this.maritialsatus = getMaritialInfo.getString(3);
            this.martialUidPartner = getMaritialInfo.getString(2);
            this.maritialdate = getMaritialInfo.getDate(4).toString();
            
            PreparedStatement panNumbers = con.prepareStatement("select * from pan_number where uid = ?");    
            panNumbers.setString(1, uid);            
            ResultSet getPanInfo= resident.executeQuery();
            getPanInfo.next();
            this.panNumber = getPanInfo.getString(1);
            this.panIsVerified = getPanInfo.getString(3);
            
            PreparedStatement parents = con.prepareStatement("select * from parents where uid = ?");    
            parents.setString(1, uid);            
            ResultSet getParents = resident.executeQuery();
            getParents.next();
            this.parentMotherUid = getParents.getString(2);
            this.parentFatherUid = getParents.getString(3);
            
            PreparedStatement schoolDetail = con.prepareStatement("select * from school where uid = ?");
            schoolDetail.setString(1, uid);
            ResultSet getSchoolDetail = banAccount.executeQuery(); 
            while(getSchoolDetail.next()){
                ArrayList<String> a = new ArrayList<String>();
                a.add(getSchoolDetail.getString(1)); //Admission Number
                a.add(getSchoolDetail.getString(3)); //SchoolId
                a.add(getSchoolDetail.getString(4)); //JoinDate
                a.add(getSchoolDetail.getString(5)); //LeaaveDate
                a.add(getSchoolDetail.getString(6)); //StudyDetail
                this.schoolCollegedeatial.add(a);
            }
            con.commit();
            con.close();
        }catch(SQLException e){
            System.out.println("\u001B[35m"+"SQLExcleption: "+ e+"\u001B[0m");
        }   
    }
    
    public String getResidentFullName(){
        return this.fullName;
    }
    
    public String getResidentFirstName(){
        return this.firstName;
    }
    
    public String getResidentMiddleName(){
        return this.middleName;
    }
    
    public String getResidentLastName(){
        return this.lastName;
    }
    
    public String getResidentGender(){
        return this.gender;
    }
    
    public String getResidentBirthDate(){
        return this.birthDate;
    }
    
    public String getAddressTitle(){
        return this.addressTitle;
    }
    
    public String getAddressHouseNo(){
        return this.addressHouseNo;
    }
    
    public String getAddressStreet(){
        return this.addressStreet;
    }
    
    public String getAddressArea(){
        return this.addressArea;
    }
    
    public String getAddressVillage(){
        return this.addressVillag;
    }
    
    public String getAddressCity(){
        return this.addressCity;
    }
    
    public String getAddressDistrict(){
        return this.addressDistrict;
    }
    
    public String getAddressState(){
        return this.addressSatate;
    }
    
    public String getAddressCountry(){
        return this.addressCountry;
    }
    
    public String getAddressPinCode(){
        return this.addressPincode;
    }
    
    public String getDrivingLicenceNumber(){
        return this.drivingLicenceNo;
    }
    
    public String getDrivingLicenceCDOI(){
        return this.drivingLicenceCdoi;
    }
    
    public String getDrivingLicenceDOI(){
        return this.drivinLicenceDoi;
    }
    
    public String getDrivingLicenceExpdate(){
        return this.drivingLicenceExpDate;
    }
    
    public String getDrivingLicenceIsVerified(){
        return this.drivingLicenceIsVerified;
    }
    
    public String getEciNumber(){
        return this.eciSerialNo;
    }
    
    public String getEciIsVerified(){
        return this.drivingLicenceNo;
    }
}