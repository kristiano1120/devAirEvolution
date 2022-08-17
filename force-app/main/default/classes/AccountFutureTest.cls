@isTest
public class AccountFutureTest {
	
    @TestSetup
    static void makeData(){
       /*  List<Account> ctas = new List<Account>();
        for (Integer i = 0; i < 2; i++) {
            Account acc = new Account(Name = 'nombre test'+i);
            ctas.add(acc);
        }
        insert ctas; */
    }
    
    @isTest
    static void actualizarAcc(){
        
        
        test.startTest();
        String name = 'nombre test';
        AcconunFutureSLA.crearCuenta(name);
        Account cta =[SELECT id, Name FROM Account WHERE name = 'nombre test' LIMIT 1];
        System.debug(cta);

        String id = cta.Id;
        MetodoFuture.actualizarAcc(id);
        test.stopTest();
        List<Account> ctasList = [SELECT SLASerialNumber__c 
                         FROM Account
                         WHERE name = 'nombre test'
                         AND SLASerialNumber__c != null];
        
        system.assertEquals(1, ctasList.size());	
    }
}