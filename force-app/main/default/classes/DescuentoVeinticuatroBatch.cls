public with sharing class DescuentoVeinticuatroBatch implements Database.Batchable<sObject>{
    DateTime ahora = Datetime.now();
    DateTime veintiuatro = Datetime.now().addHours(24);    
    public Database.QueryLocator start(Database.BatchableContext context){
        return Database.getQueryLocator('SELECT id, Fecha_y_hora_de_partida__c FROM Product2');
    }

    public void execute(Database.BatchableContext BC, List<Product2> vuelos){
        List<String> entradaPrecios = new List<String>();
        for(Product2 vuelo : vuelos){
            if (vuelo.Fecha_y_hora_de_partida__c >= ahora && vuelo.Fecha_y_hora_de_partida__c <= veintiuatro) {
                entradaPrecios.add(vuelo.Id);
            }      
        }
        if (entradaPrecios.size() > 0) {
            List<PricebookEntry> precios = [SELECT Id, UnitPrice, Descuento_martes__c, Descuento_50__c FROM PricebookEntry 
                                            WHERE Descuento_50__c = false AND Product2Id IN :entradaPrecios];
            for (PricebookEntry precio : precios){
                Decimal valor = precio.UnitPrice;
                if (precio.Descuento_martes__c == true) {
                    precio.Descuento_martes__c = false;
                    precio.Descuento_50__c = true;
                    valor = valor / 0.65;
                    precio.UnitPrice = valor * 0.5;
                }else {
                    precio.Descuento_martes__c = false;
                    precio.Descuento_50__c = true;
                    precio.UnitPrice = valor * 0.5;
                }               
            }
            update precios;
        } 
    }

    public void finish(Database.BatchableContext BC){
        
    }
}