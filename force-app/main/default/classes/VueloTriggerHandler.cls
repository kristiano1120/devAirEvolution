public with sharing class VueloTriggerHandler implements TriggerHandler{
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public VueloTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
    }

    public void beforeInsert(List<Product2> newRecords) {
        // helper.doTask1();
        // helper.doTask2();
        nombrarVuelo(newRecords);
    }
    public void beforeUpdate(List<Product2> oldRecords, List<Product2> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap){
        // helper.doTask3();
        // helper.doTask4();
        desactiStringVuelo(newRecords);
    }   
    public void beforeDelete(List<Product2> oldRecords, Map<ID, sObject> oldProduct2Map) {
        // helper.doTask5();
        // helper.doTask1();
    }
    public void afterInsert(List<Product2> newRecords, Map<ID, sObject> newProduct2Map) {
        // helper.doTask2();
        // helper.doTask3();
    }
    public void afterUpdate(List<Product2> oldRecords, List<Product2> newRecords, Map<ID, sObject> oldProduct2Map, Map<ID, sObject> newProduct2Map) {
        // helper.doTask4();
        // helper.doTask5();
    }
    public void afterDelete(List<Product2> oldRecords, Map<ID, sObject> oldProduct2Map) {
        // helper.doTask3();
        // helper.doTask1();
    }
    public void afterUndelete(List<Product2> newRecords, Map<ID, sObject> newProduct2Map) {
        // helper.doTask4();
        // helper.doTask2();
    }

    public void desactiStringVuelo(List<Product2> vuelos){
        for(Product2 v : vuelos){
            if(v.IsActive != false && (v.Estado__c == 'Terminado' || v.Estado__c == 'Cancelado')){
                v.IsActive = false;
                if(v.Estado__c == 'Cancelado' && String.isNotEmpty(v.Motivo_de_cancelacion__c)){
                    date fecha = date.today();
                    v.Fecha_de_cancelcion_del_vuelo__c	 = fecha;
                }else if(v.Estado__c == 'Cancelado'){
                    v.Motivo_de_cancelacion__c.addError('Debe agregar un motivo de cancelación');
                }     
            }
        }
    }

    public void nombrarVuelo(List<Product2> vuelos){
        for (Product2 v : vuelos) {
            if (v.Name != null) {
                String nombre = 'AE-' + Integer.valueOf(Math.random()*10000);                              
                v.Name = nombre;
            }            
        }
    }    
}