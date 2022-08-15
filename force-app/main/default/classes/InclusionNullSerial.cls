public class InclusionNullSerial implements Queueable {
    public void execute(QueueableContext context){
        List<Account> cuentas = [SELECT ID FROM Account WHERE SLASerialNumber__c  = null];
        for(Account a : Cuentas){
            a.SLASerialNumber__c = EncodingUtil.ConvertTohex(Crypto.GenerateAESKey(128)).SubString(0, 10);
        }
        update cuentas;
        
    }
}