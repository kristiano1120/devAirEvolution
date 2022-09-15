import { LightningElement, wire, api } from 'lwc';
import {createRecord,  getRecord, getFieldValue} from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import TITULARDERESERVA_FIELD from '@salesforce/schema/Opportunity.Titular_de_la_reserva__c';
import ESTADO_FIELD from '@salesforce/schema/Opportunity.StageName';
import NOMBREDERESERVA_FIELD from '@salesforce/schema/Opportunity.Name';
import FECHADECIERRE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import LISTAPRECIOS_FIELD from '@salesforce/schema/Opportunity.Pricebook2Id';
import obtenerListaPrecios from '@salesforce/apex/Reserva.obtenerListaPrecios';

export default class ReservaCreator extends LightningElement {
    /* Obtener el recordId y la listaPrecios del componente padre. */
    @api recordId;
    @api listaPrecios;
    @wire(getRecord, {recordId: '$recordId', fields: [NAME_FIELD]}) record;


    /* Creando una variable llamada objectApiName y asignándole el valor del objeto Oportunidad. */
    objectApiName = OPPORTUNITY_OBJECT;
    opportunityId;
    estado = 'Pre-venta';
    fecha = new Date().toISOString().slice(0, 10);    

    /**
     * La función devuelve el valor del campo denominado "Nombre" en el registro actual
     * @returns El valor del campo NAME_FIELD en el objeto record.data.
     */
    get contactName(){
        return this.record.data ? getFieldValue(this.record.data, NAME_FIELD) : '';
    }
    

    /**
     * La función crea un nuevo registro de oportunidad con los campos que el usuario ha llenado en el
     * formulario
     */
    createOpportunity(){
        
        const fields = {}
        fields[TITULARDERESERVA_FIELD.fieldApiName] = this.recordId;
        fields[NOMBREDERESERVA_FIELD.fieldApiName] = this.contactName;
        fields[ESTADO_FIELD.fieldApiName] = this.estado;
        fields[FECHADECIERRE_FIELD.fieldApiName] = this.fecha;    
        fields[LISTAPRECIOS_FIELD.fieldApiName] = this.listaPrecios;    
        
        const recordInput ={apiName: OPPORTUNITY_OBJECT.objectApiName, fields };
        console.log(recordInput);
        createRecord(recordInput)
        
        
        .then(opportunity => {
            
            this.opportunityId = opportunity.id;
            console.log(fields);
            console.log('Reserva creada con éxito');
            this.dispatchEvent(new CustomEvent('mensaje'));
            this.dispatchEvent(new CustomEvent('cerrarpanel'));

            const idreserva = this.opportunityId;
            this.dispatchEvent(new CustomEvent('idreserva', {detail: idreserva}));
            
        })
        .catch(error => {
            console.error(error);
        })
        
    }
}