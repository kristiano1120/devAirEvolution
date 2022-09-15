@isTest
public with sharing class ListaTiquetesTest {
    @TestSetup
    static void makeData(){

        List<String> ciudades =new List<String>{'Medellín', 'Bogotá'};
        List<String> aeroNombres =new List<String>{'Aeropuerto Internacional José María Cordova', 'Aeropuerto Internacional El Dorado'};
        List<String> codigos =new List<String>{'MDE', 'BOG'};

        Contact cto = new Contact(FirstName = 'Cristian', LastName = 'Osorio', 
                                  Tipo_de_Identificaci_n__c = 'Cedula de Extranjería', Numero_de_Identificacion__c = '123');
        insert cto;

        List<Aeropuerto__c> aeropuertos = new List<Aeropuerto__c>();
        for (Integer i=0; i<2; i++) {
            Aeropuerto__c aero = new Aeropuerto__c(Name = aeroNombres[i],
            Codigo_IATA__c = codigos[i],
            Ciudad__c = ciudades[i]);
            aeropuertos.add(aero);
        }
        Insert aeropuertos;

        List<Aeropuerto__c> a = [SELECT Id FROM Aeropuerto__c];
        List<String> idAeros = new List<String>();
        idAeros.add(a[0].Id);
        idAeros.add(a[1].Id);

        Avion__c avion = new Avion__c(Tipo__c = 'Airbus A330');
        Insert avion;


        Product2 vuelo = new Product2(Name = 'AE-2005', Avion__c = avion.Id,
                                    Aeropuerto_de_Partida__c = idAeros[0],
                                    Aeropuerto_de_Llegada__c = idAeros[1],
                                    Fecha_y_hora_de_partida__c = Datetime.now(),
                                    Fecha_y_hora_estimada_de_llegada__c = Datetime.now().addDays(2));
        insert Vuelo;

        Id idEstandar = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry( Pricebook2Id = idEstandar, Product2Id = vuelo.Id, UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 turista = new Pricebook2(Name = 'Tiquetes Clase Negocios', IsActive = true);
        insert turista;
        Pricebook2 negocios = new Pricebook2(Name = 'Tiquetes Clase Turista', IsActive = true);  
        insert negocios;
        
        PricebookEntry entrada = new PricebookEntry(Pricebook2Id = turista.id, Product2Id = vuelo.Id, UnitPrice = 20000, IsActive = true);
        insert entrada;

        Opportunity reserva = new Opportunity(Titular_de_la_reserva__c = cto.id, Pricebook2Id = turista.id, CloseDate = Date.today(), StageName = 'Pre-Venta', name = 'a');
        insert reserva;

        OpportunityLineItem tiq = new OpportunityLineItem(OpportunityId = reserva.id, Pasajero__c = cto.id, Product2Id = vuelo.id);
        insert tiq;
    }

    @isTest
    public static void prueba() {
        Opportunity reserva = [SELECT id FROM Opportunity LIMIT 1];
        PageReference pageRef = Page.Reservapdf;
        pageRef.getparameters().put('recordId', reserva.id);  
        Test.setCurrentPage(pageRef);
        Apexpages.StandardController sc = new Apexpages.StandardController(reserva);
        ListaTiquetesPDF tiquetes = new  ListaTiquetesPDF(sc);
        List<Object> tiq = tiquetes.tiquetes;
        
        System.assert(tiq != null);

    }
}