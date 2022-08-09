import { LightningElement, wire } from 'lwc';
import obtenerVuelos from '@salesforce/apex/Reserva.obtenerVuelos';

const actions = [{
    label: 'Seleccionar', name: 'seleccionar',
},];

const columns = [
    { label: 'Vuelo', fieldName: 'Name' },
    { label: 'Aeropuerto de partida', fieldName: 'Aeropuerto_de_Partida__r', type: 'text' },
    { label: 'Aeropuerto de llegada', fieldName: 'Aeropuerto_de_Llegada__r', type: 'text' },
    { label: 'Fecha de partida', fieldName: 'Fecha_y_hora_de_partida__c', type: 'date' },
    { label: 'Fecha de llegada', fieldName: 'Fecha_y_hora_estimada_de_llegada__c', type: 'date' },    
       
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];

export default class SeleccionarVuelo extends LightningElement {
    @wire(obtenerVuelos)vuelos;
    
    columns = columns;
}