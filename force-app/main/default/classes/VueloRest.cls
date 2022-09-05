@restResource(urlMapping = '/Product2/*')
global with sharing class VueloRest{

    @httpGet
    global static List<Product2> getVuelos(){
        String fecha1;
        String fecha2;        
        String ciudadPartida;
        String ciudadDestino;
        List<Product2> vuelos;
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        fecha1 = (request.params.get('fecha1')).replace('-', '/');
        fecha2 = (request.params.get('fecha2')).replace('-', '/');
        ciudadPartida = request.params.get('ciudadPartida');
        ciudadDestino = request.params.get('ciudadDestino');

        Date fechaUno = Date.parse(fecha1);
        Date fechados = Date.parse(fecha2);
        Datetime fechaPartida = Datetime.newInstance(fechaUno.year(), fechaUno.month(), fechaUno.day());
        Datetime fechaLlegada = Datetime.newInstance(fechados.year(), fechados.month(), fechados.day());


        vuelos = [SELECT Name, Aeropuerto_de_Partida__r.Name, Aeropuerto_de_Llegada__r.Name FROM Product2 WHERE fecha_y_hora_de_partida__c >= :fechaPartida
                                AND Fecha_y_hora_estimada_de_llegada__c <= :fechaLlegada
                                AND Aeropuerto_de_Partida__r.Ciudad__c = :ciudadPartida
                                AND Aeropuerto_de_Llegada__r.Ciudad__c = :ciudadDestino];
        return vuelos;
    }

}