public with sharing class VoucherPDF {
    public static void enviarEmailPDF(Opportunity reserva) {
        try {
            String[] emails = new List<String>();

            emails.add(reserva.Titular_de_la_reserva__r.Email);

            PageReference pagina = Page.ReservaPDF;
            pagina.getParameters().put('Id', reserva.Id);
            Blob b;
            if(Test.isRunningTest()) { 
                b = blob.valueOf('Unit.Test');
            } else {
                b = pagina.getContentAsPDF();
            }
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            Messaging.EmailFileAttachment adjunto = new Messaging.EmailFileAttachment();
            adjunto.setFileName('Tiquetes.pdf');
            adjunto.setBody(b);

            String addresses;
            email.setSenderDisplayName('Salesforce Support');
            email.setSubject('CONFIRMACIÓN DE RESERVA');
            email.setToAddresses(emails);
            email.setPlainTextBody('Hola ' + reserva.Titular_de_la_reserva__r.Name + ', para nosotros es un placer informale que su reserva número ' 
            + reserva.Numero_de_reserva__c + ' ha sido pagada exitosamente por un valor de '+ reserva.Valor_total__c + '. Adjunto a este mensaje ' +
            'encontraras toda la información necesaria.');
            email.setFileAttachments(new Messaging.EmailFileAttachment[] {adjunto});
            Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
            
        } catch (Exception e) {
            System.debug(e);
        }
       

        
        
    }
}
