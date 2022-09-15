public with sharing class ReservaTriggerHandler implements TriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public ReservaTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
    }

    public void beforeInsert(List<Opportunity> newRecords) {
        // helper.doTask1();
        // helper.doTask2(); 
        actualizarFechaSiPagado(newRecords);
        NombreDeReserva(newRecords);       
    }
    public void beforeUpdate(List<Opportunity> oldRecords, List<Opportunity> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap){
        // helper.doTask3();
        // helper.doTask4();
        actualizarFechaSiPagado(newRecords);
    }
    public void beforeDelete(List<Opportunity> oldRecords, Map<ID, sObject> oldOpportunityMap) {
        // helper.doTask5();
        // helper.doTask1();
    }
    public void afterInsert(List<Opportunity> newRecords, Map<ID, sObject> newOpportunityMap) {
        // helper.doTask2();
        // helper.doTask3();
    }
    public void afterUpdate(List<Opportunity> oldRecords, List<Opportunity> newRecords, Map<ID, sObject> oldOpportunityMap, Map<ID, sObject> newOpportunityMap) {
        // helper.doTask4();
        // helper.doTask5();
    }
    public void afterDelete(List<Opportunity> oldRecords, Map<ID, sObject> oldOpportunityMap) {
        // helper.doTask3();
        // helper.doTask1();
    }
    public void afterUndelete(List<Opportunity> newRecords, Map<ID, sObject> newOpportunityMap) {
        // helper.doTask4();
        // helper.doTask2();
    }

    //Si una reserva es pagada, actualizar fecha de pago y enviar correo al pasajero con la inf de su reserva.
    public static void actualizarFechaSiPagado(List<Opportunity> reserva){
        Set<Id> idContactos = new Set<Id>();
        for (Opportunity op : reserva) {
            idContactos.add(op.Titular_de_la_reserva__c);
        }
        Map<Id, Contact> titulares = new Map<Id, Contact>([SELECT id, Name, Email FROM Contact WHERE Id =: idContactos]); 

        for (Opportunity opp : reserva){
            if (opp.StageName == 'Pagado') {
                //Actualizar la fecha de pago
                opp.Fecha_de_pago__c = Date.today();
                
<<<<<<< HEAD
                /* //Enviar correo de reserva                
=======
                //Enviar correo de reserva                
>>>>>>> 1bac4c9bf2fbecc69e2ae9f4faf3ca6caf1b3203
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                //Direccion de envio
                String[] toAddresses = new String[] {titulares.get(opp.Titular_de_la_reserva__c).Email};                
                mail.setToAddresses(toAddresses);
                // Direccion de respuesta 
                mail.setReplyTo('kristiano1120@hotmail.com');
                // Nombre para mostrar
                mail.setSenderDisplayName('Salesforce Support');
                //Asunto
                mail.setSubject('CONFIRMACION DE RESERVA');
                //Cuerpo del mensaje
                String[] name = new String[] {titulares.get(opp.Titular_de_la_reserva__c).Name};                
                mail.setPlainTextBody('Hola '+ name +' para nosotros es un placer informale que su reserva número ' 
                + opp.Numero_de_reserva__c + ' ha sido pagada exitosamente por un valor de '+ opp.Valor_total__c);
                //Firma del mensaje
                mail.setUseSignature(false);
                //Mensaje
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                Messaging.SendEmailResult[] results = Messaging.sendEmail( new Messaging.SingleEmailMessage[] { mail });
                //Llamado a l metodo de prueba
                inspectResults(results); */
            }            
        }       
    }
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results. 
        // In this class, the methods send only one email, 
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());                 
            }
        }
        return sendResult;
    }
    
    public static void NombreDeReserva(List<Opportunity> reservas) {
        set <Id> TitularesID = new set<Id>();
        for(Opportunity opp : reservas){
            TitularesID.add(opp.Titular_de_la_reserva__c);
        }
        Map<Id, Contact>  Titulares = new Map<Id, Contact>([SELECT Name FROM Contact WHERE Id = : TitularesID]);
        
        for (Opportunity opp : reservas) {
            if(String.isNotEmpty(opp.Name)){
                String NumeroDeReserva = EncodingUtil.ConvertTohex(Crypto.GenerateAESKey(128)).substring(0,6);
                opp.Name = Titulares.get(opp.Titular_de_la_reserva__c).name + '-' + NumeroDeReserva;
                System.debug('nombre de reserva: '+ opp.Name);
            }
        }
    }
}