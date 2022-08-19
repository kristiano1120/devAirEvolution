@isTest
public with sharing class ReversaDescuentoMartesTest {
    @TestSetup
    static void makeData(){
        List<Contact> lista = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            Contact cto = new Contact(FirstName = 'Abigail', LastName = 'Gray', 
                                  Tipo_de_Identificaci_n__c = 'Cedula de Extranjería', 
                                  Numero_de_Identificacion__c = String.valueof(i));
            lista.add(cto);
        }
        insert lista;
        String id = lista[0].Id;
        //Insertar avion 
        Avion__c avion = new Avion__c(Tipo__c  = 'Airbus A330', Numero_de_pasajeros_negocios__c = 30, 
        Numero_de_pasajeros_Clase_Turista__c = 222);
        insert avion;
        String idAvion = avion.Id;
        List<Product2> Vuelos = new List<Product2>();
        for(Integer i = 0; i < 2; i++){
            Product2 vuelo = new Product2(Name = 'AE-2552', 
                                        Fecha_y_hora_de_partida__c = System.today().addDays(1), 
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
        
        
        Opportunity res = new Opportunity(Name = 'A', Titular_de_la_reserva__c = id, 
                                        CloseDate = System.today(), StageName = 'Pre-venta', 
                                        Pricebook2Id = turista.Id);
        Insert res;
    }

    
    @isTest
    static void pruebaReversaDescuento(){
        
        
        Test.startTest();
        ReversaDescuentoMartes prueba = new ReversaDescuentoMartes();
        String sch = '1 0 0 ? * * *';
        String jobID = System.schedule('DescuetnoMartesReversa', sch, prueba);


        ReversaDescuentoMartesBatch pNormal = new ReversaDescuentoMartesBatch();
        ID batchprocessid = Database.executeBatch(pNormal);
        
       
        Test.stopTest();
        
        List<PricebookEntry> entradaSInDescuentoMartes = [SELECT Id 
                                FROM PricebookEntry 
                                WHERE Descuento_50__c = FALSE
                                AND Descuento_martes__c = False];
        System.assertEquals(2, entradaSInDescuentoMartes.size());
    }
}