package residentData;

public class TestClass {
    public static void main(String args[]){
        
        //ResidentDataProvider provider = new ResidentDataProvider("123412341234");
        //System.out.println(provider.getResidentFullName());
        
        ProcessData pd = new ProcessData();
        
        pd.getPreEnrolledData(2);
        System.out.println("Success!");
        
    }
}
