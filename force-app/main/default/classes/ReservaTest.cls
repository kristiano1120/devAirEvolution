@IsTest
public class ReservaTest {
	
    @testSetup
    static void makeData(){
        //Data para metodo buscarContacto
        List<Contact> lista = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            Contact cto = new Contact(FirstName = 'Abigail', LastName = 'Gray', 
                                  Tipo_de_Identificaci_n__c = 'Cedula de Extranjería', Numero_de_Identificacion__c = String.valueof(i));
            lista.add(cto);
        }
        insert lista;
        
        String id = lista[0].Id;
        
        Opportunity res = new Opportunity(Name = 'A', Titular_de_la_reserva__c = Id, CloseDate = System.today(), StageName = 'Preventa');
        Insert res;
        
        //Data para metodo obtenerVuelo        
        List<Product2> Vuelos = new List<Product2>();
        for(Integer i = 0; i < 2; i++){
            Product2 vuelo = new Product2(Name = 'AE-2552', Fecha_y_hora_de_partida__c = System.today().addDays(i));
            Vuelos.add(vuelo);
        }
        insert Vuelos;
        /*String idV = Vuelos[0].Id;
        Pricebook2 listP = new Pricebook2(Name = 'Tiquetes clase turista', IsStandard = true);
        insert listP;
        PricebookEntry entrada = new PricebookEntry(Pricebook2Id = listP.Id, Product2Id	= idV, UnitPrice = 123, UseStandardPrice = true);
        insert entrada;*/
    }
    //Métodos prueba buscarContacto
    @isTest
    static void buscarContactoSiReserva(){
        Reserva.creaReserva test = Reserva.buscarContacto('0', 'Cedula de Extranjería');
        System.assert(test.contacto != null);
        System.assert(test.Reserva != null);
    }
    @isTest
    static void buscarContactoNoReserva(){
        Reserva.creaReserva test = Reserva.buscarContacto('1', 'Cedula de Extranjería');
        System.assert(test.contacto != null);
        System.assert(test.Reserva == null);
    }
    @isTest
    static void busquedaFallida(){
        Reserva.creaReserva test = Reserva.buscarContacto('123', 'Cedula de Extranjería');
        System.assert(test.contacto == null);
        System.assert(test.Reserva == null);
    }
    //Métodos prueba obtenerVuelo
    @isTest
    static void obtenerVuelos(){
        /*Pricebook2 idlist = [select id from Pricebook2 limit 1];
		String idp  =  idlist.Id;*/    
        List<Reserva.vueloWrapper> test = Reserva.obtenerVuelos('01s8a000002iSB7AAM');
        System.assertEquals(0, test.size());
    }
    
    
}