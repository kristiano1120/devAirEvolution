import { LightningElement, api } from 'lwc';

export default class NuevoContacto extends LightningElement {
    /* Creando una nueva variable llamada tipoId y asignándole el valor del @api doc. */
    @api tipoId;
    @api doc;

    /* El código anterior crea un nuevo registro de contacto y luego envía un evento para cerrar el
    modal y mostrar un mensaje. */
    contactId;
    handleSuccess(event) {
        this.contactId = event.detail.id;
        console.log(this.contactId);
    /* El código anterior utiliza el decorador @wire para llamar al adaptador de cable getRecord. Se
    llama al adaptador de cable con el recordId y los campos para recuperar. El recordId se pasa
    desde la plantilla HTML. A continuación, el registro se almacena en la propiedad de registro. */
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