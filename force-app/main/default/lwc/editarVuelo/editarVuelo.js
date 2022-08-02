import { LightningElement, api, wire } from 'lwc';
import obtenerAxiliares from '@salesforce/apex/Tripulacion.obtenerAxiliares';
import saveAuxiliares from '@salesforce/apex/Tripulacion.saveAuxiliares';


export default class EditarVuelo extends LightningElement {
    // Flexipage provides recordId and objectApiName
    @api vueloId;
    //@api objectApiName;

    options = [];
    values = [];
    _selected = [];

    @wire (obtenerAxiliares, {idVuelo : '$vueloId'})
    Tripulantes({error, data}){
        if(data){
            this.options = data.map(key => ({value: key.value, label: key.label}));
            this.values = data.filter(element => element.selected == true).map(key => key.value);
        }else if(error){
            console.log('error--->'+JSON.stringify(error));
        }
    }

    handleChange(e) {
        this._selected = e.detail.value;
    }

    handleSuccess(event) {
        if (this._selected.length == 0) {
            this._selected = this.values;
        }
        saveAuxiliares({auxiliares: this._selected, idvuelo: this.vueloId})
        .then((result) => {
            console.log('succes');
            this.error = undefined;
        })
        .catch((error) => {
            this.error = error;
            console.log(error);
        });       
    }
}