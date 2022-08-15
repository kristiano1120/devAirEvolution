public class MetodoFuture {
    
    @future
    public static void actualizarAcc(String accId){
            Blob b = Crypto.GenerateAESKey(128);
            String h = EncodingUtil.ConvertTohex(b);
            String guid = h.SubString(0,10);        //+ '-' + h.SubString(8,12) + '-' + h.SubString(12,16) + '-' + h.SubString(16,20) + '-' + h.substring(20);
            
            Account acct = new Account(id = accId,
                                        SLASerialNumber__c = guid);      
            Update acct;        
        }
    
}