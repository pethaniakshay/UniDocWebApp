package residentData;

public class TestClass {
    public static void main(String args[]){
        
//        ResidentDataProvider provider = new ResidentDataProvider("123412341234");
//        System.out.println(provider.getResidentGender());
//        System.out.println(provider.getAddressCity());
//        
//        ProcessData pd = new ProcessData();
//        pd.getPreEnrolledData(2);
//        System.out.println("Success!");


          ResidentFamilyVisulizer family = new ResidentFamilyVisulizer("123412341234");
          
          System.out.println(family.getFatherFirstName());
    }
}
