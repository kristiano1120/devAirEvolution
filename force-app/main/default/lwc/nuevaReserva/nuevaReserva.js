import { LightningElement, wire } from 'lwc';
import buscarContacto from '@salesforce/apex/Reserva.buscarContacto';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import obtenerVuelos from '@salesforce/apex/Reserva.obtenerVuelos';

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
    @wire(obtenerVuelos)vuelos;    
    columns = columns;

    //Mostrar ocultar modal
    modalExisteOpen;
    modalNoExisteOpen;
    seleccionarVuelo;
    closeModalE(){
        this.modalExisteOpen = false;
    }
    closeModalNe(){
        this.modalNoExisteOpen = false;
    }
    closeModalSeleccionar(){
        this.seleccionarVuelo = false;
    } 
     //propiedades
    tablaContact;
    tablaReserva;
    reservaComponent;
    doc;    
    tipo;   
    contacto;
    reserva;
    mensaje;
    error;      
    
    get options() {
        return [
            { label: 'Cedula de Ciudadanía', value: 'Cedula de Ciudadanía' },
            { label: 'Cedula de Extranjería', value: 'Cedula de Extranjería' },
            { label: 'Tarjeta de Identidad', value: 'Tarjeta de Identidad' },
        ];
    }

    eventChange(event){
        this.doc = event.target.value; 
            console.log(this.doc);
        }
    handleChange(event){
        this.tipo = event.detail.value;
        console.log(this.tipo);
    }  
    
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
                    this.reservaComponent = true;
                } else {
                    this.seleccionarVuelo = true;
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
    
    //propiedades tabla
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
    
}