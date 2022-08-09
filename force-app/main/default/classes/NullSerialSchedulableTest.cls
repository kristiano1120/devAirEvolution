@isTest
public class NullSerialSchedulableTest {   
    
    @TestSetup
    static void makeData(){
        List<Account> accts = new List<Account>();
        for(integer i = 0; i < 200; i++){
            accts.add(new Account(name = 'test'+i));
        }

        insert accts;
    }

    
    @isTest
    static void prueba(){
        
        
        Test.startTest();
        NullSerialSchedulable prueba = new NullSerialSchedulable();
        String sch = '0 0 1 1/1 * ? *';
        String jobID = System.schedule('NullSerialSchedulable', sch, prueba);
        
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger where Id =: jobID];
        System.assertEquals(sch, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        List<Account> accts = [SELECT Id 
                                FROM Account 
                                WHERE SLASerialNumber__c != null
                               ];
        System.assertEquals(0, accts.size());
        
        Test.stopTest();
    }
    
}