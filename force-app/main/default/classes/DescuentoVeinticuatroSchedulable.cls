public with sharing class DescuentoVeinticuatroSchedulable implements Schedulable{
    public void execute(SchedulableContext context){
        DescuentoVeinticuatroBatch descuento = new DescuentoVeinticuatroBatch();
        ID batchprocessid = Database.executeBatch(descuento);
<<<<<<< HEAD

=======
>>>>>>> 1bac4c9bf2fbecc69e2ae9f4faf3ca6caf1b3203
    }
}