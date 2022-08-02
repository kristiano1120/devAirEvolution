import { LightningElement, wire } from 'lwc';
import buscarContacto from '@salesforce/apex/Reserva.buscarContacto';

export default class NuevaReserva extends LightningElement {
    //Mostrar ocultar modal
    modalExisteOpen;
    modalNoExisteOpen;

    closeModalE(){
        this.modalExisteOpen = false;
    }
    closeModalNe(){
        this.modalNoExisteOpen = false;
    }

    doc;    
    tipo;   
    contacto;
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

    handleBuscar(event){
        buscarContacto({documento: this.doc, tipo: this.tipo})
        .then((result) => {
            this.contacto = result;                
            this.error = undefined;
            this.modalExisteOpen = true;            
            console.log(this.contacto);
        }).catch((err) => {
            this.error = err;
            this.contacto = undefined;
            this.modalNoExisteOpen = true;            
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
}