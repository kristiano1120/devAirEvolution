@isTest
public with sharing class ReservaNoPagadaBatchTest {
    @isTest
    Static void batch(){
        Test.startTest();
        try {
        ReservaNoPagadaBatch batchClass = new ReservaNoPagadaBatch(); 
        ID batchprocessid = Database.executeBatch(batchClass);
        } catch (Exception  e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
    }
}