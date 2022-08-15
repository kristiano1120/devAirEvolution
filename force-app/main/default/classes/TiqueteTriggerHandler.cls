public with sharing class TiqueteTriggerHandler implements TriggerHandler{
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public TiqueteTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
    }

    public void beforeInsert(List<OpportunityLineItem> newRecords) {
        // helper.doTask1();
        // helper.doTask2();
        evitarSobreventa(newRecords);
        asignarEquipajeNegocios(newRecords);
        actualizarNombrePasajero(newRecords);    
    }
    public void beforeUpdate(List<OpportunityLineItem> oldRecords, List<OpportunityLineItem> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap){
        // helper.doTask3();
        // helper.doTask4();
        actualizarNombrePasajero(newRecords);
    }
    public void beforeDelete(List<OpportunityLineItem> oldRecords, Map<ID, sObject> oldOpportunityLineItemMap) {
        // helper.doTask5();
        // helper.doTask1();
    }
    public void afterInsert(List<OpportunityLineItem> newRecords, Map<ID, sObject> newOpportunityLineItemMap) {
        // helper.doTask2();
        // helper.doTask3();
    }
    public void afterUpdate(List<OpportunityLineItem> oldRecords, List<OpportunityLineItem> newRecords, Map<ID, sObject> oldOpportunityLineItemMap, Map<ID, sObject> newOpportunityLineItemMap) {
        // helper.doTask4();
        // helper.doTask5();
        actualizarNombrePasajero(newRecords);
    }
    public void afterDelete(List<OpportunityLineItem> oldRecords, Map<ID, sObject> oldOpportunityLineItemMap) {
        // helper.doTask3();
        // helper.doTask1();
    }
    public void afterUndelete(List<OpportunityLineItem> newRecords, Map<ID, sObject> newOpportunityLineItemMap) {
        // helper.doTask4();
        // helper.doTask2();
    }

    //No se puede sobrevender mas alla del 10% del total de asientos en el vuelo
    public static void evitarSobreventa(List<OpportunityLineItem > TiqueteNew){
        set <Id> idTiquetes = new set<Id>();
        for (opportunityLineItem Tiquete : tiqueteNew){
            idTiquetes.add(Tiquete.Product2Id);
        }
        map<id , product2> productos = new map<id , product2>([select ID,avion__r.Numero_de_pasajeros_negocios__c,avion__r.Numero_de_pasajeros_Clase_Turista__c 
                                                                from Product2 where Id IN :idTiquetes]); 
        AggregateResult[] groupedResults = [SELECT Count(Id),Product2Id FROM OpportunityLineItem where Product2Id IN :idTiquetes GROUP BY Product2Id  ];
        List<Product2> vuelos = new List<Product2>();
        for (AggregateResult ar : groupedResults){
            system.debug(ar.get('Product2Id'));
            system.debug(ar.get('expr0'));
            decimal pasajerosTotales =productos.get((string)ar.get('Product2Id')).avion__r.Numero_de_pasajeros_negocios__c+productos.get((string)ar.get('Product2Id')).avion__r.Numero_de_pasajeros_Clase_Turista__c;
            if ((pasajerosTotales*1.1)<(integer)ar.get('expr0')) {
                vuelos.add(new product2(id=(string)ar.get('Product2Id')));
            }
            
        }
        for(opportunityLineItem a: tiqueteNew){
            for(product2 p: vuelos){
                if (a.Product2Id==p.Id){
                    a.adderror('No es posible sobrevender los tiquetes');
                }
            }
        }
    }

    //Si un tiquete es de clase de negocios, utomaticamente asignar el qequipaje permitido completo
    public static void asignarEquipajeNegocios(List<OpportunityLineItem> tiquetes){
        Pricebook2 listaDePrecios = [SELECT ID FROM Pricebook2 WHERE Name = 'Tiquetes Clase Negocios' LIMIT 1];
        set<Id> idVuelos = new set<Id>();
        for (OpportunityLineItem tiq : tiquetes) {
            idVuelos.add(tiq.OpportunityId);            
        }
        List<Opportunity> reservas = [SELECT Id FROM Opportunity WHERE Id IN : idVuelos AND Pricebook2Id =: listaDePrecios.Id];
        for (OpportunityLineItem enLis: tiquetes) {
            for (Opportunity tiq : reservas) {
                if (enLis.OpportunityId == tiq.Id){
                    enLis.Equipaje_permitido__c = 'Personal;Maleta de cabina;Maleta de bodega';
                }
            }
        }
    }
    

    //Al crear la reserva se actualiza el nombre ddel pasajero
    public static void actualizarNombrePasajero(List<OpportunityLineItem> opportunityLineItemNeW){
        List<Opportunity> opportunityNew = new List<Opportunity>([SELECT Id,Titular_de_la_reserva__c FROM Opportunity WHERE StageName = 'Pre-venta']);
        for (Opportunity r: opportunityNew){
            for (OpportunityLineItem t : opportunityLineItemNew) {
                if(t.OpportunityId == r.Id){
                    if (t.Pasajero__c == null) {
                        t.Pasajero__c = r.Titular_de_la_reserva__c;
                    System.debug('Entró');   
                    }
                }
                
            }
        }
    }

}