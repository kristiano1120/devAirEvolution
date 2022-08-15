@isTest
public class InclusionNullSerialTest {
    
    @TestSetup
    static void makeData(){ 
        List<Account> accts = new List<Account>();
        for(integer i = 0; i < 50; i++){
            accts.add(new Account(name = 'test'+i));
        }
        insert accts;
    }
    
    @IsTest
    static void methodName(){        

        InclusionNullSerial actualizar = new InclusionNullSerial();

        Test.startTest();
        System.enqueueJob(actualizar);
        Test.stopTest();
        List<Account> accts = [SELECT Id 
                                FROM Account 
                                WHERE SLASerialNumber__c != null
                               ];
        
        System.assertEquals(50,accts.size());
    }
    
}