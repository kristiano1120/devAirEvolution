public class ListaTiquetesPDF {
    
    public List<OpportunityLineItem> tiquetes {get; set;}
    
    public ListaTiquetesPDF(ApexPages.StandardController std){
        if(std.getRecord().Id != null){
            String idReserva = std.getRecord().Id;
            tiquetes = [SELECT id, name, Pasajero__r.Name, Pasajero__r.Tipo_de_Identificaci_n__c,
                        Pasajero__r.Numero_de_Identificacion__c, UnitPrice, TotalPrice, Puerta_de_Embarque__c, Equipaje_permitido__c,
                        Product2.Name, Product2.Aeropuerto_de_Partida__c, Product2.Aeropuerto_de_Llegada__c, 
                        Product2.Fecha_y_hora_de_partida__c, Product2.Fecha_y_hora_estimada_de_llegada__c, Asiento__c FROM OpportunityLineItem
                       WHERE OpportunityId = :idReserva];
        }else{
            tiquetes = new List<OpportunityLineItem>();
        }
    }

}