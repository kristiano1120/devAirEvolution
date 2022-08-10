public with sharing class Reserva {   
    
    @AuraEnabled(cacheable = true)    
    public static creaReserva buscarContacto(String documento, string tipo) {
        Contact con = null;
        Opportunity res = null;
                
        List<Opportunity> resList = new List<Opportunity>();       

        List<Contact> cto = [SELECT Id, Name, Numero_de_Identificacion__c, Tipo_de_Identificaci_n__c
                    FROM Contact
                    WHERE Numero_de_Identificacion__c = :documento
                    AND Tipo_de_Identificaci_n__c = :tipo
                    lIMIT 1];
        if (cto.size() > 0) {
            con = cto[0];
            resList = [SELECT Id, Name, StageName
                            FROM Opportunity
                            WHERE Titular_de_la_reserva__c = :con.id
                            AND StageName NOT IN ('Pagado', 'Completado')];
            if (resList.size() > 0) {
                res = resList[0];
            } 
        }               
        
        creaReserva resultado = new creaReserva(con, res);       

        return resultado;
    }    

    public class creaReserva{
        @AuraEnabled
        public Contact contacto;
        @AuraEnabled        
        public Opportunity reserva;       
        

        public creaReserva(Contact pasajero, Opportunity oportunidad){
            contacto = pasajero;
            reserva = oportunidad;
        }        
    }


    @AuraEnabled(cacheable = true)
    public static List<vueloWrapper> obtenerVuelos(String idPrecio){
       List<Product2> vuelos = [SELECT Id, Name, Aeropuerto_de_Partida__r.Name, Aeropuerto_de_Llegada__r.Name, 
                                Fecha_y_hora_de_partida__c, Fecha_y_hora_estimada_de_llegada__c,
                                (Select unitPrice from PricebookEntries WHERE   Pricebook2Id = :idPrecio)
                                FROM Product2
                                WHERE Fecha_y_hora_de_partida__c > today];
        List<vueloWrapper> lista = new List<vueloWrapper>();
        for (Product2 v : vuelos) {
            if (v.PricebookEntries.size() > 0) {
                lista.add(new vueloWrapper((String)v.Id, v.name, v.Aeropuerto_de_Partida__r.Name, v.Aeropuerto_de_Partida__r.Name,
                v.Fecha_y_hora_de_partida__c, v.Fecha_y_hora_estimada_de_llegada__c, v.PricebookEntries[0].UnitPrice));
            }            
        }

        return lista;
    }

    public class vueloWrapper{
        @AuraEnabled
        public String idVuelo;
        @AuraEnabled
        public String nombreVuelo;
        @AuraEnabled
        public String aeroPartida;
        @AuraEnabled
        public String aeroLlegada;
        @AuraEnabled
        public Datetime fechaPartida;
        @AuraEnabled
        public Datetime fechaLlegada;
        @AuraEnabled
        public Decimal valor;
        

        public vueloWrapper(String id, String nombre, String apartida, String allegada, Datetime fPartida, Datetime fllegada, Decimal precio) {
            idVuelo = id;
            nombreVuelo = nombre;
            aeroPartida = apartida;
            aeroLlegada = allegada;
            fechaPartida = fPartida;
            fechaLlegada = fllegada;
            valor = precio;       
        }    
    }

    @AuraEnabled(cacheable = true)
    public static String obtenerListaPrecios(String nombre){
        Pricebook2 lista = [SELECT Id FROM Pricebook2 WHERE Name = :nombre LIMIT 1];
        String idPrecios = lista.Id;
        return idPrecios;
    }

    @AuraEnabled
    public static OpportunityLineItem crearTiquete(String reserva, String vuelo, String contacto){
        try {
            OpportunityLineItem tiquete = new OpportunityLineItem(OpportunityId = reserva, Product2Id = vuelo, Pasajero__c = contacto);
            insert tiquete;
            String mensaje = 'Hola creé el tiquete';
            Opportunity op = new Opportunity(Id = reserva, StageName = 'Completado');
            Update op;
            return tiquete;
            
        } catch (Exception e) {
            System.debug(e.getMessage());
            return null;
        }
    }
}