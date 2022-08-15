public with sharing class RaservaNoPagadaSchedulable implements Schedulable{
    public void execute(SchedulableContext ctx) {
        ReservaNoPagadaBatch batchClass = new ReservaNoPagadaBatch(); 
        ID batchprocessid = Database.executeBatch(batchClass);
    }
}