public with sharing class DescuentoMartesBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, UnitPrice FROM PricebookEntry'+ 
                                        'WHERE Descuento_50__c = FALSE'+
                                        ' AND Descuento_martes__c =  FALSE' );
    }

    public void execute(Database.BatchableContext BC, List<PricebookEntry> prices){
        for(PricebookEntry p : prices){
            Decimal precio = p.UnitPrice;
            p.UnitPrice = precio * 0.65;
            p.Descuento_martes__c = true;        
        } 
        update prices;
    }

    public void finish(Database.BatchableContext BC){
        
    }
}