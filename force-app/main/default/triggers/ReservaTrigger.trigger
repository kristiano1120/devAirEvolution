trigger ReservaTrigger on Opportunity (before insert, before update, before delete, 
                                    after insert, after update, after delete, after undelete) {

    TriggerHandler handler = new ReservaTriggerHandler(trigger.isExecuting, trigger.size);
    
    switch on trigger.operationType {
        when  BEFORE_INSERT{            
            System.debug('En este momento Estamos antes de insertar');
            handler.beforeInsert(trigger.new);
        }
        when  BEFORE_UPDATE{
            System.debug('En este momento Estamos antes de insertar');  
            handler.beforeUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);      
        }
        when  BEFORE_DELETE{
            System.debug('En este momento Estamos antes de insertar');
            
        }
        when  AFTER_INSERT{
            System.debug('En este momento Estamos antes de insertar');
            
        }
        when  AFTER_UPDATE{
            System.debug('En este momento Estamos antes de insertar');
            
        }
        when  AFTER_DELETE{
            System.debug('En este momento Estamos antes de insertar');
            
        }
        when  AFTER_UNDELETE{
            System.debug('En este momento Estamos antes de insertar');
            
        }
        when else {
            System.debug('En este momento no pasa nada');
            
        }
    }    
}