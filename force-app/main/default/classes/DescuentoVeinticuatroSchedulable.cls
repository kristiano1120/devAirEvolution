public with sharing class DescuentoVeinticuatroSchedulable implements Schedulable{
    public void execute(SchedulableContext context){
        DescuentoVeinticuatroBatch descuento = new DescuentoVeinticuatroBatch();
        ID batchprocessid = Database.executeBatch(descuento);
    }
}