(defmodule createProfile)
;Reglas definidas para ClassifyUser
(deftemplate usuario
    (slot edad (type NUMBER))
    (slot tiempoJuego(type SYMBOL)(allowed-values poco medio mucho))
    (slot dificultad(type SYMBOL)(allowed-values facil media dificil))
    (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles))
    (slot presupuesto (type NUMBER))
    (slot numeroJugadores(type SYMBOL)(allowed-values uno, dos, MasDeDos))
)

(deftemplate juego
        (slot nombre (type SYMBOL))
        (slot tipoJuego(type SYMBOL)(allowed-values deporte, inteligencia, aventura, familia))
        (slot numeroJugadores(Type SYMBOL)(allowed-values uno, dos, MasDeDos))
        (slot dificultad (type SYMBOL)(allowed-values facil media dificil))
        (slot tiempoJuego (type SYMBOL)(allowed-values poco medio mucho))
        (slot precio (type NUMBER))
)

/*********************************************
************* Rules for the game *************
*********************************************/

(defrule createProfile::Poco_tiempo
    (usuario {tiempoJuego == poco})
        =>
    (assert (Tiempo Poco))
)

(defrule createProfile::Medio_tiempo
    (usuario {tiempoJuego == medio})
        =>
    (assert (Tiempo medio))
)

(defrule createProfile::Mucho_tiempo
    (usuario {tiempoJuego == mucho})
        =>
    (assert (Tiempo mucho))
)

(defrule createProfile::Un_Jugadores
    (usuario {numeroJugadores == uno})
        =>
    (assert (Jugadores Uno))
)

(defrule createProfile::Dos_Jugadores
    (usuario {numeroJugadores == dos})
        =>
    (assert (Jugadores dos))
)

(defrule createProfile::MasDos_Jugadores
    (usuario {numeroJugadores == MasDos})
        =>
    (assert (Jugadores MasDos))
)

(defrule createProfile::Familia_aficcion
    (usuario {aficion == hogar})
        =>
    (assert (TipoBuscado hogar))
)
/*
(defrule createProfile::createTipoBuscado
    (assert (TipoBuscado ?aficion))
)
*/
(defrule createProfile::Deporte_aficcion
    (usuario {aficion == salud})
        =>
    (assert (TipoBuscado salud))
)

(defrule createProfile::Aventura_aficcion
    (usuario {aficion == viajar})
        =>
    (assert (TipoBuscado viajar))
)

(defrule createProfile::Inteligencia_aficcion
    (usuario {aficion == puzzles})
        =>
    (assert (TipoBuscado puzzles))
)

(defrule createProfile::Mas18_Edad
    (usuario {edad > 18})
        =>
    (assert (Edad Mas18))
    (assert (Edad Mas13))
    (assert (Edad TP))
)

(defrule createProfile::Mas13_Edad
    (usuario {edad > 13})
        =>
    (assert (Edad Mas13))
    (assert (Edad TP))
)

(defrule createProfile::TP_Edad
    (usuario {edad > 0})
        =>
    (assert (Edad TP))
)

/*********************************************
************* Facts of games *************
*********************************************/

;(defmodule ClassifyGames)
;Reglas definidas para ClassifyGames

(assert (juego(nombre Trivial)
       (numeroJugadores MasDeDos)
       (dificultad media)
       (tiempoJuego mucho)
       (precio 30)))
       
(assert (juego(nombre SportTrivial)
       (numeroJugadores MasDeDos)
       (dificultad media)
       (tiempoJuego mucho)
       (precio 20)))

;(defmodule MatchUsersAndGames)
;Reglas definidas para MatchUsersAndGames