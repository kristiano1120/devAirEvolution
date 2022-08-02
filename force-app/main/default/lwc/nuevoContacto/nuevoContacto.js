import { LightningElement, api } from 'lwc';

export default class NuevoContacto extends LightningElement {
    @api tipoId;
    @api doc;
    contactId;
    
    
    handleSuccess(event) {
        this.contactId = event.detail.id;
    }
}