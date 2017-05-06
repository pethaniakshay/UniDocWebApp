package residentData;

public class TestClass {
    public static void main(String args[]){
        
        ResidentDataProvider provider = new ResidentDataProvider("123412341234");
        
        
        System.out.println(provider.getResidentFullName());
        
    }
}
