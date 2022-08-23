import { LightningElement, wire } from 'lwc';
import obtenerVuelos from '@salesforce/apex/Reserva.obtenerVuelos';

/* Creando un botón que se mostrará en la tabla. */
const actions = [{
    label: 'Seleccionar', name: 'seleccionar',
},];

/* Definición de las columnas que se mostrarán en la tabla. */
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
   /* Un decorador que se utiliza para conectar el componente a un método de Apex. */
    @wire(obtenerVuelos)vuelos;
    
   /* Asignando la variable de columnas a la propiedad de columnas. */
    columns = columns;
}