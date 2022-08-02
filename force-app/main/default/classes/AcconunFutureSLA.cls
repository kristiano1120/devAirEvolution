public class AcconunFutureSLA {
    
    public static void crearCuenta(String name){
        Account acc = new Account(Name = name);
        insert acc;
        
        
        MetodoFuture.actualizarAcc(acc.id);
    }  
}