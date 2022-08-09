public class NullSerialSchedulable implements Schedulable{
    
    public void execute(SchedulableContext ctx) {
        NullSerialSLA batchClass = new NullSerialSLA(); 
        ID batchprocessid = Database.executeBatch(batchClass);
        
    }
    
    
}