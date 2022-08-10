import { LightningElement, wire } from 'lwc';
import buscarContacto from '@salesforce/apex/Reserva.buscarContacto';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import obtenerVuelos from '@salesforce/apex/Reserva.obtenerVuelos';
import obtenerListaPrecios from '@salesforce/apex/Reserva.obtenerListaPrecios';
import crearTiquete from '@salesforce/apex/Reserva.crearTiquete';

const actions = [{
    label: 'Seleccionar', name: 'seleccionar',
},];

const columns = [
    { label: 'Vuelo', fieldName: 'nombreVuelo' },
    { label: 'Aeropuerto de partida', fieldName: 'aeroPartida', type: 'text' },
    { label: 'Aeropuerto de llegada', fieldName: 'aeroLlegada', type: 'text' },
    { label: 'Fecha de partida', fieldName: 'fechaPartida', type: 'date' },
    { label: 'Fecha de llegada', fieldName: 'fechaLlegada', type: 'date' },    
    { label: 'Valor', fieldName: 'valor'},    
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];

export default class NuevaReserva extends LightningElement {
   

   


    //Mostrar ocultar modal
    modalExisteOpen;
    modalNoExisteOpen;
    seleccionarVueloModal
    seleccionarLista;
    seleccionarPasajerosModal;
    
    closeModalE(){
        this.modalExisteOpen = false;
    }
    closeModalESeleccionVuelo(){
        this.modalExisteOpen = false;
        this.seleccionarVueloModal = true;
        this.seleccionarLista = true;
    }
    closeSeleccionarPasajerosModal(){
        this.seleccionarPasajerosModal = false;
    }
    closeModalNe(){
        this.modalNoExisteOpen = false;
        
    }
    closeModalSeleccionar(){
        this.seleccionarVueloModal = false;
    } 
    

     //propiedades
    tablaContact;
    tablaReserva;
    reservaComponent;
    doc;    
    tipo;
    lista;
    idLista;   
    contacto;
    reserva;
    mensaje;
    error;      
    
    //opciones para tipo de documento del cliente
    get options() {
        return [
            { label: 'Cedula de Ciudadanía', value: 'Cedula de Ciudadanía' },
            { label: 'Cedula de Extranjería', value: 'Cedula de Extranjería' },
            { label: 'Tarjeta de Identidad', value: 'Tarjeta de Identidad' },
        ];
    }
    //opciones para tipo vuelo seleccionado
    get optionsLista() {
        return [
            { label: 'Tiquetes Clase Turista', value: 'Tiquetes Clase Turista' },
            { label: 'Tiquetes Clase Negocios', value: 'Tiquetes Clase Negocios' },
            { label: 'Tiquetes Carga', value: 'Tiquetes Carga' },
        ];
    }
    
    //eventos de obtencion de tipo y numero de documento del cliente
    eventChange(event){
        this.doc = event.target.value; 
            console.log(this.doc);
        }
    handleChange(event){
        this.tipo = event.detail.value;
        console.log(this.tipo);
    } 
   
    
    //mensajes de confirmacion flotantes
    showToastReserva() {
        const event = new ShowToastEvent({
            title: 'Creacion Reserva',
            message:
                'Reserva creada exitosamente',
            variant: 'success',    
        });
        this.dispatchEvent(event);
    }
    showToastContacto() {
        const event = new ShowToastEvent({
            title: 'Creacion Contacto',
            message:
                'Contacto creado exitosamente',
            variant: 'success',    
        });
        this.dispatchEvent(event);
    }

    //obtiene la info del contacto y la reserva para verificar si existe ese contacto y si hay una reserva a su nombre que impida la creacion de una nueva
    handleBuscar(event){
        buscarContacto({documento: this.doc, tipo: this.tipo})
        .then((result) => {   
                this.contacto = result.contacto;
                this.reserva = result.reserva;   
                console.log(this.contacto);
                console.log(this.reserva);      
                console.log(this.idLista1);      
            if (this.contacto == undefined) {
                this.modalNoExisteOpen = true;
            }else{
                this.modalExisteOpen = true;                
                this.tablaContact = true;                
                if (this.reserva == undefined) {
                    this.tablaReserva = false;
                    this.seleccionarLista = true; 
                    this.reservaComponent = true;    
                } else {
                    this.tablaReserva = true;                    
                }         
            }
            this.error = undefined;       
        }).catch((err) => {
            if (result.contacto == undefined) {
                this.error = err;
                this.contacto = undefined;
                this.modalNoExisteOpen = true;              
            }   
        });        
    }
    //obtiene el Id de la lista de precios de acuerdo a lo que elija el agente para crear la reserva y los respectivos tiquetes al cliente
    handleChangeLista(event){
        this.lista = event.detail.value;
        console.log(this.lista);  
        obtenerListaPrecios({nombre: this.lista})
        .then((result) => {   
            this.idLista = result;
            console.log('hola-->'+result);    
            console.log('hola-->'+this.idLista);    
        }).catch((err) => {
            console.log('hola-->'+this.err);    
        });              
    }
   
    
    //propiedades tabla contacto
    get nombre(){
        if (this.contacto != null) {
            return this.contacto.Name;            
        } else {
            return '' 
        }
    }
    get numId(){
        if (this.contacto != null) {
            return this.contacto.Numero_de_Identificacion__c;            
        } else {
            return '' 
        }
    }
    get tipoId(){
        if (this.contacto != null) {
            return this.contacto.Tipo_de_Identificaci_n__c;            
        } else {
            return '' 
        }
    }
    get nombreReserva(){
        if (this.reserva != null) {
            return this.reserva.Name;            
        } else {
            return '' 
        }
    }
    get estado(){
        if (this.reserva != null) {
            return this.reserva.StageName;            
        } else {
            return '' 
        }
    }
    get idContacto(){
        if (this.contacto != null) {
            return this.contacto.Id;            
        } else {
            return '' 
        }
    }
    /* get idReserva(){if (this.reserva != null) {
        return this.reserva.Id;            
        } else {
            return '' 
        }
    } */
    //propiedad  id lista de precios 
    get idLista1(){
        if (this.idLista != null) {
            return this.idLista            
        } else {
            return 'hola' 
        }
    }
    obtenerId(event){
        console.log(event);
    }

     //metodo para seleccionar vuelos
     @wire(obtenerVuelos, ({idPrecio: '$idLista'}))vuelos;
     columns = columns;
    



    //codigo para el row actions
    idVuelo;
    nombreVuelo;
    aeroPartida;
    aeroLlegada;
    fechaPartida;
    fechaLlegada;
    idReserva;

    createOpportunity(event){
        this.idReserva = event.detail;
        console.log(this.idReserva);
    }
    
    handleAction(event){        
        this.idVuelo = event.detail.row.idVuelo;
        console.log(this.idVuelo);
        this.nombreVuelo = event.detail.row.nombreVuelo; 
        console.log(this.nombreVuelo);
        this.aeroPartida = event.detail.row.aeroPartida; 
        console.log(this.aeroPartida);
        console.log(this.idReserva);
        console.log(this.idVuelo);
        console.log(this.idContacto);
        this.aeroLlegada = event.detail.row.aeroLlegada; 
        this.fechaPartida = event.detail.row.fechaPartida; 
        this.fechaLlegada = event.detail.row.fechaLlegada;
        crearTiquete({reserva: this.idReserva, vuelo: this.idVuelo, contacto: this.idContacto})
            .then((resultados) => {
                console.log('result-->'+resultados);
                this.seleccionarVueloModal = false;
                this.seleccionarPasajerosModal = true;
            }).catch((errores) => {
                console.log(errores);
                
            });
    }
    
    agregarPasajeros(event){
        buscarContacto({documento: this.doc, tipo: this.tipo})
        .then((result) => {
            this.error = undefined;
            this.contacto = result.contacto;
            console.log(this.contacto);
            this.reserva = result.oportunidad;
            if(this.contacto === undefined){
                this.crearCliente = true;
            } else{
                this.idContacto = this.contacto.Id;
            } 
        })
        .catch((error) => {
            this.error = error;
            this.contacto = undefined;
            this.reserva = undefined;
        })
        //
        crearTiquete({reserva: this.idReserva, vuelo: this.idVuelo, contacto: this.idContacto})
        .then((result) => {
            console.log(result);
        })
        .catch((error) => {
            console.log(error);
        })    
    }

    
}