import { LightningElement, wire } from 'lwc';
import buscarContacto from '@salesforce/apex/Reserva.buscarContacto';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import obtenerVuelos from '@salesforce/apex/Reserva.obtenerVuelos';
import obtenerListaPrecios from '@salesforce/apex/Reserva.obtenerListaPrecios';

const actions = [{
    label: 'Seleccionar', name: 'seleccionar',
},];

const columns = [
    { label: 'Vuelo', fieldName: 'nombreVuelo' },
    { label: 'Aeropuerto de partida', fieldName: 'aeroPartida', type: 'text' },
    { label: 'Aeropuerto de llegada', fieldName: 'aeroLlegada', type: 'text' },
    { label: 'Fecha de partida', fieldName: 'fechaPartida', type: 'date' },
    { label: 'Fecha de llegada', fieldName: 'fechaLlegada', type: 'date' },    
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];

export default class NuevaReserva extends LightningElement {
    //metodo para seleccionar vuelos
    
    columns = columns;

   


    //Mostrar ocultar modal
    modalExisteOpen;
    modalNoExisteOpen;
    seleccionarVueloModal
    seleccionarLista;
    
    closeModalE(){
        this.modalExisteOpen = false;
    }
    closeModalESeleccionVuelo(){
        this.modalExisteOpen = false;
        this.seleccionarVueloModal = true;
        this.seleccionarLista = true;

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
    get id(){
        if (this.contacto != null) {
            return this.contacto.Id;            
        } else {
            return '' 
        }
    }
    //propiedad  id lista de precios 
    get idLista1(){
        if (this.idLista != null) {
            return this.idLista            
        } else {
            return 'hola' 
        }
    }
    



    //codigo para el row actions
    /* idVuelo;
    nombreVuelo;
    aeroPartida;
    aeroLlegada;
    fechaPartida;
    fechaLlegada;
    handleAction(event){        
        this.idVuelo = event.detail.row.idVuelo;
        this.nombreVuelo = event.detail.row.Name; 
        this.aeroPartida = event.detail.row.aeroPartida; 
        this.aeroLlegada = event.detail.row.aeroLlegada; 
        this.fechaPartida = event.detail.row.fechaPartida; 
        this.fechaLlegada = event.detail.row.fechaLlegada;
    } */
    
}