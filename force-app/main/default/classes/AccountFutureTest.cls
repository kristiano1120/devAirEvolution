@isTest
public class AccountFutureTest {
	
    @isTest
    static void actualizarAcc(){
        
        Account acc = new Account(Name = 'nombre test');
        insert acc;
        
        
        
        
        test.startTest();
        MetodoFuture.actualizarAcc(acc.Id);
        AcconunFutureSLA.crearCuenta(acc.Id);
        List<Account> nueva = [SELECT SLASerialNumber__c 
                         FROM Account
                         WHERE name = 'nombre test'
                         AND SLASerialNumber__c != null];
        
        test.stopTest();
        system.assertEquals(1, nueva.size());	
    }
}