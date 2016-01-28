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
        (slot tipoJuego(Type SYMBOL)(allowed-values inteligencia, deporte, aventura, familiar))
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

/**********************************************
**************** Classify games ***************
***********************************************/

;(defmodule ClassifyGames)
;Reglas definidas para ClassifyGames

; Juegos de inteligencia
 
(assert (juego(nombre Damas)
       (numeroJugadores dos)
       (tipoJuego inteligencia)
       (dificultad media)
       (tiempoJuego medio)
       (precio 30)))
       
(assert (juego(nombre Ajedrez)
       (numeroJugadores dos)
       (tipoJuego inteligencia)
       (dificultad dificil)
       (tiempoJuego mucho)
       (precio 30)))
       
(assert (juego(nombre Trivial)
       (numeroJugadores MasDeDos)
       (tipoJuego inteligencia)
       (dificultad media)
       (tiempoJuego mucho)
       (precio 30)))
       
; Juegos Deportes

(assert (juego(nombre SportTrivial)
       (numeroJugadores MasDeDos)
       (tipoJuego deporte)
       (dificultad dificil)
       (tiempoJuego mucho)
       (precio 20)))
       
(assert (juego(nombre PlayTennis)
       (numeroJugadores dos)
       (tipoJuego deporte)
       (dificultad media)
       (tiempoJuego poco)
       (precio 18)))
       
(assert (juego(nombre Basket)
       (numeroJugadores uno)
       (tipoJuego deporte)
       (dificultad facil)
       (tiempoJuego poco)
       (precio 18)))
       
; Juegos en familia

(assert (juego(nombre Los Hombres Lobo de Castronegro)
       (numeroJugadores MasDeDos)
       (tipoJuego familiar)
       (dificultad facil)
       (tiempoJuego poco)
       (precio 12)))
       
(assert (juego(nombre Monopoli)
       (numeroJugadores MasDeDos)
       (tipoJuego familiar)
       (dificultad media)
       (tiempoJuego medio)
       (precio 39)))
       
(assert (juego(nombre Twister)
       (numeroJugadores MasDeDos)
       (tipoJuego familiar)
       (dificultad dificil)
       (tiempoJuego mucho)
       (precio 10)))
       
; Juegos de aventura
       
(assert (juego(nombre The Walking dead)
       (numeroJugadores dos)
       (tipoJuego aventura)
       (dificultad facil)
       (tiempoJuego mucho)
       (precio 12)))
       
(assert (juego(nombre Worldcraft)
       (numeroJugadores MasDeDos)
       (tipoJuego aventura)
       (dificultad media)
       (tiempoJuego medio)
       (precio 17)))
       
(assert (juego(nombre Minecraft)
       (numeroJugadores uno)
       (tipoJuego aventura)
       (dificultad favil)
       (tiempoJuego mucho)
       (precio 22)))
       
;(defmodule MatchUsersAndGames)
;Reglas definidas para MatchUsersAndGames
