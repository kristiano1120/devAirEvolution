import { api, LightningElement, wire } from 'lwc';
import obternerVuelos from '@salesforce/apex/Tripulacion.obternerVuelos';

const actions = [{
    label: 'Asignar', name: 'asignar'
},];

const columns = [
    { label: 'Código', fieldName: 'codVuelo' },
    { label: 'Auxiliares Requeridos', fieldName: 'numAuxiliares', type: 'number' },
    { label: 'Auxiliares Faltantes', fieldName: 'numAuxiliaresFaltantes', type: 'number' },
    { label: 'Tiene Piloto', fieldName: 'piloto', type: 'boolean' },
    { label: 'Tiene Copiloto', fieldName: 'copiloto', type: 'boolean' },    
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];

export default class AsignarTripulacion extends LightningElement {
    //llamar al metodo desde la clase apex
    @wire(obternerVuelos)
    vuelos;

    
    //variable para las columnas del datatable
    columns = columns;

    //variables para los datos mostrados en el modal
    isModalOpen;
    idVuelo;
    codigoV;
    requeridos;
    faltantes;
    piloto;
    copiloto;

    //metodo que abre el modal y variables para el row actions
    handleAction(event){
        this.isModalOpen = true;
        this.idVuelo = event.detail.row.idVuelo;
        this.codigoV = event.detail.row.codVuelo; 
        this.requeridos = event.detail.row.numAuxiliares; 
        this.faltantes = event.detail.row.numAuxiliaresFaltantes; 
        this.piloto = event.detail.row.piloto; 
        this.copiloto = event.detail.row.copiloto;
    }

    get vueloId(){
        console.log(this.idVuelo);
        return this.idVuelo;
    }

    closeModal(){
        this.isModalOpen = false;
    }
}