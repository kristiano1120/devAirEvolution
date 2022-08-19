@isTest
public with sharing class DescuentoVeinticuatroTest {
    @TestSetup
    static void makeData(){
        
        Avion__c avion = new Avion__c(Tipo__c  = 'Airbus A330', Numero_de_pasajeros_negocios__c = 30, 
        Numero_de_pasajeros_Clase_Turista__c = 222);
        insert avion;
        String idAvion = avion.Id;
        List<Product2> Vuelos = new List<Product2>();
        for(Integer i = 0; i < 2; i++){
            Product2 vuelo = new Product2(Name = 'AE-2552'+i, 
                                        Fecha_y_hora_de_partida__c = System.now().addHours(12), 
                                        Avion__c = idAvion );
            Vuelos.add(vuelo);
        }
        insert Vuelos;
        String idV = Vuelos[0].Id;
        Id idEstandar = Test.getStandardPricebookId();
        //Insertar entrada de precios estandar
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = idEstandar, Product2Id = idV,
                                                          UnitPrice = 10000, IsActive = true,
                                                          Descuento_martes__c = true,
                                                          Descuento_50__c = false);
        insert standardPrice;
        
        Pricebook2 negocios = new Pricebook2(Name = 'Tiquetes Clase Negocios', IsActive = true);
        insert negocios;

        
        Pricebook2 turista = new Pricebook2(Name = 'Tiquetes clase turista', IsActive = true);
        insert turista;
        
        PricebookEntry entrada = new PricebookEntry(Pricebook2Id = turista.id, Product2Id = idV, 
                                                    UnitPrice = 20000, isActive = true,
                                                    Descuento_martes__c = false,
                                                    Descuento_50__c = false);
        insert entrada;
        
        
        
    }

    
    @isTest
    static void prueba(){
        
        
        Test.startTest();
        DescuentoVeinticuatroSchedulable prueba = new DescuentoVeinticuatroSchedulable();
        String sch = '1 0 0 ? * * *';
        String jobID = System.schedule('DescuentoVeinticuatroSchedulable', sch, prueba);


        DescuentoVeinticuatroBatch descuento = new DescuentoVeinticuatroBatch();
        ID batchprocessid = Database.executeBatch(descuento);
        
       
        Test.stopTest();
        List<Product2> vuelos = [SELECT Id FROM Product2];
        String idV = vuelos[0].id;
        List<PricebookEntry> entradaConDescuento = [SELECT Id 
                                FROM PricebookEntry 
                                WHERE Descuento_50__c = true
                                AND product2id = :idV];
        System.assertEquals(2, entradaConDescuento.size());
    }
}