@IsTest
public class ReservaTest {	
    @testSetup
    static void makeData(){
        //Insertar dos contactos
        List<Contact> lista = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            Contact cto = new Contact(FirstName = 'Abigail', LastName = 'Gray', 
                                  Tipo_de_Identificaci_n__c = 'Cedula de Extranjería', Numero_de_Identificacion__c = String.valueof(i));
            lista.add(cto);
        }
        insert lista;
        String id = lista[0].Id;
        //Insertar avion 
        Avion__c avion = new Avion__c(Tipo__c  = 'Airbus A330', Numero_de_pasajeros_negocios__c = 30, Numero_de_pasajeros_Clase_Turista__c = 222);
        insert avion;
        String idAvion = avion.Id;
        List<Product2> Vuelos = new List<Product2>();
        for(Integer i = 0; i < 2; i++){
            Product2 vuelo = new Product2(Name = 'AE-2552', Fecha_y_hora_de_partida__c = System.today().addDays(2), Avion__c = idAvion );
            Vuelos.add(vuelo);
        }
        insert Vuelos;
        String idV = Vuelos[0].Id;
        Id idEstandar = Test.getStandardPricebookId();
        //Insertar entrada de precios estandar
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = idEstandar, Product2Id = idV,
                                                          UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 negocios = new Pricebook2(Name = 'Tiquetes Clase Negocios', IsActive = true);
        insert negocios;

        
        Pricebook2 turista = new Pricebook2(Name = 'Tiquetes clase turista', IsActive = true);
        insert turista;
        
        PricebookEntry entrada = new PricebookEntry(Pricebook2Id = turista.id, Product2Id = idV, UnitPrice = 20000, isActive = true);
        insert entrada;
        
        
        Opportunity res = new Opportunity(Name = 'A', Titular_de_la_reserva__c = id, CloseDate = System.today(), StageName = 'Pre-venta', Pricebook2Id = turista.Id);
        Insert res;
        
        
		       
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
    //Método prueba obtenerVuelo
    @isTest
    static void obtenerVuelos(){
        Pricebook2 idlist = [select id from Pricebook2 WHERE Name = 'Tiquetes clase turista'];
		String idp  =  idlist.Id;   
        List<Reserva.vueloWrapper> test = Reserva.obtenerVuelos(idp);
        System.assertEquals(1, test.size());
    }
    //Método prueba obtenerListaPrecios id
    @isTest
    static void obtenerListaPrecios(){
        Pricebook2 idlist = [select id, name from Pricebook2 WHERE Name = 'Tiquetes clase turista'];
        //String nombre = idlist.Name;
		String idp  =  idlist.Id;
        System.assertEquals(idp, Reserva.obtenerListaPrecios('Tiquetes clase turista'));
    }
    //Método prueba crearTiquete
    @isTest
    static void crearTiquete(){
        Contact cto = [select id from Contact WHERE Numero_de_Identificacion__c = '0' limit 1];
        String idCto = cto.Id;
        Opportunity res = [select id from Opportunity Limit 1];
        String idR = res.Id;
        List<Product2> vuelo = [select id from Product2];
        String idVuelo = vuelo[0].Id;  
        
        Reserva.crearTiquete(idR, idVuelo, idCto);
        List<OpportunityLineItem> tiquete = [select id from OpportunityLineItem];
        System.debug('Este--->'+ tiquete);
        
        
        
        system.assertEquals(1,tiquete.size());
    }
    @isTest
    static void crearTiqueteExc(){
        Contact cto = [select id from Contact WHERE Numero_de_Identificacion__c = '0' limit 1];
        String idCto = cto.Id;
        Opportunity res = [select id from Opportunity Limit 1];
        String idR = res.Id;
        List<Product2> vuelo = [select id from Product2];
        String idVuelo = vuelo[1].Id; 
        
        Reserva.crearTiquete(idR, idVuelo, idCto);
        List<OpportunityLineItem> tiquete = [select id from OpportunityLineItem];
        System.debug('Este--->'+ tiquete);
        
        
        
        system.assertEquals(null, Reserva.crearTiquete(idR, idVuelo, idCto));
    }
    
        
    
}