public with sharing class ReversaDescuentoMartes implements Schedulable{
    public void execute(SchedulableContext ctx){
        ReversaDescuentoMartesBatch pNormal = new ReversaDescuentoMartesBatch();
        ID batchprocessid = Database.executeBatch(pNormal);
    }
}