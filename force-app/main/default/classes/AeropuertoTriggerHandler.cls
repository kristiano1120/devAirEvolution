public with sharing class AeropuertoTriggerHandler implements TriggerHandler{
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public AeropuertoTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
    }

    public void beforeInsert(List<Aeropuerto__c> newRecords) {
        // helper.doTask1();
        // helper.doTask2();
    }
    public void beforeUpdate(List<Aeropuerto__c> oldRecords, List<Aeropuerto__c> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap){
        // helper.doTask3();
        // helper.doTask4();
    }
    public void beforeDelete(List<Aeropuerto__c> oldRecords, Map<ID, sObject> oldRecordMap) {
        // helper.doTask5();
        // helper.doTask1();
    }
    public void afterInsert(List<Aeropuerto__c> newRecords, Map<ID, sObject> newRecordMap) {
        // helper.doTask2();
        // helper.doTask3();
    }
    public void afterUpdate(List<Aeropuerto__c> oldRecords, List<Aeropuerto__c> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap) {
        // helper.doTask4();
        // helper.doTask5();
    }
    public void afterDelete(List<Aeropuerto__c> oldRecords, Map<ID, sObject> oldRecordMap) {
        // helper.doTask3();
        // helper.doTask1();
    }
    public void afterUndelete(List<Aeropuerto__c> newRecords, Map<ID, sObject> newRecordMap) {
        // helper.doTask4();
        // helper.doTask2();
    }
}