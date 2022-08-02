@isTest
public with sharing class ContratoTest {    

    @isTest
    static void mostrarException() {
        try {
            Contract nuevoCto = new Contract(StartDate = Date.newInstance(2022, 1, 10),
                                            AccountId = '0018a00001qICDcAAO');
            Contract cto = Contrato.definirDuracion(nuevoCto);
        } catch (Exception e) {
            System.assert(e.getMessage().contains('La fecha de inicio no esta permitida'));
        }
    }

    @isTest
    static void mostrarSeisMeses() {
        Contract nuevoCto =new Contract(StartDate = Date.newInstance(2022, 3, 10),
                                        AccountId = '0018a00001qICDcAAO');
        
        Contract cto = Contrato.definirDuracion(nuevoCto);
                  
        System.assertEquals(6, cto.ContractTerm);
    }

    @isTest
    static void mostrarTresMeses() {
        Contract nuevoCto =new Contract(StartDate = Date.newInstance(2022, 6, 10),
                                        AccountId = '0018a00001qICDcAAO');
        
        Contract cto = Contrato.definirDuracion(nuevoCto);
                  
        System.assertEquals(3, cto.ContractTerm);
    }

    @isTest
    static void mostrarUnMesyDescuento() {
        Contract nuevoCto =new Contract(StartDate = Date.newInstance(2022, 11, 10),
                                        AccountId = '0018a00001qICDcAAO',
                                        Valor_de_contrato__c = 100000);
        
        Contract cto = Contrato.definirDuracion(nuevoCto);
                  
        System.assertEquals(1, cto.ContractTerm);
        System.assertEquals(85000, cto.Valor_total__c);
    }
}