trigger VueloTrigger on Product2 (before insert, before update, before delete, 
                                    after insert, after update, after delete, after undelete)  {
    
    TriggerHandler handler = new VueloTriggerHandler(trigger.isExecuting, trigger.size);

    switch on trigger.operationType {
        when  BEFORE_INSERT{
            System.debug('Antes de Insertar');
            handler.beforeInsert(trigger.new);
        }
        when  BEFORE_UPDATE{
            System.debug('Antes de Actualizar');
            handler.beforeUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);  
        }
        when  BEFORE_DELETE{
            System.debug('Antes de Eliminar');
            
        }
        when  AFTER_INSERT{
            System.debug('Antes de insertar');
            
        }
        when  AFTER_UPDATE{
            System.debug('Antes de Actualizar');
            
        }
        when  AFTER_DELETE{
            System.debug('Antes de Eliminar');
            
        }
        when  AFTER_UNDELETE{
            System.debug('Antes de Recuperar');
            
        }
        when else {
            System.debug('En este momento no pasa nada');
            
        }
    }
}