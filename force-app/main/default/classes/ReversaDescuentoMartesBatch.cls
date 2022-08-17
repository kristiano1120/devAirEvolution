public with sharing class ReversaDescuentoMartesBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, UnitPrice FROM PricebookEntry WHERE Descuento_50__c = FALSE AND Descuento_martes__c = TRUE' );
    }

    public void execute(Database.BatchableContext BC, List<PricebookEntry> prices){
        for(PricebookEntry p : prices){
            Decimal precio = p.UnitPrice;
            p.UnitPrice = precio / 0.65;
            p.Descuento_martes__c = false;        
        } 
        update prices;
        
        Profile ventas = [SELECT Id, Name FROM Profile WHERE Name = 'Grupo de Ventas' LIMIT 1];
        List<User> usuarios = [SELECT Id, Name FROM User WHERE ProfileId = :ventas.Id AND isActive = true];

        CustomNotificationType notificationType = [SELECT Id, DeveloperName 
                                                    FROM CustomNotificationType 
                                                    WHERE DeveloperName='Finalizacion_martes_de_descuento'];
        Messaging.CustomNotification notification = new Messaging.CustomNotification();        

        Set<String> recipientsIds = new Set<String>();
        if (usuarios.size() > 0) {
            for (User u : usuarios) {
                recipientsIds.add(u.Id);
            }
            notification.setTitle('Finalizacion de descuento');
            notification.setBody('Ha finalizado el descuento semanal del 65% en los tiquetes');
            notification.setNotificationTypeId(notificationType.Id);
            notification.setTargetId('01s8a000002iSB7AAM');
            try {
                notification.send(recipientsIds);
            }
            catch (Exception e) {
                System.debug('Problem sending notification: ' + e.getMessage());
            }
        }

    }

    public void finish(Database.BatchableContext BC){
        
    }
}