export default [
    {
        "title": "Home",
        "fileName": "index.html",
        "text": "Home Project Home Use the apexdox.homePagePath  setting to point to an HTML file that contains details about your project. The body of the HTML will show up here instead of this default!"
    },
    {
        "title": "AcconunFutureSLA",
        "fileName": "AcconunFutureSLA.html",
        "text": "AcconunFutureSLA Signature public class AcconunFutureSLA AcconunFutureSLA Methods crearCuenta(name) crearCuenta(name) Signature public static void crearCuenta(String name)"
    },
    {
        "title": "AccountFutureTest",
        "fileName": "AccountFutureTest.html",
        "text": "AccountFutureTest Signature @isTest public class AccountFutureTest AccountFutureTest Methods actualizarAcc() actualizarAcc() Signature @isTest static void actualizarAcc()"
    },
    {
        "title": "Contrato",
        "fileName": "Contrato.html",
        "text": "Contrato Signature public with sharing class Contrato Contrato Methods definirDuracion(contrato) definirDuracion(contrato) Signature public static Contract definirDuracion(contract contrato) Contrato.contratoException Signature public class contratoException extends Exception"
    },
    {
        "title": "ContratoTest",
        "fileName": "ContratoTest.html",
        "text": "ContratoTest Signature @isTest public with sharing class ContratoTest ContratoTest Methods mostrarException() mostrarSeisMeses() mostrarTresMeses() mostrarUnMesyDescuento() mostrarException() Signature @isTest static void mostrarException() mostrarSeisMeses() Signature @isTest static void mostrarSeisMeses() mostrarTresMeses() Signature @isTest static void mostrarTresMeses() mostrarUnMesyDescuento() Signature @isTest static void mostrarUnMesyDescuento()"
    },
    {
        "title": "Descuento",
        "fileName": "Descuento.html",
        "text": "Descuento Signature public with sharing class Descuento Enums Name Signature Values metodo public enum metodo TC, EFECTIVO Descuento Methods aplicarDescuento(cliente, metodoPago, valor) aplicarDescuento(cliente, metodoPago, valor) Signature public static respuestaDcto aplicarDescuento(contact cliente, metodo metodoPago, decimal valor) Descuento.descuentoException Signature public class descuentoException extends Exception Descuento.respuestaDcto Signature public class respuestaDcto Descuento.respuestaDcto Properties Name Signature mensaje public string mensaje resultado public boolean resultado valorConDcto public decimal valorConDcto"
    },
    {
        "title": "DescuentoMartes",
        "fileName": "DescuentoMartes.html",
        "text": "DescuentoMartes Signature public with sharing class DescuentoMartes implements Schedulable DescuentoMartes Methods execute(ctx) execute(ctx) Signature public void execute(SchedulableContext ctx)"
    },
    {
        "title": "DescuentoMartesBatch",
        "fileName": "DescuentoMartesBatch.html",
        "text": "DescuentoMartesBatch Signature public with sharing class DescuentoMartesBatch implements Database.Batchable<sObject> DescuentoMartesBatch Methods execute(BC, prices) finish(BC) start(BC) execute(BC, prices) Signature public void execute(Database.BatchableContext BC, List<PricebookEntry> prices) finish(BC) Signature public void finish(Database.BatchableContext BC) start(BC) Signature public Database.QueryLocator start(Database.BatchableContext BC)"
    },
    {
        "title": "DescuentoMartesTest",
        "fileName": "DescuentoMartesTest.html",
        "text": "DescuentoMartesTest Signature @isTest public with sharing class DescuentoMartesTest DescuentoMartesTest Methods makeData() pruebaDescuentoMartes() makeData() Signature @TestSetup static void makeData() pruebaDescuentoMartes() Signature @isTest static void pruebaDescuentoMartes()"
    },
    {
        "title": "DescuentoTest",
        "fileName": "DescuentoTest.html",
        "text": "DescuentoTest Signature @isTest public with sharing class DescuentoTest DescuentoTest Methods clienteNuevoEectivo() clienteNuevoTC() clienteRecurrenteEectivo() clienteRecurrenteTC() makeData() clienteNuevoEectivo() Signature @isTest static void clienteNuevoEectivo() clienteNuevoTC() Signature @isTest static void clienteNuevoTC() clienteRecurrenteEectivo() Signature @isTest static void clienteRecurrenteEectivo() clienteRecurrenteTC() Signature @isTest static void clienteRecurrenteTC() makeData() Signature @TestSetup static void makeData()"
    },
    {
        "title": "DescuentoVeinticuatroBatch",
        "fileName": "DescuentoVeinticuatroBatch.html",
        "text": "DescuentoVeinticuatroBatch Signature public with sharing class DescuentoVeinticuatroBatch implements Database.Batchable<sObject> DescuentoVeinticuatroBatch Methods execute(BC, vuelos) finish(BC) start(context) execute(BC, vuelos) Signature public void execute(Database.BatchableContext BC, List<Product2> vuelos) finish(BC) Signature public void finish(Database.BatchableContext BC) start(context) Signature public Database.QueryLocator start(Database.BatchableContext context)"
    },
    {
        "title": "DescuentoVeinticuatroSchedulable",
        "fileName": "DescuentoVeinticuatroSchedulable.html",
        "text": "DescuentoVeinticuatroSchedulable Signature public with sharing class DescuentoVeinticuatroSchedulable implements Schedulable DescuentoVeinticuatroSchedulable Methods execute(context) execute(context) Signature public void execute(SchedulableContext context)"
    },
    {
        "title": "DescuentoVeinticuatroTest",
        "fileName": "DescuentoVeinticuatroTest.html",
        "text": "DescuentoVeinticuatroTest Signature @isTest public with sharing class DescuentoVeinticuatroTest DescuentoVeinticuatroTest Methods makeData() prueba() makeData() Signature @TestSetup static void makeData() prueba() Signature @isTest static void prueba()"
    },
    {
        "title": "InactiveAccounts",
        "fileName": "InactiveAccounts.html",
        "text": "InactiveAccounts Signature public with sharing class InactiveAccounts implements Database.Batchable<sObject> InactiveAccounts Methods execute(BC, accts) finish(BC) start(BC) execute(BC, accts) Signature public void execute(Database.BatchableContext BC, List<Account> accts) finish(BC) Signature public void finish(Database.BatchableContext BC) start(BC) Signature public Database.QueryLocator start(Database.BatchableContext BC)"
    },
    {
        "title": "InactiveAccountsTest",
        "fileName": "InactiveAccountsTest.html",
        "text": "InactiveAccountsTest Signature @istest public class InactiveAccountsTest InactiveAccountsTest Methods makeData() methodName() makeData() Signature @TestSetup static void makeData() methodName() Signature @IsTest static void methodName()"
    },
    {
        "title": "InactiveFuture",
        "fileName": "InactiveFuture.html",
        "text": "InactiveFuture Signature public class InactiveFuture implements Database.Batchable<sObject> InactiveFuture Methods execute(BC, accts) finish(BC) start(BC) execute(BC, accts) Signature public void execute(Database.BatchableContext BC, List<Account> accts) finish(BC) Signature public void finish(Database.BatchableContext BC) start(BC) Signature public Database.QueryLocator start(Database.BatchableContext BC)"
    },
    {
        "title": "InactiveFutureTest",
        "fileName": "InactiveFutureTest.html",
        "text": "InactiveFutureTest Signature @isTest public class InactiveFutureTest InactiveFutureTest Methods makeData() methodName() makeData() Signature @TestSetup static void makeData() methodName() Signature @IsTest static void methodName()"
    },
    {
        "title": "MetodoFuture",
        "fileName": "MetodoFuture.html",
        "text": "MetodoFuture Signature public class MetodoFuture MetodoFuture Methods actualizarAcc(accId) actualizarAcc(accId) Signature @future public static void actualizarAcc(String accId)"
    },
    {
        "title": "NullSerialSLA",
        "fileName": "NullSerialSLA.html",
        "text": "NullSerialSLA Signature public class NullSerialSLA implements Database.Batchable<sObject> NullSerialSLA Methods execute(BC, accts) finish(BC) start(BC) execute(BC, accts) Signature public void execute(Database.BatchableContext BC, List<Account> accts) finish(BC) Signature public void finish(Database.BatchableContext BC) start(BC) Signature public Database.QueryLocator start(Database.BatchableContext BC)"
    },
    {
        "title": "NullSerialSLATest",
        "fileName": "NullSerialSLATest.html",
        "text": "NullSerialSLATest Signature @isTest public class NullSerialSLATest NullSerialSLATest Methods makeData() methodName() makeData() Signature @TestSetup static void makeData() methodName() Signature @IsTest static void methodName()"
    },
    {
        "title": "NullSerialSchedulable",
        "fileName": "NullSerialSchedulable.html",
        "text": "NullSerialSchedulable Signature public class NullSerialSchedulable implements Schedulable NullSerialSchedulable Methods execute(ctx) execute(ctx) Signature public void execute(SchedulableContext ctx)"
    },
    {
        "title": "NullSerialSchedulableTest",
        "fileName": "NullSerialSchedulableTest.html",
        "text": "NullSerialSchedulableTest Signature @isTest public class NullSerialSchedulableTest NullSerialSchedulableTest Methods makeData() prueba() makeData() Signature @TestSetup static void makeData() prueba() Signature @isTest static void prueba()"
    },
    {
        "title": "PiedraPapelTijera",
        "fileName": "PiedraPapelTijera.html",
        "text": "PiedraPapelTijera Signature public with sharing class PiedraPapelTijera Enums Name Signature Values jugada public enum jugada PIEDRA, PAPEL, TIJERA PiedraPapelTijera Methods jugada(jugador1, jugadaDe1, jugador2, jugadaDe2) jugada(jugador1, jugadaDe1, jugador2, jugadaDe2) Signature public static resultado jugada(String jugador1, jugada jugadaDe1, String jugador2, jugada jugadaDe2) PiedraPapelTijera.juegoException Signature public class juegoException extends Exception PiedraPapelTijera.jugadaException Signature public class jugadaException extends Exception PiedraPapelTijera.resultado Signature public class resultado PiedraPapelTijera.resultado Properties Name Signature jugada public PiedraPapelTijera.jugada jugada jugador public String jugador"
    },
    {
        "title": "PiedraPapelTijeraTest",
        "fileName": "PiedraPapelTijeraTest.html",
        "text": "PiedraPapelTijeraTest Signature @isTest public with sharing class PiedraPapelTijeraTest PiedraPapelTijeraTest Methods dosGanaPAPEL() dosGanaPiedra() dosGanaTijera() empatePapel() empatePiedra() empateTijera() jugadaVacia() nombreVacio() unoGanaPAPEL() unoGanaPiedra() unoGanaTijera() dosGanaPAPEL() Signature @isTest static void dosGanaPAPEL() dosGanaPiedra() Signature @isTest static void dosGanaPiedra() dosGanaTijera() Signature @isTest static void dosGanaTijera() empatePapel() Signature @isTest static void empatePapel() empatePiedra() Signature @isTest static void empatePiedra() empateTijera() Signature @isTest static void empateTijera() jugadaVacia() Signature @isTest static void jugadaVacia() nombreVacio() Signature @isTest static void nombreVacio() unoGanaPAPEL() Signature @isTest static void unoGanaPAPEL() unoGanaPiedra() Signature @isTest static void unoGanaPiedra() unoGanaTijera() Signature @isTest static void unoGanaTijera()"
    },
    {
        "title": "Reserva",
        "fileName": "Reserva.html",
        "text": "Reserva Signature public with sharing class Reserva Reserva Methods buscarContacto(documento, tipo) crearTiquete(reserva, vuelo, contacto) obtenerListaPrecios(nombre) obtenerVuelos(idPrecio) buscarContacto(documento, tipo) Signature public static creaReserva buscarContacto(String documento, string tipo) crearTiquete(reserva, vuelo, contacto) Signature @AuraEnabled public static OpportunityLineItem crearTiquete(String reserva, String vuelo, String contacto) obtenerListaPrecios(nombre) Signature @AuraEnabled(cacheable = true) public static String obtenerListaPrecios(String nombre) obtenerVuelos(idPrecio) Signature @AuraEnabled(cacheable = true) public static List<vueloWrapper> obtenerVuelos(String idPrecio) Reserva.creaReserva Signature public class creaReserva Reserva.creaReserva Properties Name Signature Annotations contacto public Contact contacto @AuraEnabled reserva public Opportunity reserva @AuraEnabled Reserva.creaReserva Constructors creaReserva(pasajero, oportunidad) creaReserva(pasajero, oportunidad) Signature public creaReserva(Contact pasajero, Opportunity oportunidad) Reserva.vueloWrapper Signature public class vueloWrapper Reserva.vueloWrapper Properties Name Signature Annotations aeroLlegada public String aeroLlegada @AuraEnabled aeroPartida public String aeroPartida @AuraEnabled fechaLlegada public Datetime fechaLlegada @AuraEnabled fechaPartida public Datetime fechaPartida @AuraEnabled idVuelo public String idVuelo @AuraEnabled nombreVuelo public String nombreVuelo @AuraEnabled valor public Decimal valor @AuraEnabled Reserva.vueloWrapper Constructors vueloWrapper(id, nombre, apartida, allegada, fPartida, fllegada, precio) vueloWrapper(id, nombre, apartida, allegada, fPartida, fllegada, precio) Signature public vueloWrapper(String id, String nombre, String apartida, String allegada, Datetime fPartida, Datetime fllegada, Decimal precio)"
    },
    {
        "title": "ReservaNoPagadaBatch",
        "fileName": "ReservaNoPagadaBatch.html",
        "text": "ReservaNoPagadaBatch Signature public with sharing class ReservaNoPagadaBatch implements Database.Batchable<sObject> ReservaNoPagadaBatch Methods execute(BC, reservas) finish(BC) start(context) execute(BC, reservas) Signature public void execute(Database.BatchableContext BC, List<Opportunity> reservas) finish(BC) Signature public void finish(Database.BatchableContext BC) start(context) Signature public Database.QueryLocator start(Database.BatchableContext context)"
    },
    {
        "title": "ReservaNoPagadaBatchTest",
        "fileName": "ReservaNoPagadaBatchTest.html",
        "text": "ReservaNoPagadaBatchTest Signature @isTest public with sharing class ReservaNoPagadaBatchTest ReservaNoPagadaBatchTest Methods batch() makeData() batch() Signature @isTest Static void batch() makeData() Signature @TestSetup static void makeData()"
    },
    {
        "title": "ReservaNoPagadaSchedulable",
        "fileName": "ReservaNoPagadaSchedulable.html",
        "text": "ReservaNoPagadaSchedulable Signature public with sharing class ReservaNoPagadaSchedulable implements Schedulable ReservaNoPagadaSchedulable Methods execute(ctx) execute(ctx) Signature public void execute(SchedulableContext ctx)"
    },
    {
        "title": "ReservaTest",
        "fileName": "ReservaTest.html",
        "text": "ReservaTest Signature @IsTest public class ReservaTest ReservaTest Methods buscarContactoNoReserva() buscarContactoSiReserva() busquedaFallida() crearTiquete() crearTiqueteExc() makeData() obtenerListaPrecios() obtenerVuelos() buscarContactoNoReserva() Signature @isTest static void buscarContactoNoReserva() buscarContactoSiReserva() Signature @isTest static void buscarContactoSiReserva() busquedaFallida() Signature @isTest static void busquedaFallida() crearTiquete() Signature @isTest static void crearTiquete() crearTiqueteExc() Signature @isTest static void crearTiqueteExc() makeData() Signature @testSetup static void makeData() obtenerListaPrecios() Signature @isTest static void obtenerListaPrecios() obtenerVuelos() Signature @isTest static void obtenerVuelos()"
    },
    {
        "title": "ReservaTriggerHandler",
        "fileName": "ReservaTriggerHandler.html",
        "text": "ReservaTriggerHandler Signature public with sharing class ReservaTriggerHandler implements TriggerHandler ReservaTriggerHandler Properties Name Signature triggerIsExecuting private boolean triggerIsExecuting triggerSize private integer triggerSize ReservaTriggerHandler Constructors ReservaTriggerHandler(triggerIsExecuting, triggerSize) ReservaTriggerHandler(triggerIsExecuting, triggerSize) Signature public ReservaTriggerHandler(boolean triggerIsExecuting, integer triggerSize) ReservaTriggerHandler Methods actualizarFechaSiPagado(reserva) afterDelete(oldRecords, oldOpportunityMap) afterInsert(newRecords, newOpportunityMap) afterUndelete(newRecords, newOpportunityMap) afterUpdate(oldRecords, newRecords, oldOpportunityMap, newOpportunityMap) beforeDelete(oldRecords, oldOpportunityMap) beforeInsert(newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) inspectResults(results) NombreDeReserva(reservas) actualizarFechaSiPagado(reserva) Signature public static void actualizarFechaSiPagado(List<Opportunity> reserva) afterDelete(oldRecords, oldOpportunityMap) Signature public void afterDelete(List<Opportunity> oldRecords, Map<ID, sObject> oldOpportunityMap) afterInsert(newRecords, newOpportunityMap) Signature public void afterInsert(List<Opportunity> newRecords, Map<ID, sObject> newOpportunityMap) afterUndelete(newRecords, newOpportunityMap) Signature public void afterUndelete(List<Opportunity> newRecords, Map<ID, sObject> newOpportunityMap) afterUpdate(oldRecords, newRecords, oldOpportunityMap, newOpportunityMap) Signature public void afterUpdate(List<Opportunity> oldRecords, List<Opportunity> newRecords, Map<ID, sObject> oldOpportunityMap, Map<ID, sObject> newOpportunityMap) beforeDelete(oldRecords, oldOpportunityMap) Signature public void beforeDelete(List<Opportunity> oldRecords, Map<ID, sObject> oldOpportunityMap) beforeInsert(newRecords) Signature public void beforeInsert(List<Opportunity> newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) Signature public void beforeUpdate(List<Opportunity> oldRecords, List<Opportunity> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap) inspectResults(results) Signature private static Boolean inspectResults(Messaging.SendEmailResult[] results) NombreDeReserva(reservas) Signature public static void NombreDeReserva(List<Opportunity> reservas)"
    },
    {
        "title": "ReservaTriggerHandlerTest",
        "fileName": "ReservaTriggerHandlerTest.html",
        "text": "ReservaTriggerHandlerTest Signature @isTest public with sharing class ReservaTriggerHandlerTest ReservaTriggerHandlerTest Methods actualizaEstadoFallido() creaNombreReserva() creaReservaCompletada() creaReservapagada() makeData() actualizaEstadoFallido() Signature @isTest private static void actualizaEstadoFallido() creaNombreReserva() Signature @isTest private static void creaNombreReserva() creaReservaCompletada() Signature @isTest private static void creaReservaCompletada() creaReservapagada() Signature @isTest private static void creaReservapagada() makeData() Signature @TestSetup static void makeData()"
    },
    {
        "title": "ReversaDescuentoMartes",
        "fileName": "ReversaDescuentoMartes.html",
        "text": "ReversaDescuentoMartes Signature public with sharing class ReversaDescuentoMartes implements Schedulable ReversaDescuentoMartes Methods execute(ctx) execute(ctx) Signature public void execute(SchedulableContext ctx)"
    },
    {
        "title": "ReversaDescuentoMartesBatch",
        "fileName": "ReversaDescuentoMartesBatch.html",
        "text": "ReversaDescuentoMartesBatch Signature public with sharing class ReversaDescuentoMartesBatch implements Database.Batchable<sObject> ReversaDescuentoMartesBatch Methods execute(BC, prices) finish(BC) start(BC) execute(BC, prices) Signature public void execute(Database.BatchableContext BC, List<PricebookEntry> prices) finish(BC) Signature public void finish(Database.BatchableContext BC) start(BC) Signature public Database.QueryLocator start(Database.BatchableContext BC)"
    },
    {
        "title": "ReversaDescuentoMartesTest",
        "fileName": "ReversaDescuentoMartesTest.html",
        "text": "ReversaDescuentoMartesTest Signature @isTest public with sharing class ReversaDescuentoMartesTest ReversaDescuentoMartesTest Methods makeData() pruebaReversaDescuento() makeData() Signature @TestSetup static void makeData() pruebaReversaDescuento() Signature @isTest static void pruebaReversaDescuento()"
    },
    {
        "title": "TiqueteTriggerHandler",
        "fileName": "TiqueteTriggerHandler.html",
        "text": "TiqueteTriggerHandler Signature public with sharing class TiqueteTriggerHandler implements TriggerHandler TiqueteTriggerHandler Properties Name Signature triggerIsExecuting private boolean triggerIsExecuting triggerSize private integer triggerSize TiqueteTriggerHandler Constructors TiqueteTriggerHandler(triggerIsExecuting, triggerSize) TiqueteTriggerHandler(triggerIsExecuting, triggerSize) Signature public TiqueteTriggerHandler(boolean triggerIsExecuting, integer triggerSize) TiqueteTriggerHandler Methods actualizarNombrePasajero(opportunityLineItemNeW) afterDelete(oldRecords, oldOpportunityLineItemMap) afterInsert(newRecords, newOpportunityLineItemMap) afterUndelete(newRecords, newOpportunityLineItemMap) afterUpdate(oldRecords, newRecords, oldOpportunityLineItemMap, newOpportunityLineItemMap) asignarEquipajeNegocios(tiquetes) beforeDelete(oldRecords, oldOpportunityLineItemMap) beforeInsert(newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) evitarSobreventa() actualizarNombrePasajero(opportunityLineItemNeW) Signature public static void actualizarNombrePasajero(List<OpportunityLineItem> opportunityLineItemNeW) afterDelete(oldRecords, oldOpportunityLineItemMap) Signature public void afterDelete(List<OpportunityLineItem> oldRecords, Map<ID, sObject> oldOpportunityLineItemMap) afterInsert(newRecords, newOpportunityLineItemMap) Signature public void afterInsert(List<OpportunityLineItem> newRecords, Map<ID, sObject> newOpportunityLineItemMap) afterUndelete(newRecords, newOpportunityLineItemMap) Signature public void afterUndelete(List<OpportunityLineItem> newRecords, Map<ID, sObject> newOpportunityLineItemMap) afterUpdate(oldRecords, newRecords, oldOpportunityLineItemMap, newOpportunityLineItemMap) Signature public void afterUpdate(List<OpportunityLineItem> oldRecords, List<OpportunityLineItem> newRecords, Map<ID, sObject> oldOpportunityLineItemMap, Map<ID, sObject> newOpportunityLineItemMap) asignarEquipajeNegocios(tiquetes) Signature public static void asignarEquipajeNegocios(List<OpportunityLineItem> tiquetes) beforeDelete(oldRecords, oldOpportunityLineItemMap) Signature public void beforeDelete(List<OpportunityLineItem> oldRecords, Map<ID, sObject> oldOpportunityLineItemMap) beforeInsert(newRecords) Signature public void beforeInsert(List<OpportunityLineItem> newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) Signature public void beforeUpdate(List<OpportunityLineItem> oldRecords, List<OpportunityLineItem> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap) evitarSobreventa() Signature public static void evitarSobreventa(List<OpportunityLineItem > TiqueteNew)"
    },
    {
        "title": "TiqueteTriggerHandlerTest",
        "fileName": "TiqueteTriggerHandlerTest.html",
        "text": "TiqueteTriggerHandlerTest Signature @isTest public with sharing class TiqueteTriggerHandlerTest TiqueteTriggerHandlerTest Methods makeData() PasajeroYEquipaje() sobreventa() makeData() Signature @TestSetup static void makeData() PasajeroYEquipaje() Signature @isTest static void PasajeroYEquipaje() sobreventa() Signature @isTest static void sobreventa()"
    },
    {
        "title": "TriggerHandler",
        "fileName": "TriggerHandler.html",
        "text": "TriggerHandler Signature public interface TriggerHandler TriggerHandler Methods afterDelete(oldRecords, oldRecordMap) afterInsert(newRecords, newRecordMap) afterUndelete(newRecords, newRecordMap) afterUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) beforeDelete(oldRecords, oldRecordMap) beforeInsert(newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) afterDelete(oldRecords, oldRecordMap) Signature void afterDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap) afterInsert(newRecords, newRecordMap) Signature void afterInsert(List<SObject> newRecords, Map<ID, SObject> newRecordMap) afterUndelete(newRecords, newRecordMap) Signature void afterUndelete(List<SObject> newRecords, Map<ID, SObject> newRecordMap) afterUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) Signature void afterUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<ID, SObject> oldRecordMap, Map<ID, SObject> newRecordMap) beforeDelete(oldRecords, oldRecordMap) Signature void beforeDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap) beforeInsert(newRecords) Signature void beforeInsert(List<SObject> newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) Signature void beforeUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<ID, SObject> oldRecordMap, Map<ID, SObject> newRecordMap)"
    },
    {
        "title": "Tripulacion",
        "fileName": "Tripulacion.html",
        "text": "Tripulacion Signature public with sharing class Tripulacion Tripulacion Methods obtenerAxiliares(idVuelo) obtenerPilotos() obternerVuelos() saveAuxiliares(auxiliares, idvuelo) obtenerAxiliares(idVuelo) Signature @AuraEnabled(cacheable = true) public static List<opcion> obtenerAxiliares(String idVuelo) obtenerPilotos() Signature @AuraEnabled public static List<Contact> obtenerPilotos() obternerVuelos() Signature @AuraEnabled(cacheable = true) public static List<vuelo> obternerVuelos() saveAuxiliares(auxiliares, idvuelo) Signature @AuraEnabled public static void saveAuxiliares(List<string> auxiliares, string idvuelo) Tripulacion.AuraHandledException Signature public class AuraHandledException extends Exception Tripulacion.opcion Signature public class opcion Tripulacion.opcion Properties Name Signature Annotations label public string label @AuraEnabled selected public Boolean selected @AuraEnabled value public string value @AuraEnabled Tripulacion.opcion Constructors opcion(label, value, selected) opcion(label, value, selected) Signature public opcion(String label, String value, Boolean selected) Tripulacion.vuelo Signature public class vuelo Tripulacion.vuelo Properties Name Signature Annotations codVuelo public string codVuelo @AuraEnabled copiloto public Boolean copiloto @AuraEnabled idVuelo public string idVuelo @AuraEnabled numAuxiliares public Integer numAuxiliares @AuraEnabled numAuxiliaresFaltantes public Integer numAuxiliaresFaltantes @AuraEnabled piloto public Boolean piloto @AuraEnabled Tripulacion.vuelo Constructors vuelo(id, name, auxiliares, copilotoId, pilotoId, sizeTripulantes) vuelo(id, name, auxiliares, copilotoId, pilotoId, sizeTripulantes) Signature public vuelo(String id, String name, Integer auxiliares, String copilotoId, String pilotoId, Integer sizeTripulantes)"
    },
    {
        "title": "TripulacionTest",
        "fileName": "TripulacionTest.html",
        "text": "TripulacionTest Signature @isTest public with sharing class TripulacionTest TripulacionTest Methods guardaAuxiliares() makeData() obtenerAuxiliares() obtenerTripulantes() obtenerVuelosTodos() guardaAuxiliares() Signature @isTest private static void guardaAuxiliares() makeData() Signature @TestSetup static void makeData() obtenerAuxiliares() Signature @isTest private static void obtenerAuxiliares() obtenerTripulantes() Signature @isTest private static void obtenerTripulantes() obtenerVuelosTodos() Signature @isTest private static void obtenerVuelosTodos()"
    },
    {
        "title": "VueloTriggerHandler",
        "fileName": "VueloTriggerHandler.html",
        "text": "VueloTriggerHandler Signature public with sharing class VueloTriggerHandler implements TriggerHandler VueloTriggerHandler Properties Name Signature triggerIsExecuting private boolean triggerIsExecuting triggerSize private integer triggerSize VueloTriggerHandler Constructors VueloTriggerHandler(triggerIsExecuting, triggerSize) VueloTriggerHandler(triggerIsExecuting, triggerSize) Signature public VueloTriggerHandler(boolean triggerIsExecuting, integer triggerSize) VueloTriggerHandler Methods afterDelete(oldRecords, oldRecordMap) afterInsert(newRecords, newRecordMap) afterUndelete(newRecords, newRecordMap) afterUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) beforeDelete(oldRecords, oldRecordMap) beforeInsert(newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) desactiStringVuelo(vuelos) nombrarVuelo(vuelos) afterDelete(oldRecords, oldRecordMap) Signature public void afterDelete(List<Product2> oldRecords, Map<ID, sObject> oldRecordMap) afterInsert(newRecords, newRecordMap) Signature public void afterInsert(List<Product2> newRecords, Map<ID, sObject> newRecordMap) afterUndelete(newRecords, newRecordMap) Signature public void afterUndelete(List<Product2> newRecords, Map<ID, sObject> newRecordMap) afterUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) Signature public void afterUpdate(List<Product2> oldRecords, List<Product2> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap) beforeDelete(oldRecords, oldRecordMap) Signature public void beforeDelete(List<Product2> oldRecords, Map<ID, sObject> oldRecordMap) beforeInsert(newRecords) Signature public void beforeInsert(List<Product2> newRecords) beforeUpdate(oldRecords, newRecords, oldRecordMap, newRecordMap) Signature public void beforeUpdate(List<Product2> oldRecords, List<Product2> newRecords, Map<ID, sObject> oldRecordMap, Map<ID, sObject> newRecordMap) desactiStringVuelo(vuelos) Signature public void desactiStringVuelo(List<Product2> vuelos) nombrarVuelo(vuelos) Signature public void nombrarVuelo(List<Product2> vuelos)"
    }
];
