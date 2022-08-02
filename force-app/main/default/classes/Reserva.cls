public with sharing class Reserva {
    
    @AuraEnabled(cacheable = true)    
    public static Contact buscarContacto(String documento, string tipo) {
        String mensaje= '';

        Contact cto = [SELECT Id, Name, Numero_de_Identificacion__c, Tipo_de_Identificaci_n__c
                        FROM Contact
                        WHERE Numero_de_Identificacion__c = :documento
                        AND Tipo_de_Identificaci_n__c = :tipo];

        
        return cto;
    }
    
}