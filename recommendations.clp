(defmodule CreateUserProfile)
;Reglas definidas para ClassifyUser
(deftemplate usuario
    (slot edad (type NUMBER))
    (slot tiempoJuego(type NUMBER)(allowed-values poco medio mucho))
    (slot dificultad(type SYMBOL)(allowed-values facil medio dificil))
    (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles))
    (slot presupuesto (type NUMBER))
    (slot NumeroJugadores(type SYMBOL)(allowed-values uno, dos, mas de dos))
)

(defrule CreateUserProfile::Familia_1Jugador_PocoTiempo
    (usuario {aficion == hogar} {tiempoJuego == poco} {NumeroJugadores == uno})
    	=>
    (assert (TipoJugador Familia_1_poco))
    )


(defmodule ClassifyGames)
;Reglas definidas para ClassifyGames


(defmodule MatchUsersAndGames)
;Reglas definidas para MatchUsersAndGames