import { LightningElement, api, wire } from 'lwc';
import obtenerAxiliares from '@salesforce/apex/Tripulacion.obtenerAxiliares';
import saveAuxiliares from '@salesforce/apex/Tripulacion.saveAuxiliares';


export default class EditarVuelo extends LightningElement {
    /* Una propiedad pública que se pasa desde el componente principal. */
    @api vueloId;

    options = [];
    values = [];
    /* Una variable privada que se utiliza para almacenar los valores seleccionados. */
    _selected = [];

    /**
     * La función se llama cuando se carga el componente y llama al método de Apex obtenerAxiliares,
     * que devuelve una lista de objetos con las propiedades valor y etiqueta. Luego, la función asigna
     * la lista de objetos a una lista de objetos con el valor y la etiqueta de propiedades, que se
     * asigna a la propiedad de opciones. Luego, la función filtra la lista de objetos a una lista de
     * objetos con la propiedad seleccionada establecida en verdadero, y luego asigna la lista de
     * objetos a una lista de objetos con el valor de propiedad, que se asigna a la propiedad de
     * valores
     */
    @wire (obtenerAxiliares, {idVuelo : '$vueloId'})
    Tripulantes({error, data}){
        if(data){
            this.options = data.map(key => ({value: key.value, label: key.label}));
            this.values = data.filter(element => element.selected == true).map(key => key.value);
        }else if(error){
            console.log('error--->'+JSON.stringify(error));
        }
    }

    /* Guardar los auxiliares seleccionados en la base de datos. */
    handleChange(e) {
        this._selected = e.detail.value;
    }

    /**
     * Guarda los auxiliares seleccionados en la base de datos.
     */
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