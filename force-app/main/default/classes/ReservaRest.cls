@RestResource(urlMapping = '/Opportunity/*')
global with sharing class ReservaRest {
    @HttpPost
    global static creaReserva crearReserva(String documento, string tipo, String idLista, String idVuelo, 
                                            String email, String fechaNacimiento, String pasaporte, String nombres, String apellidos) {
        Contact con = null;
        Opportunity res = null;
        Date fechaCierre = Date.today();
        //String idEntradaP = idEntrada;
        Date nacimiento = Date.parse(fechaNacimiento);
                
        List<Opportunity> resList = new List<Opportunity>();       

        List<Contact> cto = [SELECT Id, Name, Numero_de_Identificacion__c, Tipo_de_Identificaci_n__c
                    FROM Contact
                    WHERE Numero_de_Identificacion__c = :documento
                    AND Tipo_de_Identificaci_n__c = :tipo
                    lIMIT 1];
        if (cto.size() > 0) {
            con = cto[0];
            resList = [SELECT Id, Name, Titular_de_la_reserva__r.Name, StageName
                            FROM Opportunity
                            WHERE Titular_de_la_reserva__c = :con.id
                            AND StageName NOT IN ('Pagado', 'Completado')];
            if (resList.size() > 0) {
                res = resList[0];
            }else{
                res = new Opportunity(Name = 'a', CloseDate = fechaCierre, StageName = 'Pre-venta',
                                                Titular_de_la_reserva__c = con.Id,
                                                Pricebook2Id = idLista);
                Insert res;    
            } 
        }else{
            con = new Contact(FirstName = nombres, LastName = apellidos, Tipo_de_Identificaci_n__c = tipo,
                                Numero_de_Identificacion__c = documento, N_mero_de_Pasaporte__c = pasaporte, Email = email,
                                Birthdate =  nacimiento);
            Insert con;
            res = new Opportunity(Name = 'a', CloseDate = fechaCierre, StageName = 'Pre-venta',
                                                Titular_de_la_reserva__c = con.Id,
                                                Pricebook2Id = idLista);
            Insert res;
        }
        
        
        creaReserva resultado = new creaReserva(con, res, idLista);  

        Reserva.crearTiquete(res.Id, idVuelo, con.Id);
        return resultado;
    }    

    global class creaReserva{
        global Contact contacto;
        global Opportunity reserva;
        global String entradaPrecios;       
        

        global creaReserva(Contact contacto, Opportunity reserva, String entradaPrecios){
            this.contacto = contacto;
            this.reserva = reserva;
            this.entradaPrecios = entradaPrecios;
        }        
    }

    @HttpPatch
    global static reservaWrapper pagarReserva(String resId, Decimal valor) {
         reservawRAPPER respuesta;
         Opportunity resn = new Opportunity();
        if (resId == null) {
            respuesta = new reservaWrapper(resn, 'Debe ingresar el Id de la reserva', false);
            return respuesta;            
        }
        if (valor == null) {
            respuesta = new reservaWrapper(resn, 'Debe ingresar el valor a pagar', false);
            return respuesta;            
        }

        Opportunity res = [SELECT id, Name, Numero_de_reserva__c, Valor_total__c, StageName,
                            Titular_de_la_reserva__r.Name, Titular_de_la_reserva__r.Email 
                            FROM Opportunity
                            WHERE id = :resId limit  1];

        if (valor >= res.Valor_total__c) {
            resn.Id = res.Id;
            resn.StageName = 'Pagado';
            respuesta = new reservaWrapper(resn, 'Reserva pagada exitosamente', true);    
           
            
        } else {
            respuesta = new reservaWrapper(null, 'El monto es insuficiente', false);
            return respuesta;
        }
        VoucherPDF.enviarEmailPDF(res);
        Update resn;
        return respuesta;    
    }

    global class reservaWrapper {
        global Opportunity reserva;
        global String mensaje;
        global Boolean resultado;

        global reservaWrapper(Opportunity reserva, String mensaje, Boolean resultado){
            this.reserva = reserva;
            this.mensaje= mensaje;
            this.resultado = resultado;
        }
    }
}
