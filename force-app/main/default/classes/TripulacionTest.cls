@isTest
public with sharing class TripulacionTest {
    @TestSetup
    static void makeData(){
        List<Contact> auxiliares = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
        contact contacto = new contact(LastName = 'Facundo '+i, Tipo_de_Identificaci_n__c = 'Cédula de ciudadanía', 
                                        Numero_de_Identificacion__c = '1255'+i, N_mero_de_Pasaporte__c = '1020'+i, RecordTypeId = '0128a000000YVvvAAG',
                                        Tipo_de_contrato__c = 'Indefinido');
        auxiliares.add(contacto);
        }
        insert auxiliares; 

        Avion__c avion = new Avion__c(Numero_de_pasajeros_negocios__c	 = 30, Numero_de_pasajeros_Clase_Turista__c = 222);
        insert avion;

        Product2 vuelo = new Product2(Name = 'AE-0001',
                                Avion__c = avion.Id,
                                Fecha_y_hora_de_partida__c = datetime.now()+2,
                                Fecha_y_hora_estimada_de_llegada__c = (datetime.now()+2).addHours(1),
                                Aeropuerto_de_Partida__c = 'a018a00000zWkKGAA0',
                                Aeropuerto_de_Llegada__c = 'a018a00000zWkK1AAK',
                                IsActive = true,
                                Estado__c = 'En venta');
        insert vuelo;

        contact obtConct = [SELECT Id FROM Contact LIMIT 1];
        Product2 vuelos = [SELECT Id FROM Product2 LIMIT 1];

        Auxiliares_x_Vuelo__c auxiliar  = new Auxiliares_x_Vuelo__c( Nombre_de_Tripulante__c = obtConct.Id, Vuelo__c = vuelos.Id);
        insert auxiliar;
    }

    //Se comprueba que el el metodo obtenga el vuelo dentro del rango de obtención
    @isTest
    private static void obtieneUnVuelo(){
            List<Tripulacion.vuelo> vuelos = Tripulacion.obternerVuelos();
            System.assertEquals(1, vuelos.size());
    }

    //
    @isTest
    private static void errorEnVuelo(){
        Avion__c avion = [SELECT Id FROM Avion__c LIMIT 1];
        delete avion;
        try{
            List<Tripulacion.vuelo> vuelos = Tripulacion.obternerVuelos();
        } catch (Exception e){
            List<Avion__c> listaAvion = [SELECT Id FROM Avion__c LIMIT 1];
            System.assertEquals(0, listaAvion.size());
        }
    }

    @isTest
    private static void obtieneAuxiliares(){
        Product2 vuelos = [SELECT Id FROM Product2 LIMIT 1];
        List<Tripulacion.opcion> opciones = Tripulacion.obtenerAxiliares(vuelos.Id);

        System.assertEquals(3, opciones.size());

    }

    @isTest
    private static void saveAuxiliares(){
        Product2 vuelo = [SELECT Id FROM Product2 LIMIT 1];
        List<Contact> auxiliares = [SELECT ID FROM Contact];
        List<String> listaAuxiliares = new List<String>();
        for (Contact c : auxiliares) {
            listaAuxiliares.add((string)c.Id);
        }
        Tripulacion.saveAuxiliares(listaAuxiliares, vuelo.Id);
        Product2 vuelos = [SELECT Id FROM Product2 LIMIT 1];
        List<Tripulacion.opcion> opciones = Tripulacion.obtenerAxiliares(vuelos.Id);
        System.assertEquals(4, opciones.size());
    }
}