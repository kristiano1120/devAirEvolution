public with sharing class DescuentoVeinticuatroBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext context){
        return Database.getQueryLocator('SELECT id, UnitPrice FROM PricebookEntry'+ 
                                        'WHERE Descuento_50__c = FALSE'+
                                         'AND Estado__c ='+' En venta');
    }

    public void execute(Database.BatchableContext BC, List<PricebookEntry> prices){
        /* for(PricebookEntry p : prices){
            Decimal precio = p.UnitPrice;
            p.UnitPrice = precio * 0.65;
            p.Descuento_martes__c = true;        
        } 
        update prices; */
    }

    public void finish(Database.BatchableContext BC){
        
    }
}