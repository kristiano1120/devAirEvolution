public with sharing class ClimaSchedulable implements Schedulable{
    public void execute(SchedulableContext context){
        ClimaRest.getClimas();
    }
}
