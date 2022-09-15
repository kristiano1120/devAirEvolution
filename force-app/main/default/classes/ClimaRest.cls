global with sharing class ClimaRest {
    
    
    global static void getClimas(){
        
        String key = 'cd1c441e329b68884d1b729d57889a22';
        DateTime fechaPartida = System.now().addHours(24);
        DateTime fechaLlegada = System.now().addHours(1);
        DateTime fechaTomada = System.now();
        String unidad = 'Centigrados';
        Decimal temperatura;
        Decimal latitud;
        Decimal longitud;
        String  aeropuerto;
        List<Product2> vuelos  = [SELECT Id, Name, Fecha_y_hora_de_partida__c, Aeropuerto_de_Partida__r.Ubicacion__latitude__s, Aeropuerto_de_Partida__r.Ubicacion__longitude__s,
                                Aeropuerto_de_Llegada__r.Ubicacion__latitude__s, Aeropuerto_de_Llegada__r.Ubicacion__longitude__s 
                                FROM Product2 WHERE Fecha_y_hora_de_partida__c > :fechaTomada];
        List<Clima__c> climas = new List<Clima__c>();
        for (Product2 v : vuelos) {
            if (v.fecha_y_hora_de_partida__c <= fechaPartida) {
                latitud = v.Aeropuerto_de_Partida__r.Ubicacion__latitude__s;
                longitud = v.Aeropuerto_de_Partida__r.Ubicacion__longitude__s;
                aeropuerto = v.Aeropuerto_de_Partida__r.Id;                
            }
            if (v.fecha_y_hora_de_partida__c <= fechaLlegada) {
                latitud = v.Aeropuerto_de_Partida__r.Ubicacion__latitude__s;
                longitud = v.Aeropuerto_de_Partida__r.Ubicacion__longitude__s; 
                aeropuerto = v.Aeropuerto_de_llegada__r.Id;                
            }
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://api.openweathermap.org/data/2.5/weather?lat='+latitud+'&lon='+longitud+'&appid='+key+'&units=metric');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == 200) {
                Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
                Map<String, Object> temp = (Map<String, Object>) result.get('main');
                temperatura = (decimal)temp.get('temp');
                Clima__c clima = new Clima__c(Aeropuerto__c = Aeropuerto, Temperatura__c = temperatura,
                                            Unidad_de_Medida__c = unidad, Fecha_y_Hora_Prediccion__c = fechaTomada);
                climas.add(clima);
                
                System.debug(latitud);
                System.debug(longitud);
            }              
        }
        Insert climas;
    } 
     
}