public with sharing class Tripulacion {
    @AuraEnabled(cacheable = true)
    public static List<vuelo> obternerVuelos(){
        try{
            DateTime limitDate = DateTime.now().addDays(7);
            List<Product2> vuelos = [SELECT Id, Name, Cantidad_tripulantes_asignados__c, Copiloto__c, Piloto__c, 
                                    Fecha_y_hora_de_partida__c, Avion__r.Auxiliares_de_Vuelo_Requeridos__c, 
                                    (SELECT id FROM Auxiliares_x_Vuelos1__r)
                                    FROM Product2
                                    WHERE IsActive = true AND Estado__c = 'En venta' AND
                                    Fecha_y_hora_de_partida__c > today And 
                                    Fecha_y_hora_de_partida__c <: limitDate];
            List<vuelo> vuelosRta = new List<vuelo>();
            for(Product2 v : vuelos){
                vuelosRta.add(new vuelo((String)v.id, v.name, (Integer)v.Avion__r.Auxiliares_de_Vuelo_Requeridos__c, v.Copiloto__c, v.Piloto__c, v.Auxiliares_x_Vuelos1__r.size()));
            }
            system.debug(vuelosRta);
            return vuelosRta;
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }    

    @AuraEnabled(cacheable = true)
    public static List<opcion> obtenerAxiliares(String idVuelo){
        try {
            List<Contact> auxiliares = [SELECT Name
                                        FROM Contact
                                        WHERE RecordType.name = 'Auxiliar de vuelo'
                                        LIMIT 20];
            List<Auxiliares_x_Vuelo__c> tripulantes = [SELECT Id, Nombre_de_Tripulante__c, Nombre_de_Tripulante__r.name
                                                          FROM Auxiliares_x_Vuelo__c
                                                        WHERE Vuelo__c =: idVuelo];
            
            list<opcion> opciones = new list<opcion>();
            for(Contact c : auxiliares){
                opciones.add(new opcion(c.name,c.id,false));
            }
                                            
            for(Auxiliares_x_Vuelo__c t : tripulantes){
                opciones.add(new opcion(t.Nombre_de_Tripulante__r.name ,t.Nombre_de_Tripulante__c,true));
            }
            return opciones;

            

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void saveAuxiliares(List<string> auxiliares, string idvuelo){
        try {
            //estos son los tripulantes que ya existen
            List<Auxiliares_x_Vuelo__c> tripulantes = [SELECT id, Nombre_de_Tripulante__c, Nombre_de_Tripulante__r.Name 
                                                FROM Auxiliares_x_Vuelo__c
                                                WHERE Vuelo__c =: idVuelo];
            
            set<string> noEncontrados = new set<string>();
            for(Auxiliares_x_Vuelo__c t : tripulantes){
                for(integer i = 0; i < auxiliares.size(); i++){
                    // vamos a remover los existentes de la lista que llego para no duplicarlos
                    if(t.Nombre_de_Tripulante__c == auxiliares[i]){
                        auxiliares.remove(i);
                        if(noEncontrados.contains(t.id)){
                            noEncontrados.remove(t.id);
                        }
                    } else {
                        // si no lo encuentra lo agrega a una lista para luego eliminarlos
                        noEncontrados.add(t.id);
                    }
                }
            }
            
            //creamos los nuevos tripulantes
            List<Auxiliares_x_Vuelo__c> nuevosTripulantes = new List<Auxiliares_x_Vuelo__c>();
            for(string a : auxiliares){
                nuevosTripulantes.add(new Auxiliares_x_Vuelo__c(vuelo__c = idVuelo, Nombre_de_Tripulante__c = a));
            }
            system.debug('nuevosTripulantes-->'+nuevosTripulantes);
            insert nuevosTripulantes;

            //eliminamos los que ya no van
            system.debug('noEncontrados-->'+noEncontrados);
            List<Auxiliares_x_Vuelo__c> paraBorrar = new List<Auxiliares_x_Vuelo__c>();
            for(string idT : noEncontrados){
                paraBorrar.add(new Auxiliares_x_Vuelo__c(id = idT));
            }
            delete paraBorrar;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class AuraHandledException extends Exception {}    

    public class vuelo{
        @AuraEnabled
        public string idVuelo;
        @AuraEnabled
        public string codVuelo;
        @AuraEnabled
        public Integer numAuxiliares;
        @AuraEnabled
        public Integer numAuxiliaresFaltantes;
        @AuraEnabled
        public Boolean piloto;
        @AuraEnabled
        public Boolean copiloto;

        public vuelo(String id, String name, Integer auxiliares, String copilotoId, String pilotoId, Integer sizeTripulantes){
            idVuelo = id;
            codVuelo = name;
            numAuxiliares = auxiliares;
            numAuxiliaresFaltantes = auxiliares - sizetripulantes;
            copiloto = !String.isBlank(copilotoId);
            piloto = !String.isBlank(pilotoId);
        }   
    }

    public class opcion{
        @AuraEnabled
        public string label;
        @AuraEnabled
        public string value;
        @AuraEnabled
        public Boolean selected;

        public opcion(String label, String value, Boolean selected){
            this.label = label;
            this.value = value;
            this.selected = selected;
        }
        
        
            
    }




    @AuraEnabled
    public static List<Contact> obtenerPilotos(){
        List<Contact> pilotos = [SELECT Id, Name FROM Contact WHERE RecordType.Name = 'Piloto'];

        return pilotos;
        
    }
}