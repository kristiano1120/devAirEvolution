import { LightningElement } from 'lwc';

export default class Calculadora extends LightningElement {
    cadena = '';
    valor1 = '';
    valor2 = '';
    resultado = '';
    operacion = '';
    temp = '';

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

    clear(){
        this.cadena = '';
        this.valor1 = '';
        this.valor2 = '';
        this.temp = '';
        this.operacion = '';
        this.resultado = '';
    }

    operate(){
        switch(this.operacion){
            case 'sumar':
                this.valor2 = Number(this.temp);
                this.resultado = this.valor1 + this.valor2;
                break;
        }
    }
}