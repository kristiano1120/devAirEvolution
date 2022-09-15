@restResource(urlMapping = '/Cualquiera')
global class ClaseCualquiera {
    
    @HttpPost
    global static Account updateAct(String id, String nombre ){
        Account cta = new Account(Id = id,
                                 Name = nombre);
        Update cta;
        
        return cta;
    }
}