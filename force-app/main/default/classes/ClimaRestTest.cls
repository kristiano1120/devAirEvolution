@isTest
public with sharing class ClimaRestTest {
    
    @TestSetup
    static void makeData(){
        Datetime tiempo = Datetime.now();
        List<Aeropuerto__c> aeropuertos = new List<Aeropuerto__c>();
        aeropuertos.add(new Aeropuerto__c(Name = 'Aeropuerto Internacional José María Cordova', Codigo_IATA__c = 'MDE',
                                        Ciudad__c = 'Medellín', Ubicacion__Latitude__s = 6.2443382,  Ubicacion__Longitude__s = -75.573553));
        aeropuertos.add(new Aeropuerto__c(Name = 'Aeropuerto Internacional El Dorado', Codigo_IATA__c = 'BOG',
                                        Ciudad__c = 'Bogotá', Ubicacion__Latitude__s = 4.6534649,  Ubicacion__Longitude__s = -74.0836453));
        insert aeropuertos;

        Avion__c avion = new Avion__c(Tipo__c = 'Airbus A330');
        insert avion;

        Product2 vuelo = new Product2(Name = 'AE-20005',Aeropuerto_de_partida__c = aeropuertos[0].Id,
                                     Aeropuerto_de_llegada__c= aeropuertos[1].Id, Fecha_y_hora_de_partida__c = tiempo.addMinutes(30),
                                     Fecha_y_hora_estimada_de_llegada__c = tiempo.addHours(2), Avion__c = avion.Id, IsActive = true);
        insert vuelo;
    }


    @isTest
    static void climaPartida(){
        test.startTest();
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('ClimaMock');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');

        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        // Call method to test
        
        ClimaRest.getClimaPartida();
        test.stopTest();

        List<Clima__c> clima = [SELECT Id FROM clima__c WHERE Temperatura__c = 299.71];

        System.assertEquals(1, clima.size());
    }
    @isTest
        static void climaLlegada(){
            test.startTest();
            StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
            mock.setStaticResource('ClimaMock');
            mock.setStatusCode(200);
            mock.setHeader('Content-Type', 'application/json;charset=UTF-8');

            // Associate the callout with a mock response
            Test.setMock(HttpCalloutMock.class, mock);
            // Call method to test
            
            ClimaRest.getClimaLlegada();
            test.stopTest();

            List<Clima__c> clima = [SELECT Id FROM clima__c WHERE Temperatura__c = 299.71];

            System.assertEquals(1, clima.size());
        }
}