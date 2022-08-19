public with sharing class InactiveAccounts implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext BC){
        String SLA = 'Gold';
        Date SLAExpiration = Date.today();  
        return Database.getQueryLocator('SELECT id FROM Account WHERE SLA__c=:' + SLA +''+
        'AND SLAExpirationDate__c <'+ SLAExpiration +'AND UpsellOpportunity__c = \'No\'');
    }
    
    public void execute(Database.BatchableContext BC, List<Account> accts){
        delete accts;
    }
    
    public void finish(Database.BatchableContext BC){
        // notificar acerca del proceso
    }
}