@isTest
public with sharing class ReservaNoPagadaBatchTest {
    @TestSetup
    static void makeData(){
        //Opportunity reserva = (Name = 'A' );   
        String resJSON = '{"attributes":{"Name":"A","StageName":"Pre-venta","LastModifiedDate":"2022-08-19T14:00:00.000+0000"}'; 
        Opportunity c = (Opportunity) JSON.deserialize(resJSON, Opportunity.class); 
    }

    @isTest
    Static void batch(){
        Test.startTest();
        try {
            ReservaNoPagadaSchedulable test = new ReservaNoPagadaSchedulable();
            String sch = '1 0 0 ? * * *';
            String jobID = System.schedule('DescuentoVeinticuatroSchedulable', sch, test);

            ReservaNoPagadaBatch batchClass = new ReservaNoPagadaBatch(); 
            ID batchprocessid = Database.executeBatch(batchClass);
        } catch (Exception  e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
        List<Opportunity> reservas = [SELECT id FROM Opportunity WHERE StageName = 'No pagado'];

        System.assertEquals(1, reservas.size());
    }
}