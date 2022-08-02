@isTest
public with sharing class PiedraPapelTijeraTest {@isTest
    static void empatePiedra(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.PIEDRA, 'David', PiedraPapelTijera.jugada.PIEDRA);
        system.assertEquals(PiedraPapelTijera.jugada.PIEDRA, ganador.jugada);
        system.assertEquals('Se ha producido un empate', ganador.jugador);
    }
    
    @isTest
    static void empatePapel(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.PAPEL, 'David', PiedraPapelTijera.jugada.PAPEL);
        system.assertEquals(PiedraPapelTijera.jugada.PAPEL, ganador.jugada);
        system.assertEquals('Se ha producido un empate', ganador.jugador);
    }

    @isTest
    static void empateTijera(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.TIJERA, 'David', PiedraPapelTijera.jugada.TIJERA);
        system.assertEquals(PiedraPapelTijera.jugada.TIJERA, ganador.jugada);
        system.assertEquals('Se ha producido un empate', ganador.jugador);
    }

    @isTest
    static void unoGanaPiedra(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.PIEDRA, 'David', PiedraPapelTijera.jugada.TIJERA);
        system.assertEquals(PiedraPapelTijera.jugada.PIEDRA, ganador.jugada);
        system.assertEquals('Juan', ganador.jugador);
    }

    @isTest
    static void unoGanaPAPEL(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.PAPEL, 'David', PiedraPapelTijera.jugada.PIEDRA);
        system.assertEquals(PiedraPapelTijera.jugada.PAPEL, ganador.jugada);
        system.assertEquals('Juan', ganador.jugador);
    }

    @isTest
    static void unoGanaTijera(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.TIJERA, 'David', PiedraPapelTijera.jugada.PAPEL);
        system.assertEquals(PiedraPapelTijera.jugada.TIJERA, ganador.jugada);
        system.assertEquals('Juan', ganador.jugador);
    }

    @isTest
    static void dosGanaPiedra(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.TIJERA, 'David', PiedraPapelTijera.jugada.PIEDRA);
        system.assertEquals(PiedraPapelTijera.jugada.PIEDRA, ganador.jugada);
        system.assertEquals('David', ganador.jugador);
    }

    @isTest
    static void dosGanaPAPEL(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.PIEDRA, 'David', PiedraPapelTijera.jugada.PAPEL);
        system.assertEquals(PiedraPapelTijera.jugada.PAPEL, ganador.jugada);
        system.assertEquals('David', ganador.jugador);
    }

    @isTest
    static void dosGanaTijera(){
        PiedraPapelTijera.resultado ganador = PiedraPapelTijera.jugada('Juan', PiedraPapelTijera.jugada.PAPEL, 'David', PiedraPapelTijera.jugada.TIJERA);
        system.assertEquals(PiedraPapelTijera.jugada.TIJERA, ganador.jugada);
        system.assertEquals('David', ganador.jugador);
    }

    @isTest
    static void nombreVacio(){
        try {
            PiedraPapelTijera.resultado vacio = PiedraPapelTijera.jugada(null, PiedraPapelTijera.jugada.PAPEL, 'David', PiedraPapelTijera.jugada.TIJERA);
        } catch (Exception e) {
            system.assertEquals('Se deben ingresar los dos jugadores.', e.getMessage());
        }
    }

    @isTest
    static void jugadaVacia(){
        try {
            PiedraPapelTijera.resultado vacio = PiedraPapelTijera.jugada('Juan',null, 'David', PiedraPapelTijera.jugada.TIJERA);
        } catch (Exception e) {
            system.assertEquals('Los dos jugadores deben realizar una jugada.', e.getMessage());
        }
    }
}