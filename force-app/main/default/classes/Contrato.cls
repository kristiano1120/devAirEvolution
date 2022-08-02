public with sharing class Contrato {
    public static Contract definirDuracion(contract contrato) {
        Integer mes = contrato.startDate.month();
        if((contrato.startDate.month() == 1 && contrato.StartDate.day() < 15) || (contrato.startDate.month() == 12 && contrato.StartDate.day() > 20) ){
            throw new contratoException('La fecha de inicio no esta permitida');
        }

        if(mes < 4){
            contrato.ContractTerm = 6;
        }else if((mes > 3) && (mes<10)){
            contrato.ContractTerm = 3;
        }else {
            contrato.ContractTerm = 1;
            contrato.Valor_total__c = contrato.Valor_de_contrato__c * 0.85;
        }

        insert contrato;


        return contrato;
    }

    public class contratoException extends Exception {}

    /* public enum estado {ACTIVATED, DRAFT}
    public static respuestaContrato crearContrato(Contract contrato, estado estadoC, Decimal valor){
        respuestaContrato respueta = new respuestaContrato();
        Integer duracion;
        if (contrato.StartDate >= Date.newInstance(2022, 15, 01)) {
            duracion = 6;            
        } else if(contrato.StartDate >= Date.newInstance(2022, 04, 01)) {
            duracion = 3;
        }else if(contrato.StartDate >= Date.newInstance(2022, 10, 01)){
            duracion = 1;
            respueta.valorConDcto = valor*0.85;
        }else if(contrato.StartDate >= Date.newInstance(2022, 12, 20) && contrato.StartDate <= Date.newInstance(2023, 01, 15)){
        }

      
        return respueta;
        
    }

    public class respuestaContrato{
        public string mensaje;
        public decimal valorConDcto;
    } */

    
}