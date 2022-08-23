import { LightningElement } from 'lwc';

export default class Calculadora extends LightningElement {
    /* Declarar las variables que se utilizarán en el código. */
    cadena = '';
    valor1 = '';
    valor2 = '';
    resultado = '';
    operacion = '';
    temp = '';

    /**
     * Agrega el número a la variable temporal.
     * @param event - El objeto de evento es un evento de JavaScript que se envía a un elemento cuando
     * ocurre un evento. Contiene información útil sobre el evento que sucedió.
     */
    numberClick(event){
        console.log('número-->'+event.target.dataset.id);
        switch(event.target.dataset.id){
            case '1':
                this.temp += '1';
                this.cadena += this.temp;
                break;
            case '2':
                this.temp += '2';
                break;
            case '3':
                this.temp += '3';
                break;
            case '4':
                this.temp += '4';
                break;
            case '5':
                this.temp += '5';
                break;
            case '6':
                this.temp += '6';
                break;
            case '7':
                this.temp += '7';
                break;
            case '8':
                this.temp += '8';
                break;
            case '9':
                this.temp += '9';
                break;
            case '0':
                this.temp += '0';
                break;
        }
    }

    /**
     * La función OperationClick() se llama cuando el usuario hace clic en uno de los botones de
     * operación. Luego, la función verifica el valor del botón en el que se hizo clic y realiza la
     * operación adecuada
     * @param event - El objeto de evento.
     */
    operationClick(event){
        switch(event.target.dataset.id){
            case '+':                
                this.valor1 = Number(this.temp);
                this.cadena += ' + ';    
                this.operacion = 'sumar';
                this.temp = '';
            break;
        }
    }

    /**
     * La función clear establece todas las variables en una cadena vacía
     */
    clear(){
        this.cadena = '';
        this.valor1 = '';
        this.valor2 = '';
        this.temp = '';
        this.operacion = '';
        this.resultado = '';
    }

    /**
     * La función operar() es una declaración de cambio que toma el valor de la variable operación y
     * realiza la operación que corresponde al valor de la variable operación
     */
    operate(){
        switch(this.operacion){
            case 'sumar':
                this.valor2 = Number(this.temp);
                this.resultado = this.valor1 + this.valor2;
                break;
        }
    }
}