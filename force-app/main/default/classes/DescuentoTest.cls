@isTest
public with sharing class DescuentoTest {
    @TestSetup
    static void makeData(){
        //Se crea un cliente recurrente con tipo de id y  numero de id, para realizar la busqueda
        Contact clienteRecurrecte = new Contact(lastName = 'Perez',
                                                Tipo_de_Identificaci_n__c = 'Cedula de Ciudadanía',
                                                Numero_de_Identificacion__c = '123456789');
        insert clienteRecurrecte;        
    }

    @isTest
    static void clienteRecurrenteTC(){
        Contact cliente = [select id, Tipo_de_Identificaci_n__c, Numero_de_Identificacion__c
                           from Contact
                            LIMIT 1];
        Descuento.respuestaDcto respuesta = Descuento.aplicarDescuento(cliente, Descuento.metodo.TC, 100);

        System.assert(respuesta.resultado);
        System.assertEquals(80, respuesta.valorConDcto);
        System.assert(respuesta.mensaje.contains(string.valueOf(descuento.metodo.TC)));                
    }

    @isTest
    static void clienteRecurrenteEectivo(){
        Contact cliente = [select id, Tipo_de_Identificaci_n__c, Numero_de_Identificacion__c
                           from Contact
                            LIMIT 1];
        Descuento.respuestaDcto respuesta = Descuento.aplicarDescuento(cliente, Descuento.metodo.EFECTIVO, 100);

        System.assert(respuesta.resultado);
        System.assertEquals(70, respuesta.valorConDcto);
        System.assert(respuesta.mensaje.contains(string.valueOf(descuento.metodo.EFECTIVO)));                
    }

    @isTest
    static void clienteNuevoTC(){
        Contact cliente = new Contact(LastName = 'Osorio', 
                                        Tipo_de_Identificaci_n__c = 'Cedula de Ciudadanía', 
                                        Numero_de_Identificacion__c = '3254556666');
        Descuento.respuestaDcto respuesta = Descuento.aplicarDescuento(cliente, Descuento.metodo.TC, 100);

        System.assert(respuesta.resultado);
        System.assertEquals(85, respuesta.valorConDcto);
        System.assert(respuesta.mensaje.contains(string.valueOf(descuento.metodo.TC)));                
    }
    @isTest
        static void clienteNuevoEectivo(){
        Contact cliente = new Contact(LastName = 'Osorio', 
                                        Tipo_de_Identificaci_n__c = 'Cedula de Ciudadanía', 
                                        Numero_de_Identificacion__c = '58522566');
        Descuento.respuestaDcto respuesta = Descuento.aplicarDescuento(cliente, Descuento.metodo.EFECTIVO, 100);

        System.assert(respuesta.resultado);
        System.assertEquals(85, respuesta.valorConDcto);
        System.assert(respuesta.mensaje.contains(string.valueOf(descuento.metodo.EFECTIVO)));                
    }

    // @isTest
    //     static void QueryException(){
    //         Contact cliente = [select id, Tipo_de_Identificaci_n__c, Numero_de_Identificacion__c
    //                             from Contact where lastName != 'Perez'
    //                             LIMIT 1];
    //         Descuento.respuestaDcto respuesta = Descuento.aplicarDescuento(cliente, Descuento.metodo.EFECTIVO, 100);


    //         System.assert(Descuento.descuentoException); 

    //     // System.assert(respuesta.resultado);
    //     // System.assertEquals(85, respuesta.valorConDcto);
    //     // System.assert(respuesta.mensaje.contains(string.valueOf(descuento.metodo.EFECTIVO)));                
    // }
}