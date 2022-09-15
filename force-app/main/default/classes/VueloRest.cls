@restResource(urlMapping = '/Product2/*')
global with sharing class VueloRest{
<<<<<<< HEAD
    
    @httpGet
    global static vueloWrapper getVuelos(){
        vueloWrapper respuesta;
        try{
            String fecha1;
            String fecha2;        
            String ciudadPartida;
            String ciudadDestino;
            Date fechaPartida;            
            Date fechaLlegada;
            
            List<Product2> vuelos;
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            
            fecha1 = (request.params.get('fecha1')).replace('-', '/');
            fecha2 = (request.params.get('fecha2')).replace('-', '/');
            ciudadPartida = request.params.get('ciudadPartida');
            ciudadDestino = request.params.get('ciudadDestino');

            try {
                fechaPartida = Date.parse(fecha1);
           } catch (Exception e) {
               respuesta = new vueloWrapper(new List<Product2>(),'Formato de fecha de partida incorrecto, ingrese DD-MM-YYYY', false);
               return respuesta;
           }
   
           try {
            fechaLlegada = Date.parse(fecha2);
           } catch (Exception e) {
               respuesta = new vueloWrapper(new List<Product2>(),'Formato de fecha de llegada incorrecto, ingrese DD-MM-YYYY', false);
               return respuesta;
           }
            
            
            
            
            /* Datetime fechaPartida = Datetime.newInstance(fechaUno.year(), fechaUno.month(), fechaUno.day());
            Datetime fechaLlegada = Datetime.newInstance(fechados.year(), fechados.month(), fechados.day()); */
            Schema.DescribeFieldResult ciudades = Aeropuerto__c.Ciudad__c.getDescribe();
            List<Schema.PicklistEntry> ciudadesDispo =  ciudades.getPicklistValues();
            List<String> ciudad = new List<String>();
            for (Schema.PicklistEntry c : ciudadesDispo) {
                ciudad.add(c.getValue());
            }            
            
            if(!ciudad.contains(ciudadPartida)){
                respuesta = new vueloWrapper(new List<Product2>(),'La cuidad de partida no tiene cobertura', false);
                return respuesta;
            }else if(!ciudad.contains(ciudadDestino)){
                respuesta = new vueloWrapper(new List<Product2>(),'La cuidad de llegada no tiene cobertura', false);
                return respuesta;
            }     

            respuesta = new vueloWrapper(new List<Product2>(),'Respuesta exitosa', true);
            respuesta.vuelitos = [SELECT Id, Name, fecha_y_hora_de_partida__c, Fecha_y_hora_estimada_de_llegada__c, Aeropuerto_de_Partida__r.Name, Aeropuerto_de_Llegada__r.Name, 
                    (SELECT Id, unitPrice FROM PricebookEntries) FROM Product2 
                    WHERE fecha_y_hora_de_partida__c >= :fechaPartida
                    AND Fecha_y_hora_estimada_de_llegada__c <= :fechaLlegada
                    AND Aeropuerto_de_Partida__r.Ciudad__c = :ciudadPartida
                    AND Aeropuerto_de_Llegada__r.Ciudad__c = :ciudadDestino];

            return respuesta;

        }catch(exception e){
            throw new MyException('Algo salio mal');
        }
        
    }
    
    public class MyException extends Exception{}

    global class vueloWrapper{
        global List<Product2> vuelitos;
        global String mensaje;
        global Boolean resultado;
        
        global vueloWrapper(List<Product2> vuelitos, String mensaje, Boolean resultado) {
            this.vuelitos = vuelitos;
            this.mensaje = mensaje;
            this.resultado = resultado;             
        }
    }
=======

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

>>>>>>> 1bac4c9bf2fbecc69e2ae9f4faf3ca6caf1b3203
}