@isTest
public with sharing class TripulacionTest {
    @TestSetup
    static void makeData(){
        Contact cto = new Contact(LastName = 'AuxiliarPrueba',
                                Numero_de_Identificacion__c = '12345678',
                                RecordTypeId = '0128a000000lBUIAA2');
        insert cto;

        Avion__c av = new Avion__c(Tipo__c = 'Airbus A330');
        insert av;
        
        DateTime limitDate = DateTime.now().addDays(7);
        List<Product2> vuelos = new List<Product2>();
        for (Integer i = 0; i < 20  ; i++) {
            Product2 vuelo = new Product2(Name = 'A'+i,
                                    IsActive = true,
                                    Estado__c = 'En venta', 
                                    Fecha_y_hora_de_partida__c = DateTime.now().addDays(1),
                                    Fecha_y_hora_estimada_de_llegada__c = limitDate,
                                    Avion__c = av.Id);
            vuelos.add(vuelo);
        }
        Insert vuelos;

        List<Auxiliares_x_Vuelo__c> auxv = new List<Auxiliares_x_Vuelo__c>();
        for (Product2 v : vuelos) {
            Auxiliares_x_Vuelo__c aux = new Auxiliares_x_Vuelo__c(Nombre_de_Tripulante__c = cto.Id,                                                                 
                                                                Vuelo__c = v.Id);
        auxv.add(aux);                      
        }
        insert auxv;

        
    }

    @isTest
    private static void obtenerVuelosTodos() {        
        //List<Tripulacion.vuelo> vuelos = Tripulacion.obtenerVuelos();
        //System.assertEquals(20, vuelos.size());
    }
    
    @isTest
    private static void obtenerAuxiliares() {
        /* Product2 vuelo = [Select id from Product2 LIMIT 1]
        insert vuelo */
        //List<Tripulacion.vuelo> vuelos = Tripulacion.obternerVuelos();
        List<Tripulacion.opcion> aux = Tripulacion.obtenerAxiliares('');        
        System.assertEquals(1, aux.size());

        Product2 vuelo = [Select id from Product2 LIMIT 1];       
        List<Tripulacion.opcion> aux1 = Tripulacion.obtenerAxiliares(vuelo.id);        
        System.assertEquals(2, aux1.size());
    }

    @isTest
    private static void obtenerTripulantes() {
        
    }
}