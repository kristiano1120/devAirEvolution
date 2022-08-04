import { LightningElement, api } from 'lwc';

export default class NuevoContacto extends LightningElement {
    @api tipoId;
    @api doc;

    contactId;
    handleSuccess(event) {
        this.contactId = event.detail.id;
        console.log(this.contactId);
        this.dispatchEvent(new CustomEvent('cerrarc'));
        this.dispatchEvent(new CustomEvent('mensajec')); 
    }
    
    
   /*  handleSuccess(event) {
        this.dispatchEvent(new CustomEvent('cerrarc'));
        this.dispatchEvent(new CustomEvent('mensajec'));        
        console.log('hola mundo');
    } */

    /* creado(event){
        this.dispatchEvent(new CustomEvent('cerrarc'));
        this.dispatchEvent(new CustomEvent('mensajec'));
        console.log('event');
    } */
}